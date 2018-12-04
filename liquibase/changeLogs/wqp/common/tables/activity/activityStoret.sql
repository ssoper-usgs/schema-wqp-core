create unlogged table if not exists ${schemaName}.activity_storet
partition of ${schemaName}.activity
for values in (3)
with (fillfactor = 100)
;
