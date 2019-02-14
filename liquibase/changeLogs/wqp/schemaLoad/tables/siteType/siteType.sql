create unlogged table if not exists ${schemaName}.site_type
(data_source_id                 smallint
,code_value                     text
,description                    text
)
partition by list (data_source_id)
;
