create unlogged table if not exists ${schemaName}.activity_object_storet
partition of ${schemaName}.activity_object
for values in (3)
with (fillfactor = 100)
;
