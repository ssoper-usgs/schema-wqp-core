create unlogged table if not exists ${schemaName}.state_stewards
partition of ${schemaName}.state
for values in (1)
with (fillfactor = 100)
;
