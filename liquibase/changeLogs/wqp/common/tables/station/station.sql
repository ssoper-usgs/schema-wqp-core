create unlogged table if not exists ${schemaName}.station
(data_source_id                 smallint
,data_source                    character varying (8)
,station_id                     numeric
,site_id                        text
,organization                   text
,site_type                      text
,huc                            character varying (12)
,governmental_unit_code         character varying (9)
,geom                           geometry
,station_name                   text
,organization_name              text
,description_text               text
,station_type_name              text
,latitude                       numeric
,longitude                      numeric
,map_scale                      text
,geopositioning_method          text
,hdatum_id_code                 text
,elevation_value                text
,elevation_unit                 text
,elevation_method               text
,vdatum_id_code                 text
,drain_area_value               numeric
,drain_area_unit                text
,contrib_drain_area_value       numeric
,contrib_drain_area_unit        text
,geoposition_accy_value         text
,geoposition_accy_unit          text
,vertical_accuracy_value        text
,vertical_accuracy_unit         text
,nat_aqfr_name                  text
,aqfr_name                      text
,aqfr_type_name                 text
,construction_date              text
,well_depth_value               numeric
,well_depth_unit                text
,hole_depth_value               numeric
,hole_depth_unit                text
,deprecated_flag                character varying (3)
,web_code                       character varying (3)
)
partition by list (data_source_id)
;
