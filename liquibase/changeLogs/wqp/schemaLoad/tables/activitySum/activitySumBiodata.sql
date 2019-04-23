create unlogged table if not exists ${WQP_SCHEMA_NAME}.activity_sum_biodata
partition of ${WQP_SCHEMA_NAME}.activity_sum
for values in (4)
with (fillfactor = 100)
;
