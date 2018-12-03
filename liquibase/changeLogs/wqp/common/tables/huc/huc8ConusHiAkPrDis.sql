create unlogged table if not exists ${schemaName}.huc8_conus_hi_ak_pr_dis
(cat_num                        character varying (8)
,first_cat_                     character varying (60)
,geom                           geometry
)
with (fillfactor = 100)
;
