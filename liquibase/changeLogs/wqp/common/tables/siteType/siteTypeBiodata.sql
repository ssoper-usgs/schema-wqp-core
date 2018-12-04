create unlogged table if not exists ${schemaName}.site_type_biodata
partition of ${schemaName}.site_type
for values in (4)
with (fillfactor = 100)
;
