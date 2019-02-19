create unlogged table if not exists ${schemaName}.station_object_nwis
partition of ${schemaName}.station_object
for values in (2)
with (fillfactor = 100)
;
