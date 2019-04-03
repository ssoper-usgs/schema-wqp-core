create unlogged table if not exists ${WQP_SCHEMA_NAME}.state_biodata
partition of ${WQP_SCHEMA_NAME}.state
for values in (4)
with (fillfactor = 100)
;
