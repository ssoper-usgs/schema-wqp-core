create table us_counties_dis_20121015
(fips                           varchar2(5 char)
,area                           float(63)
,perimeter                      float(63)
,countyp010                     float(63)
,state                          varchar2(5 char)
,county_name                    varchar2(50 char)
,state_fips                     varchar2(2 char)
,square_mil                     float(63)
,geom                           mdsys.sdo_geometry
);
