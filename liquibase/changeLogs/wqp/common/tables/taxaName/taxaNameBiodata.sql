create unlogged table if not exists ${schemaName}.taxa_name_biodata
partition of ${schemaName}.taxa_name
for values in (4)
with (fillfactor = 100)
;
