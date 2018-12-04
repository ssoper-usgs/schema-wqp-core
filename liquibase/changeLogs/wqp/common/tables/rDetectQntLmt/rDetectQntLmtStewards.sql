create unlogged table if not exists ${schemaName}.r_detect_qnt_lmt_stewards
partition of ${schemaName}.r_detect_qnt_lmt
for values in (1)
with (fillfactor = 100)
;
