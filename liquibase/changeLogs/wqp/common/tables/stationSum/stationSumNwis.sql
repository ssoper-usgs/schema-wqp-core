create unlogged table if not exists ${schemaName}.station_sum_nwis
partition of ${schemaName}.station_sum
for values in (2)
with (fillfactor = 100)
;
