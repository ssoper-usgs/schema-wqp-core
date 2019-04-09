create unlogged table if not exists ${WQP_SCHEMA_NAME}.station_sum_biodata
partition of ${WQP_SCHEMA_NAME}.station_sum
for values in (4)
with (fillfactor = 100)
;
