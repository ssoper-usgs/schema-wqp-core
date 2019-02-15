create unlogged table if not exists ${schemaName}.project_dim_storet
partition of ${schemaName}.project_dim
for values in (3)
with (fillfactor = 100)
;
