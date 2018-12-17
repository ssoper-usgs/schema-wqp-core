create unlogged table if not exists ${schemaName}.project_nwis
partition of ${schemaName}.project
for values in (2)
with (fillfactor = 100)
;
