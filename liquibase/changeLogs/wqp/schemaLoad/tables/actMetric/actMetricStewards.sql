create unlogged table if not exists ${schemaName}.act_metric_stewards
partition of ${schemaName}.act_metric
for values in (1)
with (fillfactor = 100)
;
