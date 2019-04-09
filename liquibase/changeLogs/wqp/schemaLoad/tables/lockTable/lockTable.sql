create unlogged table if not exists ${WQP_SCHEMA_NAME}.lock_table
(lock_value                     smallint
)
with (fillfactor = 100)
;
