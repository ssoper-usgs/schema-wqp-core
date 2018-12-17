create unlogged table if not exists ${schemaName}.county_storet
partition of ${schemaName}.county
for values in (3)
with (fillfactor = 100)
;
