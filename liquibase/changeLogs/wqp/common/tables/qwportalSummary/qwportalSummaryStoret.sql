create unlogged table if not exists ${schemaName}.qwportal_summary_storet
partition of ${schemaName}.qwportal_summary
for values in (3)
with (fillfactor = 100)
;
