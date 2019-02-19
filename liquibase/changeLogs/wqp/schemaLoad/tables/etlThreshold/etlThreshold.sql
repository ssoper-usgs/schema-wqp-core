create unlogged table if not exists ${schemaName}.etl_threshold
(data_source_id                 smallint
,table_name                     character varying (30)
,min_rows                       integer
,max_diff                       integer
)
with (fillfactor = 100)
;
