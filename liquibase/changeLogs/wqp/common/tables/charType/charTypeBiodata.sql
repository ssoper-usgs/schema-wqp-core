create unlogged table if not exists ${schemaName}.char_type_biodata
partition of ${schemaName}.char_type
for values in (4)
with (fillfactor = 100)
;
