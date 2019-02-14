create unlogged table if not exists ${schemaName}.result_sum_stewards
partition of ${schemaName}.result_sum
for values in (1)
with (fillfactor = 100)
;
