create unlogged table if not exists ${schemaName}.project_object_storet
partition of ${schemaName}.project_object
for values in (3)
with (fillfactor = 100)
;
