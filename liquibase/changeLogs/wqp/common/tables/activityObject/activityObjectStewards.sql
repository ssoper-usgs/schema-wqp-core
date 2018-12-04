create unlogged table if not exists ${schemaName}.activity_object_stewards
partition of ${schemaName}.activity_object
for values in (1)
with (fillfactor = 100)
;
