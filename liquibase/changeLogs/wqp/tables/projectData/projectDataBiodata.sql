create unlogged table if not exists ${schemaName}.project_data_biodata
partition of ${schemaName}.project_data
for values in (4)
with (fillfactor = 100)
;
