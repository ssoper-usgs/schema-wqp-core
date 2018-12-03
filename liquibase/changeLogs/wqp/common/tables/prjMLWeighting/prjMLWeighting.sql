create unlogged table if not exists ${schemaName}.prj_ml_weighting
(data_source_id                 smallint
,project_id                     numeric
,station_id                     numeric
,data_source                    character varying (8)
,site_id                        text
,organization                   text
,organization_name              text
,site_type                      text
,huc                            character varying (12)
,governmental_unit_code         character varying (9)
,project_identifier             text
,measure_value                  text
,unit_code                      text
,statistical_stratum            text
,location_category              text
,location_status                text
,ref_location_type_code         text
,ref_location_start_date        text
,ref_location_end_date          text
,resource_title                 text
,resource_creator               text
,resource_subject               text
,resource_publisher             text
,resource_date                  text
,resource_identifier            text
,comment_text                   text
)
partition by list (data_source_id)
;
