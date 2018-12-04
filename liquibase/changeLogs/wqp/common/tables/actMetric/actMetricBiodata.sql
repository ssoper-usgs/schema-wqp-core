create unlogged table if not exists ${schemaName}.act_metric_biodata
partition of ${schemaName}.act_metric
for values in (4)
with (fillfactor = 100)
;
