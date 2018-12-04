create unlogged table if not exists ${schemaName}.county_stewards
partition of ${schemaName}.county
for values in (1)
with (fillfactor = 100)
;
