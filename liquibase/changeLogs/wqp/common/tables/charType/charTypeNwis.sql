create unlogged table if not exists ${schemaName}.char_type_nwis
partition of ${schemaName}.char_type
for values in (2)
with (fillfactor = 100)
;
