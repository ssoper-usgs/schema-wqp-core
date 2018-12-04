create unlogged table if not exists ${schemaName}.qwportal_summary_biodata
partition of ${schemaName}.qwportal_summary
for values in (4)
with (fillfactor = 100)
;
