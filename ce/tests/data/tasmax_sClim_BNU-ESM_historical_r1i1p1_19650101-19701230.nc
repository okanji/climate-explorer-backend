CDF      
      lon       bnds      lat       time              CDI       <Climate Data Interface version ?? (http://mpimet.mpg.de/cdi)   Conventions       CF-1.4     history      Mon Jul 17 10:45:13 2017: cdo -O seltimestep,13,14,15,16 /home/rglover/code/modelmeta/modelmeta/data/tiny_climo_gcm.nc /tmp/cdoPyrzxvq9r4
Fri Mar 24 09:55:37 2017: cdo -O copy /tmp/cdoPy5cyQsX /tmp/pytest-of-rglover/pytest-106/outdir0/tasmax_msaClim_BNU-ESM_historical_r1i1p1_19650101-19701230.nc
Fri Mar 24 09:55:37 2017: cdo -O copy /tmp/cdoPyeLWKtq /tmp/cdoPyKl6eqd /tmp/cdoPyGhRloV /tmp/cdoPy5cyQsX
Fri Mar 24 09:55:37 2017: cdo -O ymonmean /tmp/cdoPyuq_iXA /tmp/cdoPyeLWKtq
Fri Mar 24 09:55:37 2017: cdo -O seldate,1965-01-01,1970-12-30 /home/rglover/code/climate-explorer-backend/data_prep/dp/data/tiny_gcm.nc /tmp/cdoPyuq_iXA
Fri Apr 29 10:00:12 2016: ncks -d time,5475,9125 smaller_gcm.nc tiny_gcm.nc
Wed Mar  2 14:55:44 2016: ncks -d lat,21,24 -d lon,30,33 subset.tasmax_day_BNU-ESM_historical+rcp26_r1i1p1_19500101-21001231.nc smaller_gcm.nc
Mon Jul 20 14:32:06 2015: ncks -d lon,180.,320. -d lat,5.,85. ../output/BNU-ESM/tasmax_day_BNU-ESM_historical+rcp26_r1i1p1_19500101-21001231.nc ../output/BNU-ESM/subset.tasmax_day_BNU-ESM_historical+rcp26_r1i1p1_19500101-21001231.nc
Mon Jul 20 14:31:10 2015: cdo cat ../models/BNU/BNU-ESM/historical/day/atmos/day/r1i1p1/v20120312/tasmax/tasmax_day_BNU-ESM_historical_r1i1p1_19500101-20051231.nc ../models/BNU/BNU-ESM/rcp26/day/atmos/day/r1i1p1/v20120411/tasmax/tasmax_day_BNU-ESM_rcp26_r1i1p1_20060101-21001231.nc ../output/BNU-ESM/tasmax_day_BNU-ESM_historical+rcp26_r1i1p1_19500101-21001231.nc
2012-03-12T06:02:50Z CMOR rewrote data to comply with CF standards and CMIP5 requirements.    source        BNU-ESM    institution       GCESS,BNU,Beijing,China    institute_id      BNU    experiment_id         
historical     model_id      BNU-ESM    forcing       Nat,Ant    parent_experiment_id      	piControl      parent_experiment_rip         r1i1p1     branch_time                  contact       !Ji Duoying (duoyingji@bnu.edu.cn)      initialization_method               physics_version             tracking_id       $be760ebb-69c8-4f8b-9ed6-9c2b178178a0   product       output     
experiment        
historical     	frequency         sClim      creation_date         2012-03-12T06:02:54Z   
project_id        CMIP5      table_id      9Table day (26 July 2011) f21c16b785432e6bd3f72e80f2cade49      title         2BNU-ESM model output prepared for CMIP5 historical     parent_experiment         pre-industrial control     modeling_realm        atmos      realization             cmor_version      2.7.1      NCO       "4.5.1"    climo_start_time      1965-01-01T00:00:00Z   climo_end_time        1970-12-30T00:00:00Z   climo_tracking_id         $be760ebb-69c8-4f8b-9ed6-9c2b178178a0   CDO       @Climate Data Operators version 1.7.0 (http://mpimet.mpg.de/cdo)          lon                 standard_name         	longitude      	long_name         	longitude      units         degrees_east   axis      X      bounds        lon_bnds            lon_bnds                        @  0   lat                standard_name         latitude   	long_name         latitude   units         degrees_north      axis      Y      bounds        lat_bnds         p   lat_bnds                       @  �   time               standard_name         time   	long_name         time   climatology       climatology_bnds   units         days since 1950-1-1 00:00:00   calendar      365_day    axis      T           �   climatology_bnds                         �   tasmax                     	   standard_name         air_temperature    	long_name         *Daily Maximum Near-Surface Air Temperature     units         K      	grid_type         gaussian   
_FillValue        `�x�   missing_value         `�x�   cell_methods      time: maximum      history       J2012-03-12T06:02:42Z altered by CMOR: Treated scalar dimension: 'height'.      associated_files      �baseURL: http://cmip-pcmdi.llnl.gov/CMIP5/dataLocation gridspecFile: gridspec_atmos_fx_BNU-ESM_historical_r0i0p0.nc areacella: areacella_fx_BNU-ESM_historical_r0i0p0.nc          @  �@p�     @p�     @p�     @q     @po�    @p��    @p��    @pɀ    @pɀ    @p��    @p��    @q#�    @Pd��   @Q�`   @Q��   @R|�    @P��   @P�@�   @P�@�   @Qp�    @Qp�    @R#^`   @R#^`   @R���   @��     @�D     @��     Ct�JCt�Cu�pCv�Cr��Cr��Cr��CsM�CrACq�{CrSDCq��Cp�CpofCp��Cp�@�     @��     @�     C��C��C�ңC���C�+5C�vC��wC��pC��C���C���C��C��C���C���C�� @�o     @��     @�w     C���C�wOC��C���C�ҫC���C��C��KC��C� C�cC���C��lC���C�BC�Z�@��     @�V     @��     C���C��C� <C�y�C�o�C�s�C��C�{eC�p�C�3C�b�C�(C���C���C��SC�_�                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                