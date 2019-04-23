create unlogged table if not exists ${WQP_SCHEMA_NAME}.act_metric_biodata
partition of ${WQP_SCHEMA_NAME}.act_metric
for values in (4)
with (fillfactor = 100)
;
