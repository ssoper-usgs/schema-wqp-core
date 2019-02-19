create unlogged table if not exists ${schemaName}.act_metric_nwis
partition of ${schemaName}.act_metric
for values in (2)
with (fillfactor = 100)
;
