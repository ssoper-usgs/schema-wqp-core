create unlogged table if not exists ${schemaName}.country_nwis
partition of ${schemaName}.country
for values in (2)
with (fillfactor = 100)
;
