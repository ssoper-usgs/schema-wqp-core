create unlogged table if not exists ${WQP_SCHEMA_NAME}.county
(data_source_id                 smallint
,code_value                     text
,description                    text
,description_wo_country_state   text
)
partition by list (data_source_id)
;
