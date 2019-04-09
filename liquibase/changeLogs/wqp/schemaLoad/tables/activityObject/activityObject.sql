create unlogged table if not exists ${WQP_SCHEMA_NAME}.activity_object
(data_source_id                 smallint
,object_id                      numeric
,data_source                    character varying (8)
,activity_id                    numeric
,organization                   text
,activity                       text
,object_name                    text
,object_type                    text
,object_content                 bytea
)
partition by list (data_source_id)
;
