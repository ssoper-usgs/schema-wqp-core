create unlogged table if not exists ${WQP_SCHEMA_NAME}.station_object
(data_source_id                 smallint
,object_id                      numeric
,data_source                    character varying (8)
,organization                   text
,station_id                     numeric
,site_id                        text
,object_name                    text
,object_type                    text
,object_content                 bytea
) 
partition by list (data_source_id)
;
