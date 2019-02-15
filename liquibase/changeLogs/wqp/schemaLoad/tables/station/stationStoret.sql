create unlogged table if not exists ${schemaName}.station_storet
partition of ${schemaName}.station
for values in (3)
with (fillfactor = 100)
;
