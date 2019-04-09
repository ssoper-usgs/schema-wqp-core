create unlogged table if not exists ${WQP_SCHEMA_NAME}.org_data_biodata
partition of ${WQP_SCHEMA_NAME}.org_data
for values in (4)
with (fillfactor = 100)
;
