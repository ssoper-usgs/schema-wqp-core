create unlogged table if not exists ${schemaName}.prj_ml_weighting_biodata
partition of ${schemaName}.prj_ml_weighting
for values in (4)
with (fillfactor = 100)
;
