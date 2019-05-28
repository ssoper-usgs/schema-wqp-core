create unlogged table if not exists ${WQP_SCHEMA_NAME}.act_metric
(data_source_id                 smallint
,data_source                    character varying (8)
,station_id                     numeric
,site_id                        text
,event_date                     date
,activity                       text
,sample_media                   text
,organization                   text
,site_type                      text
,huc                            character varying (12)
,governmental_unit_code         character varying (9)
,geom                           geometry(point,4269)
,organization_name              text
,activity_id                    numeric
,type_identifier                text
,identifier_context             text
,type_name                      text
,resource_title                 text
,resource_creator               text
,resource_subject               text
,resource_publisher             text
,resource_date                  text
,resource_identifier            text
,type_scale                     text
,formula_description            text
,measure_value                  text
,unit_code                      text
,score                          text
,comment_text                   text
,index_identifier               text
)
partition by list (data_source_id)
;
