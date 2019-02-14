create unlogged table if not exists ${schemaName}.activity_stewards
partition of ${schemaName}.activity
for values in (1)
with (fillfactor = 100)
;
