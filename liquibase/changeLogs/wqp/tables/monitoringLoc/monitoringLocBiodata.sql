create unlogged table if not exists ${schemaName}.monitoring_loc_biodata
partition of ${schemaName}.monitoring_loc
for values in (4)
with (fillfactor = 100)
;
