create unlogged table if not exists ${schemaName}.organization_sum_storet
partition of ${schemaName}.organization_sum
for values in (3)
with (fillfactor = 100)
;
