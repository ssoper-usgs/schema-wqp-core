create table huc8_geom_lookup
(shape_area                     number(19,11)
,sourcefeat                     varchar2(40 byte)
,areasqkm                       number(19,11)
,metasource                     varchar2(40 byte)
,sourceorig                     varchar2(130 byte)
,huc8                           varchar2(8 byte)
,loaddate                       date
,tnmid                          varchar2(40 byte)
,areaacres                      number(19,11)
,gnis_id                        number(9,0)
,name                           varchar2(120 byte)
,sourcedata                     varchar2(100 byte)
,states                         varchar2(50 byte)
,shape_leng                     number(19,11)
,huc8id                         number(9,0)
,geom                           sdo_geometry
) parallel 4 compress pctfree 0 nologging;
