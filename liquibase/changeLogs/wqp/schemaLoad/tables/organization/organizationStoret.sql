create unlogged table if not exists ${schemaName}.organization_storet
partition of ${schemaName}.organization
for values in (3)
with (fillfactor = 100)
;
