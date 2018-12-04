create unlogged table if not exists ${schemaName}.char_name_stewards
partition of ${schemaName}.char_name
for values in (1)
with (fillfactor = 100)
;
