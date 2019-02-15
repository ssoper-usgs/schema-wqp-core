create unlogged table if not exists ${schemaName}.station_stewards
partition of ${schemaName}.station
for values in (1)
with (fillfactor = 100)
;
