create unlogged table if not exists ${schemaName}.org_data_stewards
partition of ${schemaName}.org_data
for values in (1)
with (fillfactor = 100)
;
