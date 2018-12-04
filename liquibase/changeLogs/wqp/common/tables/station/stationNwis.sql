create unlogged table if not exists ${schemaName}.station_nwis
partition of ${schemaName}.station
for values in (2)
with (fillfactor = 100)
;
