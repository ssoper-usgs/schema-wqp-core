create unlogged table if not exists ${schemaName}.result_object_biodata
partition of ${schemaName}.result_object
for values in (4)
with (fillfactor = 100)
;
