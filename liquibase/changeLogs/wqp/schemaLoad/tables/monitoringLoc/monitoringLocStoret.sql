create unlogged table if not exists ${schemaName}.monitoring_loc_storet
partition of ${schemaName}.monitoring_loc
for values in (3)
with (fillfactor = 100)
;
