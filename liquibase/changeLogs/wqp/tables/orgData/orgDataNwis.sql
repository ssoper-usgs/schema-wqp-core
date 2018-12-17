create unlogged table if not exists ${schemaName}.org_data_nwis
partition of ${schemaName}.org_data
for values in (2)
with (fillfactor = 100)
;
