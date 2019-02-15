create unlogged table if not exists ${schemaName}.sample_media_biodata
partition of ${schemaName}.sample_media
for values in (4)
with (fillfactor = 100)
;
