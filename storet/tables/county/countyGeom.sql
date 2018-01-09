create table county_geom
(fips_county_code                 varchar2(3 char)
,county_name                      varchar2(256 char)
,geom                             sdo_geometry
,fips_state_code                  varchar2(4 char)
,state_postal_code                varchar2(2 char)
,state_name                       varchar2(256 char)
,country_code                     varchar2(2 char)
,country_name                     varchar2(256 char)
);
