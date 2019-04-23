create unlogged table if not exists ${WQP_SCHEMA_NAME}.qwportal_summary_biodata
partition of ${WQP_SCHEMA_NAME}.qwportal_summary
for values in (4)
with (fillfactor = 100)
;
