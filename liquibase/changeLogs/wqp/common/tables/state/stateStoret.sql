create unlogged table if not exists ${schemaName}.state_storet
partition of ${schemaName}.state
for values in (3)
with (fillfactor = 100)
;
