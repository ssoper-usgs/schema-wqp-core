create unlogged table if not exists ${schemaName}.bio_hab_metric
(data_source_id                 smallint
,data_source                    character varying (8)
,station_id                     numeric
,site_id                        text
,organization                   text
,site_type                      text
,huc                            text
,governmental_unit_code         text
,index_identifier               text
,index_type_identifier          text
,index_type_context             text
,index_type_name                text
,resource_title_name            text
,resource_creator_name          text
,resource_subject_text          text
,resource_publisher_name        text
,resource_date                  text
,resource_identifier            text
,index_type_scale_text          text
,index_score_numeric            text
,index_qualifier_code           text
,index_comment                  text
,index_calculated_date          text
)
partition by list (data_source_id)
;
