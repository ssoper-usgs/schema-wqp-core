create unlogged table if not exists ${schemaName}.station_object_stewards
partition of ${schemaName}.station_object
for values in (1)
with (fillfactor = 100)
;
