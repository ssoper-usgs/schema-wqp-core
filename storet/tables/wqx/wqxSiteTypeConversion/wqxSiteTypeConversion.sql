create table wqx_site_type_conversion
(mltyp_uid                      number              constraint nn_wqx_site_type_conversion_pk not null
,mltyp_name                     varchar2(45 char)
,station_group_type             varchar2(256 char)
,constraint wqx_site_type_conversion_pk
  primary key (mltyp_uid)
);
