create unlogged table if not exists ${schemaName}.char_type_storet
partition of ${schemaName}.char_type
for values in (3)
with (fillfactor = 100)
;
