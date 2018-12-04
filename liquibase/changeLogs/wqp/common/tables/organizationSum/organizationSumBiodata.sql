create unlogged table if not exists ${schemaName}.organization_sum_biodata
partition of ${schemaName}.organization_sum
for values in (4)
with (fillfactor = 100)
;
