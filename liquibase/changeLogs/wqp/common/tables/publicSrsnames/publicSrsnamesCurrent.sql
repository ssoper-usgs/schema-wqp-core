create unlogged table if not exists ${schemaName}.public_srsnames_current
partition of ${schemaName}.public_srsnames
for values in (1)
with (fillfactor = 100)
;
