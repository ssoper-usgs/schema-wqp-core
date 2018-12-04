create unlogged table if not exists ${schemaName}.activity_sum_storet
partition of ${schemaName}.activity_sum
for values in (3)
with (fillfactor = 100)
;
