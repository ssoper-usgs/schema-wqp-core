create unlogged table if not exists ${schemaName}.org_data_storet
partition of ${schemaName}.org_data
for values in (3)
with (fillfactor = 100)
;
