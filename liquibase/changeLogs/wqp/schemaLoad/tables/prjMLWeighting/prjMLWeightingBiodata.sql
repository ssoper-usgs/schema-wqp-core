create unlogged table if not exists ${WQP_SCHEMA_NAME}.prj_ml_weighting_biodata
partition of ${WQP_SCHEMA_NAME}.prj_ml_weighting
for values in (4)
with (fillfactor = 100)
;
