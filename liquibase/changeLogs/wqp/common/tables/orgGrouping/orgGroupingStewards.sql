create unlogged table if not exists ${schemaName}.org_grouping_stewards
partition of ${schemaName}.org_grouping
for values in (1)
with (fillfactor = 100)
;
