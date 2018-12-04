create unlogged table if not exists ${schemaName}.station_sum_biodata
partition of ${schemaName}.station_sum
for values in (4)
with (fillfactor = 100)
;
