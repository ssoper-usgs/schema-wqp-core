create unlogged table if not exists ${schemaName}.assemblage_biodata
partition of ${schemaName}.assemblage
for values in (4)
with (fillfactor = 100)
;
