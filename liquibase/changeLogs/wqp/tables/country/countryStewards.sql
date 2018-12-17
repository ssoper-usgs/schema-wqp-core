create unlogged table if not exists ${schemaName}.country_stewards
partition of ${schemaName}.country
for values in (1)
with (fillfactor = 100)
;
