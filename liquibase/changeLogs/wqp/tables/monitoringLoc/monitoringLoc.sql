create unlogged table if not exists ${schemaName}.monitoring_loc
(data_source_id                 smallint
,code_value                     text
,description                    text
,organization                   text
,text                           text
)
partition by list (data_source_id)
;
