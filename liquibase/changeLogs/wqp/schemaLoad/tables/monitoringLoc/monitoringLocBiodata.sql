create unlogged table if not exists ${WQP_SCHEMA_NAME}.monitoring_loc_biodata
partition of ${WQP_SCHEMA_NAME}.monitoring_loc
for values in (4)
with (fillfactor = 100)
;
