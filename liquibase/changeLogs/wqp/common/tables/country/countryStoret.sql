create unlogged table if not exists ${schemaName}.country_storet
partition of ${schemaName}.country
for values in (3)
with (fillfactor = 100)
;
