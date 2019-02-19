create unlogged table if not exists ${schemaName}.project_dim_nwis
partition of ${schemaName}.project_dim
for values in (2)
with (fillfactor = 100)
;
