create unlogged table if not exists ${schemaName}.taxa_name_storet
partition of ${schemaName}.taxa_name
for values in (3)
with (fillfactor = 100)
;
