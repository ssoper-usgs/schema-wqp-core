create unlogged table if not exists ${schemaName}.ml_grouping_stewards
partition of ${schemaName}.ml_grouping
for values in (1)
with (fillfactor = 100)
;
