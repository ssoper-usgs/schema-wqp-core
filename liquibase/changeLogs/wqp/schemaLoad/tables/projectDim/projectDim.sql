create unlogged table if not exists ${WQP_SCHEMA_NAME}.project_dim
(data_source_id                 smallint
,code_value                     text
,project_dim_value              text
)
partition by list (data_source_id)
;
