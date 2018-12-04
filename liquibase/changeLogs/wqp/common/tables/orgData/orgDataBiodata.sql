create unlogged table if not exists ${schemaName}.org_data_biodata
partition of ${schemaName}.org_data
for values in (4)
with (fillfactor = 100)
;
