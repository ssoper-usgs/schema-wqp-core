create unlogged table if not exists ${schemaName}.last_etl
(data_source_id                 smallint
,completed_utc                  timestamp
)
with (fillfactor = 100)
;
