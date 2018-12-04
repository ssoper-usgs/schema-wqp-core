create unlogged table if not exists ${schemaName}.project_dim_stewards
partition of ${schemaName}.project_dim
for values in (1)
with (fillfactor = 100)
;
