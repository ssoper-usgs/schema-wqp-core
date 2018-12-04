create unlogged table if not exists ${schemaName}.result_sum_storet
partition of ${schemaName}.result_sum
for values in (3)
with (fillfactor = 100)
;
