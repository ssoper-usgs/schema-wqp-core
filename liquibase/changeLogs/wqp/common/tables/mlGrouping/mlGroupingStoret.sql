create unlogged table if not exists ${schemaName}.ml_grouping_storet
partition of ${schemaName}.ml_grouping
for values in (3)
with (fillfactor = 100)
;
