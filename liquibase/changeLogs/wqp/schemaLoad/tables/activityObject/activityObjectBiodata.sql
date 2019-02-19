create unlogged table if not exists ${schemaName}.activity_object_biodata
partition of ${schemaName}.activity_object
for values in (4)
with (fillfactor = 100)
;
