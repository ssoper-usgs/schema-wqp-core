create unlogged table if not exists ${WQP_SCHEMA_NAME}.assemblage_biodata
partition of ${WQP_SCHEMA_NAME}.assemblage
for values in (4)
with (fillfactor = 100)
;
