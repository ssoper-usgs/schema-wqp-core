create unlogged table if not exists ${schemaName}.project_object_stewards
partition of ${schemaName}.project_object
for values in (1)
with (fillfactor = 100)
;
