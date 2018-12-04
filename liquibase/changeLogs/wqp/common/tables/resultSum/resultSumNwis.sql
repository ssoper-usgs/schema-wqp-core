create unlogged table if not exists ${schemaName}.result_sum_nwis
partition of ${schemaName}.result_sum
for values in (2)
with (fillfactor = 100)
;
