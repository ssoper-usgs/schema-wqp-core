create unlogged table if not exists ${schemaName}.org_grouping_storet
partition of ${schemaName}.org_grouping
for values in (3)
with (fillfactor = 100)
;
