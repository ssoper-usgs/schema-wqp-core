create unlogged table if not exists ${schemaName}.site_type_storet
partition of ${schemaName}.site_type
for values in (3)
with (fillfactor = 100)
;
