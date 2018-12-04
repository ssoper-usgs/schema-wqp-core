create unlogged table if not exists ${schemaName}.r_detect_qnt_lmt_biodata
partition of ${schemaName}.r_detect_qnt_lmt
for values in (4)
with (fillfactor = 100)
;
