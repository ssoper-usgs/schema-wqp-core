create unlogged table if not exists ${schemaName}.activity_nwis
partition of ${schemaName}.activity
for values in (2)
with (fillfactor = 100)
;
