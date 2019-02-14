create unlogged table if not exists ${schemaName}.result_stewards
partition of ${schemaName}.result
for values in (1)
with (fillfactor = 100)
;
