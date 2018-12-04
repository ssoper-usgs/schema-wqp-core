create unlogged table if not exists ${schemaName}.result_sum_biodata
partition of ${schemaName}.result_sum
for values in (4)
with (fillfactor = 100)
;
