create unlogged table if not exists ${schemaName}.county_biodata
partition of ${schemaName}.county
for values in (4)
with (fillfactor = 100)
;
