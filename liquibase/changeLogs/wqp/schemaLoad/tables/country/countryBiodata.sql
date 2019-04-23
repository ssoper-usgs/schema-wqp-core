create unlogged table if not exists ${WQP_SCHEMA_NAME}.country_biodata
partition of ${WQP_SCHEMA_NAME}.country
for values in (4)
with (fillfactor = 100)
;
