create unlogged table if not exists ${WQP_SCHEMA_NAME}.project_biodata
partition of ${WQP_SCHEMA_NAME}.project
for values in (4)
with (fillfactor = 100)
;
