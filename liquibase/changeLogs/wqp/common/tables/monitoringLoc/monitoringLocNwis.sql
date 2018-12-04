create unlogged table if not exists ${schemaName}.monitoring_loc_nwis
partition of ${schemaName}.monitoring_loc
for values in (2)
with (fillfactor = 100)
;
