create unlogged table if not exists ${schemaName}.project_stewards
partition of ${schemaName}.project
for values in (1)
with (fillfactor = 100)
;
