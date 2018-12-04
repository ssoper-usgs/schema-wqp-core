create unlogged table if not exists ${schemaName}.assemblage_stewards
partition of ${schemaName}.assemblage
for values in (1)
with (fillfactor = 100)
;
