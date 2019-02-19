create unlogged table if not exists ${schemaName}.prj_ml_weighting_storet
partition of ${schemaName}.prj_ml_weighting
for values in (3)
with (fillfactor = 100)
;
