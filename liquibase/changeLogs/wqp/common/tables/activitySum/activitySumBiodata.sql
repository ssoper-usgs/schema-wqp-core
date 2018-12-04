create unlogged table if not exists ${schemaName}.activity_sum_biodata
partition of ${schemaName}.activity_sum
for values in (4)
with (fillfactor = 100)
;
