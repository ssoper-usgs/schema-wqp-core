create unlogged table if not exists ${WQP_SCHEMA_NAME}.sample_media_biodata
partition of ${WQP_SCHEMA_NAME}.sample_media
for values in (4)
with (fillfactor = 100)
;
