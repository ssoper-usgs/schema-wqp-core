create unlogged table if not exists ${schemaName}.qwportal_summary_nwis
partition of ${schemaName}.qwportal_summary
for values in (2)
with (fillfactor = 100)
;
