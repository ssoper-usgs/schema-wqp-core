create unlogged table if not exists ${schemaName}.prj_ml_weighting_stewards
partition of ${schemaName}.prj_ml_weighting
for values in (1)
with (fillfactor = 100)
;
