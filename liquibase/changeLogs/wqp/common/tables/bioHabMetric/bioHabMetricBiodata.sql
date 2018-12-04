create unlogged table if not exists ${schemaName}.bio_hab_metric_biodata
partition of ${schemaName}.bio_hab_metric
for values in (4)
with (fillfactor = 100)
;
