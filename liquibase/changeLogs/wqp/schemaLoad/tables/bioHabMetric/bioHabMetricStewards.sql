create unlogged table if not exists ${schemaName}.bio_hab_metric_stewards
partition of ${schemaName}.bio_hab_metric
for values in (1)
with (fillfactor = 100)
;
