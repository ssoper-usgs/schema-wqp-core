create unlogged table if not exists ${schemaName}.project_dim
(data_source_id                 smallint
,code_value                     text
,project_dim_value              text
)
partition by list (data_source_id)
;
