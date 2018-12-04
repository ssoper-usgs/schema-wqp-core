create unlogged table if not exists ${schemaName}.assemblage_storet
partition of ${schemaName}.assemblage
for values in (3)
with (fillfactor = 100)
;
