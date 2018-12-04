create unlogged table if not exists ${schemaName}.project_object_nwis
partition of ${schemaName}.project_object
for values in (2)
with (fillfactor = 100)
;
