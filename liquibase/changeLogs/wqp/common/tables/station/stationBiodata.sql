create unlogged table if not exists ${schemaName}.station_biodata
partition of ${schemaName}.station
for values in (4)
with (fillfactor = 100)
;
