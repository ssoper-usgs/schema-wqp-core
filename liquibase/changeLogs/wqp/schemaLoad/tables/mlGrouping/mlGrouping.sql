create unlogged table if not exists ${schemaName}.ml_grouping
(data_source_id                 smallint
,data_source                    character varying (8)
,station_id                     numeric
,the_year                       smallint
,years_window                   smallint
,characteristic_type            text
,characteristic_name            text
,total_activities               integer
,total_results                  integer
,last_result_date               date
,grouping_id                    smallint
)
partition by list (data_source_id)
;
