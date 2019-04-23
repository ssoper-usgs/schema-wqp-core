create unlogged table if not exists ${WQP_SCHEMA_NAME}.result_biodata
partition of ${WQP_SCHEMA_NAME}.result
for values in (4)
with (fillfactor = 100)
;
