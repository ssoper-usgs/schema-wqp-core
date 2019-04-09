create unlogged table if not exists ${WQP_SCHEMA_NAME}.r_detect_qnt_lmt_biodata
partition of ${WQP_SCHEMA_NAME}.r_detect_qnt_lmt
for values in (4)
with (fillfactor = 100)
;
