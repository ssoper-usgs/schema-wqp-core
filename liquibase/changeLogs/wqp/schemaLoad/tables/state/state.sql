create unlogged table if not exists ${WQP_SCHEMA_NAME}.state
(data_source_id                 smallint
,code_value                     text
,description_with_country       character varying (57)
,description_with_out_country   character varying (53)
)
partition by list (data_source_id)
;
