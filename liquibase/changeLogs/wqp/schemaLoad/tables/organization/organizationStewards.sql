create unlogged table if not exists ${schemaName}.organization_stewards
partition of ${schemaName}.organization
for values in (1)
with (fillfactor = 100)
;
