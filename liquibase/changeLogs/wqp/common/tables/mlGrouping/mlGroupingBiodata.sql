create unlogged table if not exists ${schemaName}.ml_grouping_biodata
partition of ${schemaName}.ml_grouping
for values in (4)
with (fillfactor = 100)
;
