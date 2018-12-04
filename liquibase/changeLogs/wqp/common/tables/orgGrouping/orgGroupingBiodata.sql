create unlogged table if not exists ${schemaName}.org_grouping_biodata
partition of ${schemaName}.org_grouping
for values in (4)
with (fillfactor = 100)
;
