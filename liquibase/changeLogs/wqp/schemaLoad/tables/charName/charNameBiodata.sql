create unlogged table if not exists ${schemaName}.char_name_biodata
partition of ${schemaName}.char_name
for values in (4)
with (fillfactor = 100)
;
