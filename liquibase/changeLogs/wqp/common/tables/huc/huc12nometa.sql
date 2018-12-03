create unlogged table if not exists ${schemaName}.huc12nometa
(objectid                       numeric
,huc12                          character varying (12)
,geometry                       geometry
)
with (fillfactor = 100)
;
