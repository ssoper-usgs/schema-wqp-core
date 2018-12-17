create unlogged table if not exists ${schemaName}.act_metric_storet
partition of ${schemaName}.act_metric
for values in (3)
with (fillfactor = 100)
;
