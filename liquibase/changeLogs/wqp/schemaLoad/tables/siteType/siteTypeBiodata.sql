create unlogged table if not exists ${WQP_SCHEMA_NAME}.site_type_biodata
partition of ${WQP_SCHEMA_NAME}.site_type
for values in (4)
with (fillfactor = 100)
;
