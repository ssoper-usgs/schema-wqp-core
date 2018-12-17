create unlogged table if not exists ${schemaName}.activity_sum_stewards
partition of ${schemaName}.activity_sum
for values in (1)
with (fillfactor = 100)
;
