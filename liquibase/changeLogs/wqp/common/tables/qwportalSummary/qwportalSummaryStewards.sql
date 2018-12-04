create unlogged table if not exists ${schemaName}.qwportal_summary_stewards
partition of ${schemaName}.qwportal_summary
for values in (1)
with (fillfactor = 100)
;
