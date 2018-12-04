create unlogged table if not exists ${schemaName}.result_nwis
partition of ${schemaName}.result
for values in (2)
with (fillfactor = 100)
;
