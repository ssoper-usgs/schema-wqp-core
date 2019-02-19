create unlogged table if not exists ${schemaName}.project_dim_biodata
partition of ${schemaName}.project_dim
for values in (4)
with (fillfactor = 100)
;
