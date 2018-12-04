create unlogged table if not exists ${schemaName}.organization_nwis
partition of ${schemaName}.organization
for values in (2)
with (fillfactor = 100)
;
