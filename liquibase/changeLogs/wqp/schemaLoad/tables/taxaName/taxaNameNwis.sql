create unlogged table if not exists ${schemaName}.taxa_name_nwis
partition of ${schemaName}.taxa_name
for values in (2)
with (fillfactor = 100)
;
