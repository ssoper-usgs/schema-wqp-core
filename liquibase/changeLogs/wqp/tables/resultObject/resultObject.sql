create unlogged table if not exists ${schemaName}.result_object
(data_source_id                 smallint
,object_id                      numeric
,data_source                    character varying (8)
,organization                   text
,activity_id                    numeric
,activity                       text
,result_id                      numeric
,object_name                    text
,object_type                    text
,object_content                 bytea
)
partition by list (data_source_id)
;
