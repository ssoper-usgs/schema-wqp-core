create unlogged table if not exists ${schemaName}.project_biodata
partition of ${schemaName}.project
for values in (4)
with (fillfactor = 100)
;
