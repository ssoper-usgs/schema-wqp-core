create unlogged table if not exists ${schemaName}.county_nwis
partition of ${schemaName}.county
for values in (2)
with (fillfactor = 100)
;
