create table station_sum_swap_nwis
(data_source_id                 number
,data_source                    varchar2(8 char)
,station_id                     number
,site_id                        varchar2(4000 char)
,organization                   varchar2(4000 char)
,site_type                      varchar2(4000 char)
,huc                            varchar2(12 char)
,governmental_unit_code         varchar2(9 char)
,geom                           mdsys.sdo_geometry
,result_count                   number
,huc_2                          generated always as (case when length(huc) > 1 then substr(huc,1,2) else null end)
,huc_4                          generated always as (case when length(huc) > 3 then substr(huc,1,4) else null end)
,huc_6                          generated always as (case when length(huc) > 5 then substr(huc,1,6) else null end)
,huc_8                          generated always as (case when length(huc) > 7 then substr(huc,1,8) else null end)
,huc_10                         generated always as (case when length(huc) > 9 then substr(huc,1,10) else null end)
,huc_12                         generated always as (case when length(huc) = 12 then substr(huc,1,12) else null end)
,country_code                   generated always as (regexp_substr(governmental_unit_code, '[^:]+'))
,state_code                     generated always as (regexp_substr(governmental_unit_code, '[^:]+:[^:]+'))
,county_code                    generated always as (regexp_substr(governmental_unit_code, '[^:]+:[^:]+:[^:]+'))
,activity_count                 number
)
parallel 4 compress pctfree 0 nologging cache;
