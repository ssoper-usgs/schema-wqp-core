create unlogged table if not exists ${schemaName}.monitoring_loc_stewards
partition of ${schemaName}.monitoring_loc
for values in (1)
with (fillfactor = 100)
;
