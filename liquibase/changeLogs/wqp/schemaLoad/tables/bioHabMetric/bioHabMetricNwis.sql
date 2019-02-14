create unlogged table if not exists ${schemaName}.bio_hab_metric_nwis
partition of ${schemaName}.bio_hab_metric
for values in (2)
with (fillfactor = 100)
;
