create unlogged table if not exists ${WQP_SCHEMA_NAME}.monitoring_loc
(data_source_id                 smallint
,code_value                     text
,description                    text
,organization                   text
,search_text                    text
)
partition by list (data_source_id)
;
