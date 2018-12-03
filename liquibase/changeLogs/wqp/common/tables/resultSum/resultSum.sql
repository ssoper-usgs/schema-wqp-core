create unlogged table if not exists ${schemaName}.result_sum
(data_source_id                 smallint
,data_source                    character varying (8)
,station_id                     numeric
,site_id                        text
,event_date                     date
,analytical_method              text
,p_code                         text
,characteristic_name            text
,characteristic_type            text
,sample_media                   text
,organization                   text
,site_type                      text
,huc                            character varying (12)
,governmental_unit_code         character varying (9)
,project_id                     text
,assemblage_sampled_name        text
,result_count                   integer
,sample_tissue_taxonomic_name   text
,activity_id                    numeric
)
partition by list (data_source_id)
;
