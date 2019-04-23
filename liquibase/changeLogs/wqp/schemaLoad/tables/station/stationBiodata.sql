create unlogged table if not exists ${WQP_SCHEMA_NAME}.station_biodata
partition of ${WQP_SCHEMA_NAME}.station
for values in (4)
with (fillfactor = 100)
;
