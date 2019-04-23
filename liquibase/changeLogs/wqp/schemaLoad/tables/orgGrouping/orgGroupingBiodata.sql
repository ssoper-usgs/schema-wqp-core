create unlogged table if not exists ${WQP_SCHEMA_NAME}.org_grouping_biodata
partition of ${WQP_SCHEMA_NAME}.org_grouping
for values in (4)
with (fillfactor = 100)
;
