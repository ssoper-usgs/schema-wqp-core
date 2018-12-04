create unlogged table if not exists ${schemaName}.organization_biodata
partition of ${schemaName}.organization
for values in (4)
with (fillfactor = 100)
;
