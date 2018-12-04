create unlogged table if not exists ${schemaName}.char_name_nwis
partition of ${schemaName}.char_name
for values in (2)
with (fillfactor = 100)
;
