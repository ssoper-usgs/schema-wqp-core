create unlogged table if not exists ${schemaName}.result_object_storet
partition of ${schemaName}.result_object
for values in (3)
with (fillfactor = 100)
;
