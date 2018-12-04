create unlogged table if not exists ${schemaName}.bio_hab_metric_storet
partition of ${schemaName}.bio_hab_metric
for values in (3)
with (fillfactor = 100)
;
