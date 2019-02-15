create unlogged table if not exists ${schemaName}.activity_sum
(data_source_id                 smallint
,data_source                    character varying (8)
,station_id                     numeric
,site_id                        text
,event_date                     date
,sample_media                   text
,organization                   text
,site_type                      text
,huc                            character varying (12)
,governmental_unit_code         character varying (9)
,geom                           geometry(point,4269)
,activity_id                    numeric
,project_id                     text
,act_metric_count               integer
,result_count                   integer
)
partition by list (data_source_id)
;
