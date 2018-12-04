create unlogged table if not exists ${schemaName}.site_type_nwis
partition of ${schemaName}.site_type
for values in (2)
with (fillfactor = 100)
;
