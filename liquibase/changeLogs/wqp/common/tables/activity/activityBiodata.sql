create unlogged table if not exists ${schemaName}.activity_biodata
partition of ${schemaName}.activity
for values in (4)
with (fillfactor = 100)
;
