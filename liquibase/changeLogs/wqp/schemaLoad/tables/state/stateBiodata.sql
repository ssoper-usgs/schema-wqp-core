create unlogged table if not exists ${schemaName}.state_biodata
partition of ${schemaName}.state
for values in (4)
with (fillfactor = 100)
;
