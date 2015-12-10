'''module for requsting summary statistics, averaged across a region
'''

import numpy as np
import numpy.ma as ma
from sqlalchemy.orm.exc import NoResultFound

from modelmeta import DataFile, Time

from ce.api.util import get_array, get_units_from_netcdf_file, mean_datetime

def stats(sesh, id_, time, area, variable):
    '''Request and calculate summary statistics averaged across a region

    For performing regional analysis, one typically wants to summarize
    statistical information across a region. This call allows one to
    request either a single timestep (or an average across all
    timesteps), and averaged across all cells within the given region.

    The stats call may only be called for a single data file and single
    variable per invocation.

    Args:
        sesh (sqlalchemy.orm.session.Session): A database Session object
        id_ (str): Unique id which is a key to the data file requested
        time (int): Timestep integer (1-17) representing the time of year
        area (str): WKT polygon of selected area
        variable (str): Short name of the variable to be returned

    Returns:
        dict: Empty dictionary if model_id is not found in the database.

        Otherwise, returns a single dict with the key of the file's
        unique_id and the value consisting of a nested dictionary with
        the following attributes: 'mean', 'stdev', 'min', 'max',
        'median', 'ncells', 'units', 'time'.

        For example ::

            {'file0':
                {
                    'mean': 303.97227647569446,
                    'stdev': 8.428096450998078,
                    'min': 288.71807861328125,
                    'max': 318.9695739746094,
                    'median': 301.61065673828125,
                    'ncells': 72,
                    'units': 'K',
                    'time': '1985-06-30T12:00:00Z'
                }
            }

    Raises:
        Exception in several cases:

        1. The file pointed to by `id_` does not exist in the filesystem
        2. The requested variable does not exist in the given file
    '''
    try:
        df = sesh.query(DataFile).filter(DataFile.unique_id == id_).one()
        fname = df.filename
    except NoResultFound:
        return {}

    array = get_array(fname, time, area, variable)
    stats = array_stats(array)

    query = sesh.query(Time.timestep).filter(Time.time_set_id == df.timeset.id)
    if time:
        query.filter(Time.time_idx == time)
    timevals = [ t for t, in query.all() ]
    timeval = mean_datetime(timevals)

    stats.update({
        'units': get_units_from_netcdf_file(fname, variable),
        'time': timeval.strftime('%Y-%m-%dT%H:%M:%SZ')
    })
    return {id_: stats}

def array_stats(array):
    '''Return the min, max, mean, median, standard deviation and number
       of cells of a 3d data grid (numpy.ma.MaskedArray)
    '''
    return {
        'min': np.asscalar(np.min(array)),
        'max': np.asscalar(np.max(array)),
        'mean': np.asscalar(np.mean(array)),
        'median': np.asscalar(ma.median(array)),
        'stdev': np.asscalar(np.std(array)),
        'ncells': array.compressed().size
    }
