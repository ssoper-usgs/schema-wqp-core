create unlogged table if not exists ${schemaName}.result_storet
partition of ${schemaName}.result
for values in (3)
with (fillfactor = 100)
;
