create unlogged table if not exists ${WQP_SCHEMA_NAME}.char_name_biodata
partition of ${WQP_SCHEMA_NAME}.char_name
for values in (4)
with (fillfactor = 100)
;
