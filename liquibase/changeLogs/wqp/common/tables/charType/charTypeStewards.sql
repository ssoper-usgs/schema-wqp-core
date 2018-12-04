create unlogged table if not exists ${schemaName}.char_type_stewards
partition of ${schemaName}.char_type
for values in (1)
with (fillfactor = 100)
;
