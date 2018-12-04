create unlogged table if not exists ${schemaName}.taxa_name_stewards
partition of ${schemaName}.taxa_name
for values in (1)
with (fillfactor = 100)
;
