create unlogged table if not exists ${schemaName}.r_detect_qnt_lmt_nwis
partition of ${schemaName}.r_detect_qnt_lmt
for values in (2)
with (fillfactor = 100)
;
