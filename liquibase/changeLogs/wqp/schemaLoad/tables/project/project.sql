create unlogged table if not exists ${WQP_SCHEMA_NAME}.project
(data_source_id                 smallint
,code_value                     text
,description                    text
)
partition by list (data_source_id)
;
