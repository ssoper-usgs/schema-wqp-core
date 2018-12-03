create unlogged table if not exists ${schemaName}.station_sum
(data_source_id                 smallint
,data_source                    character varying (8)
,station_id                     numeric
,site_id                        text
,organization                   text
,site_type                      text
,huc                            character varying (12)
,governmental_unit_code         character varying (9)
,geom                           geometry
,result_count                   integer
,activity_count                 integer
,summary_past_12_months         json
,summary_past_60_months         json
,summary_all_months             json
,activity_count_past_12_months  integer
,activity_count_past_60_months  integer
,result_count_past_12_months    integer
,result_count_past_60_months    integer
,organization_name              text
,station_name                   text
,station_type_name              text
,country_name                   text
,state_name                     character varying (57)
,county_name                    text
)
partition by list (data_source_id)
;
