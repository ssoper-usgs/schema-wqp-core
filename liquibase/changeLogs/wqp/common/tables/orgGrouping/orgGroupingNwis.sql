create unlogged table if not exists ${schemaName}.org_grouping_nwis
partition of ${schemaName}.org_grouping
for values in (2)
with (fillfactor = 100)
;
