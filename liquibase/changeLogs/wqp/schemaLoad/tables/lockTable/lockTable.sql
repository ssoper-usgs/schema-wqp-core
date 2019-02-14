create unlogged table if not exists ${schemaName}.lock_table
(lock_value                     smallint
)
with (fillfactor = 100)
;
