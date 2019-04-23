create unlogged table if not exists ${WQP_SCHEMA_NAME}.bio_hab_metric_biodata
partition of ${WQP_SCHEMA_NAME}.bio_hab_metric
for values in (4)
with (fillfactor = 100)
;
