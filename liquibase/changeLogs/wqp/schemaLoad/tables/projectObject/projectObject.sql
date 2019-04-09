create unlogged table if not exists ${WQP_SCHEMA_NAME}.project_object
(data_source_id                 smallint
,object_id                      numeric
,data_source                    character varying (8)
,organization                   text
,project_identifier             text
,object_name                    text
,object_type                    text
,object_content                 bytea
)
partition by list (data_source_id)
;
