create unlogged table if not exists ${schemaName}.organization_sum_nwis
partition of ${schemaName}.organization_sum
for values in (2)
with (fillfactor = 100)
;
