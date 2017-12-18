create table nwis_station_local
(station_source                 varchar2(7 char)
,station_id                     number
,site_id                        varchar2(4000 char)
,latitude                       number
,longitude                      number
,hrdat_uid                      number
,huc                            varchar2(12 char)
,cntry_cd                       varchar2(2 char)
,st_fips_cd                     varchar2(2 char)
,cnty_fips_cd                   varchar2(3 char)
,calculated_huc_12              varchar2(12 char)
,calculated_fips                varchar2(5 char)
,geom                           mdsys.sdo_geometry
,constraint nwis_station_local_pk
  primary key (station_source,station_id)
,constraint nwis_station_local_uk
  unique (station_source,site_id)
) parallel 4 compress nologging cache;
