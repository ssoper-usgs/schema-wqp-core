create unlogged table if not exists ${schemaName}.assemblage_nwis
partition of ${schemaName}.assemblage
for values in (2)
with (fillfactor = 100)
;
