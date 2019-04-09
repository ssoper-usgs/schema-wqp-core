create unlogged table if not exists ${WQP_SCHEMA_NAME}.r_detect_qnt_lmt
(data_source_id                 smallint
,data_source                    character varying (8)
,station_id                     numeric
,site_id                        text
,event_date                     date
,activity                       text
,analytical_method              text
,p_code                         text
,characteristic_name            text
,characteristic_type            text
,sample_media                   text
,organization                   text
,site_type                      text
,huc                            character varying (12)
,governmental_unit_code         character varying (9)
,geom                           geometry(point,4269)
,project_id                     text
,assemblage_sampled_name        text
,sample_tissue_taxonomic_name   text
,activity_id                    numeric
,result_id                      numeric
,organization_name              text
,detection_limit_id             numeric
,detection_limit                text
,detection_limit_unit           text
,detection_limit_desc           text
,deprecated_flag                character varying (3)
,web_code                       character varying (3)
)
partition by list (data_source_id)
;
