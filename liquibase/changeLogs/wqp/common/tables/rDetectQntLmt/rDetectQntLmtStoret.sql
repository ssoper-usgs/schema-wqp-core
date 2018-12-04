create unlogged table if not exists ${schemaName}.r_detect_qnt_lmt_storet
partition of ${schemaName}.r_detect_qnt_lmt
for values in (3)
with (fillfactor = 100)
;
