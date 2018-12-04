create unlogged table if not exists ${schemaName}.project_data_storet
partition of ${schemaName}.project_data
for values in (3)
with (fillfactor = 100)
;
