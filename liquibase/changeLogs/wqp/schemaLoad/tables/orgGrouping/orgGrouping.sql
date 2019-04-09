create unlogged table if not exists ${WQP_SCHEMA_NAME}.org_grouping
(data_source_id                 smallint
,data_source                    character varying (8)
,organization                   text
,the_year                       character varying (4)
,characteristic_type            text
,characteristic_name            text
,total_monitoring_locations     integer
,total_activities               integer
,total_results                  integer
,last_result_date               date
,grouping_id                    smallint
)
partition by list (data_source_id)
;
