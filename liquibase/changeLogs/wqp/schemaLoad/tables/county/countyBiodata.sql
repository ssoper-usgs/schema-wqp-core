create unlogged table if not exists ${WQP_SCHEMA_NAME}.county_biodata
partition of ${WQP_SCHEMA_NAME}.county
for values in (4)
with (fillfactor = 100)
;
