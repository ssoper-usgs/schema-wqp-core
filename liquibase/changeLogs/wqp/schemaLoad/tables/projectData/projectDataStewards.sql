create unlogged table if not exists ${schemaName}.project_data_stewards
partition of ${schemaName}.project_data
for values in (1)
with (fillfactor = 100)
;
