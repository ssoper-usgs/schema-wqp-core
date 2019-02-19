create unlogged table if not exists ${schemaName}.sample_media_nwis
partition of ${schemaName}.sample_media
for values in (2)
with (fillfactor = 100)
;
