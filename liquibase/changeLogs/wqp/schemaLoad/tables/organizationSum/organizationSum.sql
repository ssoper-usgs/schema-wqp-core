create unlogged table if not exists ${schemaName}.organization_sum
(data_source_id                 smallint
,data_source                    character varying (8)
,organization_id                numeric
,organization                   text
,organization_name              text
,organization_url               text
,all_time_last_result           date
,all_time_site_count            integer
,all_time_activity_count        integer
,five_year_last_result          date
,five_year_site_count           integer
,five_year_activity_count       integer
,current_year_last_result       date
,current_year_site_count        integer
,current_year_activity_count    integer
,all_time_summary               json
,five_year_summary              json
,current_year_summary           json
,organization_type              text
)
partition by list (data_source_id)
;
