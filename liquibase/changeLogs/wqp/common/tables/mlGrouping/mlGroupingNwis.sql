create unlogged table if not exists ${schemaName}.ml_grouping_nwis
partition of ${schemaName}.ml_grouping
for values in (2)
with (fillfactor = 100)
;
