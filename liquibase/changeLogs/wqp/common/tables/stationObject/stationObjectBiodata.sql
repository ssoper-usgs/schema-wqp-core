create unlogged table if not exists ${schemaName}.station_object_biodata
partition of ${schemaName}.station_object
for values in (4)
with (fillfactor = 100)
;
