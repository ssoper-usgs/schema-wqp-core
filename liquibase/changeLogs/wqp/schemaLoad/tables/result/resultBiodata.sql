create unlogged table if not exists ${schemaName}.result_biodata
partition of ${schemaName}.result
for values in (4)
with (fillfactor = 100)
;
