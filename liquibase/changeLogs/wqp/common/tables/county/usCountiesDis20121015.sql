create unlogged table if not exists ${schemaName}.us_counties_dis_20121015
(fips                           character varying (5)
,area                           numeric
,perimeter                      numeric
,countyp010                     numeric
,state                          character varying (5)
,county_name                    character varying (50)
,state_fips                     character varying (2)
,square_mil                     numeric
,geom                           geometry
)
with (fillfactor = 100)
;
