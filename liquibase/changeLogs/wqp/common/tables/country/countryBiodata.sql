create unlogged table if not exists ${schemaName}.country_biodata
partition of ${schemaName}.country
for values in (4)
with (fillfactor = 100)
;
