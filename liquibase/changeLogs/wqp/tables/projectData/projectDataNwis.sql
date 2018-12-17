create unlogged table if not exists ${schemaName}.project_data_nwis
partition of ${schemaName}.project_data
for values in (2)
with (fillfactor = 100)
;
