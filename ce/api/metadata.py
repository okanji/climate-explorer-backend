'''module for requesting metadata for one single file through the API
'''

from modelmeta import DataFile
from sqlalchemy.orm.exc import NoResultFound

def metadata(sesh, model_id):
    '''Delegate for performing a metadata lookup for one single file

    Multi-paragraph

    Args:
        sesh (sqlalchemy.orm.session.Session): A database Session object
        model_id (str): Unique id which is a key to the data file requested

    Returns:
        dict: Empty dictionary if model_id is not found in the database.

        Otherwise returns a single dict with the key of the file's
        unique_id and the value being a nested dict with keys:
        'institution', 'model_id', 'model_name', 'experiment',
        'ensemble_member' (run_name?), and 'variables'.

        'variables' is a nested dict of netcdf variable name, long
        variable description pars.

        For example::

            {
                'tmax_monClim_PRISM_historical_run1_198101-201012':
                {
                    'institution': 'Pacific Climate Impacts Consortium',
                    'model_id': 'BCSD+ANUSPLIN300+CCSM4',
                    'model_name': 'CCSM4 GCM data downscaled to '
                                  'ANUSPLINE grid using BCSD',
                    'experiment': 'historical+rcp45',
                    'ensemble_member': 'r1i1p1',
                    'variables':
                    {
                        'tasmax': 'Maximum daily temperature',
                        'tasmin': 'Minimum daily temperature',
                    }
              }
         }

    Raises:
        None?

    '''
    try:
        file_ = sesh.query(DataFile).filter(DataFile.unique_id == model_id).one()
    except NoResultFound:
        return {}

    vars = {
            dfv.netcdf_variable_name: a.long_name
                for a, dfv in [
                        (dfv.variable_alias, dfv) for dfv in file_.data_file_variables
                ]
    }

    run = file_.run
    model = run.model
    return {
        model_id: {
            'institution': model.organization,
            'model_id': model.short_name,
            'model_name': model.long_name,
            'experiment': run.emission.short_name,
            'variables': vars,
            'ensemble_member': run.name
        }
    }
