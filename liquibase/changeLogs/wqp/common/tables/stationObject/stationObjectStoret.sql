create unlogged table if not exists ${schemaName}.station_object_storet
partition of ${schemaName}.station_object
for values in (3)
with (fillfactor = 100)
;
