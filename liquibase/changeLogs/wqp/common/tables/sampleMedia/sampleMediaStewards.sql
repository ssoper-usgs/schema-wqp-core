create unlogged table if not exists ${schemaName}.sample_media_stewards
partition of ${schemaName}.sample_media
for values in (1)
with (fillfactor = 100)
;
