create unlogged table if not exists ${schemaName}.site_type_stewards
partition of ${schemaName}.site_type
for values in (1)
with (fillfactor = 100)
;
