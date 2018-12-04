create unlogged table if not exists ${schemaName}.state_nwis
partition of ${schemaName}.state
for values in (2)
with (fillfactor = 100)
;
