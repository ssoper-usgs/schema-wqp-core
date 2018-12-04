create unlogged table if not exists ${schemaName}.char_name_storet
partition of ${schemaName}.char_name
for values in (3)
with (fillfactor = 100)
;
