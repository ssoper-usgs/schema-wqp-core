create unlogged table if not exists ${schemaName}.activity_sum_nwis
partition of ${schemaName}.activity_sum
for values in (2)
with (fillfactor = 100)
;
