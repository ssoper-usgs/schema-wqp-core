create unlogged table if not exists ${schemaName}.station_sum_stewards
partition of ${schemaName}.station_sum
for values in (1)
with (fillfactor = 100)
;
