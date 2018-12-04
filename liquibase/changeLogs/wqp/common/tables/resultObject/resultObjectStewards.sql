create unlogged table if not exists ${schemaName}.result_object_stewards
partition of ${schemaName}.result_object
for values in (1)
with (fillfactor = 100)
;
