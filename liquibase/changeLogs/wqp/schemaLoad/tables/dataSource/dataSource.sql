create unlogged table if not exists ${schemaName}.data_source
(data_source_id                 smallint
,text                           character varying (8)
,primary key (data_source_id)
)
with (fillfactor = 100)
;
