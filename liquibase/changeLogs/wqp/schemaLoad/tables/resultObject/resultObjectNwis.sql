create unlogged table if not exists ${schemaName}.result_object_nwis
partition of ${schemaName}.result_object
for values in (2)
with (fillfactor = 100)
;
