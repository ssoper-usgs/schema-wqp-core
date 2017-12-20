create table nwis_station_local
(station_id                     number
,site_id                        varchar2(4000 char)
,latitude                       number
,longitude                      number
,huc                            varchar2(12 char)
,calculated_huc_12              varchar2(12 char)
,geom                           mdsys.sdo_geometry
,constraint nwis_station_local_pk
  primary key (station_id)
) parallel 4 compress nologging cache;
