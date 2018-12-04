create unlogged table if not exists ${schemaName}.prj_ml_weighting_nwis
partition of ${schemaName}.prj_ml_weighting
for values in (2)
with (fillfactor = 100)
;
