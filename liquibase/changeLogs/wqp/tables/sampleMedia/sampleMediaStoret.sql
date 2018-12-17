create unlogged table if not exists ${schemaName}.sample_media_storet
partition of ${schemaName}.sample_media
for values in (3)
with (fillfactor = 100)
;
