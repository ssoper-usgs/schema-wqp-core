create unlogged table if not exists ${schemaName}.project_storet
partition of ${schemaName}.project
for values in (3)
with (fillfactor = 100)
;
