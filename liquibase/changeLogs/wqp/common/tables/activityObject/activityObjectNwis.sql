create unlogged table if not exists ${schemaName}.activity_object_nwis
partition of ${schemaName}.activity_object
for values in (2)
with (fillfactor = 100)
;
