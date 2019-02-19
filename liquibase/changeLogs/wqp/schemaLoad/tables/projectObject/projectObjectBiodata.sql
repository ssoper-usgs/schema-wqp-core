create unlogged table if not exists ${schemaName}.project_object_biodata
partition of ${schemaName}.project_object
for values in (4)
with (fillfactor = 100)
;
