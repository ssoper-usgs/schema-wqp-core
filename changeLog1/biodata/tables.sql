--liquibase formatted sql

--This is for the wqp_core schema

--changeset drsteini:1BiodataTablesAA
create table station_swap_biodata
(data_source_id                 number
,data_source                    varchar2(8 char)
,station_id                     number
,site_id                        varchar2(4000 char)
,organization                   varchar2(4000 char)
,site_type                      varchar2(4000 char)
,huc                         	varchar2(12 char)
,governmental_unit_code         varchar2(9 char)
,geom                           mdsys.sdo_geometry
,station_name                   varchar2(4000 char)
,organization_name              varchar2(4000 char)
,description_text               varchar2(4000 char)
,station_type_name				varchar2(4000 char)
,latitude                       number
,longitude                      number
,map_scale                      varchar2(4000 char)
,geopositioning_method          varchar2(4000 char)
,hdatum_id_code                 varchar2(4000 char)
,elevation_value                varchar2(4000 char)
,elevation_unit                 varchar2(4000 char)
,elevation_method               varchar2(4000 char)
,vdatum_id_code                 varchar2(4000 char)
,drain_area_value               number
,drain_area_unit                varchar2(4000 char)
,contrib_drain_area_value       number
,contrib_drain_area_unit        varchar2(4000 char)
,geoposition_accy_value         varchar2(4000 char)
,geoposition_accy_unit          varchar2(4000 char)
,vertical_accuracy_value        varchar2(4000 char)
,vertical_accuracy_unit         varchar2(4000 char)
,nat_aqfr_name                  varchar2(4000 char)
,aqfr_name                      varchar2(4000 char)
,aqfr_type_name                 varchar2(4000 char)
,construction_date              varchar2(4000 char)
,well_depth_value               number
,well_depth_unit                varchar2(4000 char)
,hole_depth_value               number
,hole_depth_unit                varchar2(4000 char)
,huc_2                          generated always as (case when length(huc) > 1 then substr(huc,1,2) else null end)
,huc_4                          generated always as (case when length(huc) > 3 then substr(huc,1,4) else null end)
,huc_6                          generated always as (case when length(huc) > 5 then substr(huc,1,6) else null end)
,huc_8                          generated always as (case when length(huc) > 7 then substr(huc,1,8) else null end)
,huc_10                         generated always as (case when length(huc) > 9 then substr(huc,1,10) else null end)
,huc_12                         generated always as (case when length(huc) = 12 then substr(huc,1,12) else null end)
,country_code                   generated always as (regexp_substr(governmental_unit_code, '[^:]+'))
,state_code                     generated always as (regexp_substr(governmental_unit_code, '[^:]+:[^:]+'))
,state_fips_code                generated always as (regexp_substr(governmental_unit_code, '[^:]+', 1, 2))
,county_code                    generated always as (regexp_substr(governmental_unit_code, '[^:]+:[^:]+:[^:]+'))
,county_fips_code               generated always as (regexp_substr(governmental_unit_code, '[^:]+', 1, 3))
) parallel 4 compress pctfree 0 nologging cache;
--rollback drop table station_swap_biodata cascade constraints purge;


--changeset drsteini:1BiodataTablesAB
create table result_swap_biodata
(data_source_id					number
,data_source					varchar2(8 char)
,station_id 					number
,site_id						varchar2(4000 char)
,event_date						date
,analytical_method				varchar2(4000 char)
,p_code							varchar2(4000 char)
,activity						varchar2(4000 char)
,characteristic_name			varchar2(4000 char)
,characteristic_type			varchar2(4000 char)
,sample_media					varchar2(4000 char)
,organization					varchar2(4000 char)
,site_type						varchar2(4000 char)
,huc							varchar2(12 char)
,governmental_unit_code			varchar2(9 char)
,organization_name              varchar2(4000 char)
,activity_type_code             varchar2(4000 char)
,activity_media_subdiv_name     varchar2(4000 char)
,activity_start_time            varchar2(4000 char)
,act_start_time_zone            varchar2(4000 char)
,activity_stop_date             varchar2(4000 char)
,activity_stop_time             varchar2(4000 char)
,act_stop_time_zone             varchar2(4000 char)
,activity_relative_depth_name   varchar2(4000 char)
,activity_depth                 varchar2(4000 char)
,activity_depth_unit            varchar2(4000 char)
,activity_depth_ref_point       varchar2(4000 char)
,activity_upper_depth           varchar2(4000 char)
,activity_upper_depth_unit      varchar2(4000 char)
,activity_lower_depth           varchar2(4000 char)
,activity_lower_depth_unit      varchar2(4000 char)
,project_id                     varchar2(4000 char)
,activity_conducting_org        varchar2(4000 char)
,activity_comment               varchar2(4000 char)
,sample_aqfr_name               varchar2(4000 char)
,hydrologic_condition_name      varchar2(4000 char)
,hydrologic_event_name          varchar2(4000 char)
,activity_latitude              number
,activity_longitude             number
,activity_source_map_scale      number
,act_horizontal_accuracy        varchar2(4000 char)
,act_horizontal_accuracy_unit   varchar2(4000 char)
,act_horizontal_collect_method  varchar2(4000 char)
,act_horizontal_datum_name      varchar2(4000 char)
,assemblage_sampled_name        varchar2(4000 char)
,act_collection_duration        varchar2(4000 char)
,act_collection_duration_unit   varchar2(4000 char)
,act_sam_compnt_name            varchar2(4000 char)
,act_sam_compnt_place_in_series number
,act_reach_length               varchar2(4000 char)
,act_reach_length_unit          varchar2(4000 char)
,act_reach_width                varchar2(4000 char)
,act_reach_width_unit           varchar2(4000 char)
,act_pass_count                 number
,net_type_name                  varchar2(4000 char)
,act_net_surface_area           varchar2(4000 char)
,act_net_surface_area_unit      varchar2(4000 char)
,act_net_mesh_size              varchar2(4000 char)
,act_net_mesh_size_unit         varchar2(4000 char)
,act_boat_speed                 varchar2(4000 char)
,act_boat_speed_unit            varchar2(4000 char)
,act_current_speed              varchar2(4000 char)
,act_current_speed_unit         varchar2(4000 char)
,toxicity_test_type_name        varchar2(4000 char)
,sample_collect_method_id       varchar2(4000 char)
,sample_collect_method_ctx      varchar2(4000 char)
,sample_collect_method_name     varchar2(4000 char)
,act_sam_collect_meth_qual_type varchar2(4000 char)
,act_sam_collect_meth_desc      varchar2(4000 char)
,sample_collect_equip_name      varchar2(4000 char)
,act_sam_collect_equip_comments varchar2(4000 char)
,act_sam_prep_meth_id           varchar2(4000 char)
,act_sam_prep_meth_context      varchar2(4000 char)
,act_sam_prep_meth_name         varchar2(4000 char)
,act_sam_prep_meth_qual_type    varchar2(4000 char)
,act_sam_prep_meth_desc         varchar2(4000 char)
,sample_container_type          varchar2(4000 char)
,sample_container_color         varchar2(4000 char)
,act_sam_chemical_preservative  varchar2(4000 char)
,thermal_preservative_name      varchar2(4000 char)
,act_sam_transport_storage_desc varchar2(4000 char)
,metric_type_identifier         varchar2(4000 char)
,metric_type_context            varchar2(4000 char)
,metric_type_name               varchar2(4000 char)
,metric_citation_title          varchar2(4000 char)
,metric_citation_creator        varchar2(4000 char)
,metric_citation_subject        varchar2(4000 char)
,metric_citation_publisher      varchar2(4000 char)
,metric_citation_date           varchar2(4000 char)
,metric_citation_id             varchar2(4000 char)
,metric_type_scale              varchar2(4000 char)
,formula_description            varchar2(4000 char)
,activity_metric_value          varchar2(4000 char)
,activity_metric_unit           varchar2(4000 char)
,activity_metric_score          varchar2(4000 char)
,activity_metric_comment        varchar2(4000 char)
,index_identifier               varchar2(4000 char)
,result_id                      number
,res_data_logger_line           varchar2(4000 char)
,result_detection_condition_tx  varchar2(4000 char)
,method_specification_name      varchar2(4000 char)
,sample_fraction_type           varchar2(4000 char)
,result_measure_value           varchar2(4000 char)
,result_unit                    varchar2(4000 char)
,result_meas_qual_code          varchar2(4000 char)
,result_value_status            varchar2(4000 char)
,statistic_type                 varchar2(4000 char)
,result_value_type              varchar2(4000 char)
,weight_basis_type              varchar2(4000 char)
,duration_basis                 varchar2(4000 char)
,temperature_basis_level        varchar2(4000 char)
,particle_size                  varchar2(4000 char)
,precision                      varchar2(4000 char)
,res_measure_bias               varchar2(4000 char)
,res_measure_conf_interval      varchar2(4000 char)
,res_measure_upper_conf_limit   varchar2(4000 char)
,res_measure_lower_conf_limit   varchar2(4000 char)
,result_comment                 varchar2(4000 char)
,result_depth_meas_value        varchar2(4000 char)
,result_depth_meas_unit_code    varchar2(4000 char)
,result_depth_alt_ref_pt_txt    varchar2(4000 char)
,res_sampling_point_name        varchar2(4000 char)
,biological_intent              varchar2(4000 char)
,res_bio_individual_id          varchar2(4000 char)
,sample_tissue_taxonomic_name   varchar2(4000 char)
,unidentifiedspeciesidentifier  varchar2(4000 char)
,sample_tissue_anatomy_name     varchar2(4000 char)
,res_group_summary_ct_wt        varchar2(4000 char)
,res_group_summary_ct_wt_unit	varchar2(4000 char)
,cell_form_name                 varchar2(4000 char)
,cell_shape_name                varchar2(4000 char)
,habit_name                     varchar2(4000 char)
,volt_name                      varchar2(4000 char)
,rtdet_pollution_tolerance      varchar2(4000 char)
,rtdet_pollution_tolernce_scale varchar2(4000 char)
,rtdet_trophic_level            varchar2(4000 char)
,rtfgrp_functional_feeding_grp  varchar2(4000 char)
,taxon_citation_title           varchar2(4000 char)
,taxon_citation_creator         varchar2(4000 char)
,taxon_citation_subject         varchar2(4000 char)
,taxon_citation_publisher       varchar2(4000 char)
,taxon_citation_date            varchar2(4000 char)
,taxon_citation_id              varchar2(4000 char)
,fcdsc_name                     varchar2(4000 char)
,frequency_class_unit           varchar2(4000 char)
,fcdsc_lower_bound              number
,fcdsc_upper_bound              number
,analytical_procedure_id        varchar2(4000 char)
,analytical_procedure_source    varchar2(4000 char)
,analytical_method_name         varchar2(4000 char)
,anlmth_qual_type               varchar2(4000 char)
,analytical_method_citation     varchar2(4000 char)
,lab_name                       varchar2(4000 char)
,analysis_start_date            varchar2(4000 char)
,analysis_start_time    		varchar2(4000 char)
,analysis_start_timezone        varchar2(4000 char)
,analysis_end_date      		varchar2(4000 char)
,analysis_end_time      		varchar2(4000 char)
,analysis_end_timezone			varchar2(4000 char)
,rlcom_cd                       varchar2(4000 char)
,lab_remark                     varchar2(4000 char)
,detection_limit                varchar2(4000 char)
,detection_limit_unit           varchar2(4000 char)
,detection_limit_desc           varchar2(4000 char)
,res_lab_accred_yn              varchar2(4000 char)
,res_lab_accred_authority       varchar2(4000 char)
,res_taxonomist_accred_yn       varchar2(4000 char)
,res_taxonomist_accred_authorty varchar2(4000 char)
,prep_method_id                 varchar2(4000 char)
,prep_method_context            varchar2(4000 char)
,prep_method_name               varchar2(4000 char)
,prep_method_qual_type          varchar2(4000 char)
,prep_method_desc               varchar2(4000 char)
,analysis_prep_date_tx          varchar2(4000 char)
,prep_start_time                varchar2(4000 char)
,prep_start_timezone            varchar2(4000 char)
,prep_end_date                  varchar2(4000 char)
,prep_end_time                  varchar2(4000 char)
,prep_end_timezone              varchar2(4000 char)
,prep_dilution_factor           varchar2(4000 char)
,huc_2                          generated always as (case when length(huc) > 1 then substr(huc,1,2) else null end)
,huc_4                          generated always as (case when length(huc) > 3 then substr(huc,1,4) else null end)
,huc_6                          generated always as (case when length(huc) > 5 then substr(huc,1,6) else null end)
,huc_8                          generated always as (case when length(huc) > 7 then substr(huc,1,8) else null end)
,huc_10                         generated always as (case when length(huc) > 9 then substr(huc,1,10) else null end)
,huc_12                         generated always as (case when length(huc) = 12 then substr(huc,1,12) else null end)
,country_code                   generated always as (regexp_substr(governmental_unit_code, '[^:]+'))
,state_code                     generated always as (regexp_substr(governmental_unit_code, '[^:]+:[^:]+'))
,county_code                    generated always as (regexp_substr(governmental_unit_code, '[^:]+:[^:]+:[^:]+'))
) parallel 4 compress pctfree 0 nologging cache
partition by range (event_date)
(partition result_biodata_p_1990 values less than (to_date('01-JAN-1990', 'DD-MON-YYYY')) tablespace result1,
 partition result_biodata_y_1990 values less than (to_date('01-JAN-1991', 'DD-MON-YYYY')) tablespace result2,
 partition result_biodata_y_1991 values less than (to_date('01-JAN-1992', 'DD-MON-YYYY')) tablespace result3,
 partition result_biodata_y_1992 values less than (to_date('01-JAN-1993', 'DD-MON-YYYY')) tablespace result4,
 partition result_biodata_y_1993 values less than (to_date('01-JAN-1994', 'DD-MON-YYYY')) tablespace result1,
 partition result_biodata_y_1994 values less than (to_date('01-JAN-1995', 'DD-MON-YYYY')) tablespace result2,
 partition result_biodata_y_1995 values less than (to_date('01-JAN-1996', 'DD-MON-YYYY')) tablespace result3,
 partition result_biodata_y_1996 values less than (to_date('01-JAN-1997', 'DD-MON-YYYY')) tablespace result4,
 partition result_biodata_y_1997 values less than (to_date('01-JAN-1998', 'DD-MON-YYYY')) tablespace result1,
 partition result_biodata_y_1998 values less than (to_date('01-JAN-1999', 'DD-MON-YYYY')) tablespace result2,
 partition result_biodata_y_1999 values less than (to_date('01-JAN-2000', 'DD-MON-YYYY')) tablespace result3,
 partition result_biodata_y_2000 values less than (to_date('01-JAN-2001', 'DD-MON-YYYY')) tablespace result4,
 partition result_biodata_y_2001 values less than (to_date('01-JAN-2002', 'DD-MON-YYYY')) tablespace result1,
 partition result_biodata_y_2002 values less than (to_date('01-JAN-2003', 'DD-MON-YYYY')) tablespace result2,
 partition result_biodata_y_2003 values less than (to_date('01-JAN-2004', 'DD-MON-YYYY')) tablespace result3,
 partition result_biodata_y_2004 values less than (to_date('01-JAN-2005', 'DD-MON-YYYY')) tablespace result4,
 partition result_biodata_y_2005 values less than (to_date('01-JAN-2006', 'DD-MON-YYYY')) tablespace result1,
 partition result_biodata_y_2006 values less than (to_date('01-JAN-2007', 'DD-MON-YYYY')) tablespace result2,
 partition result_biodata_y_2007 values less than (to_date('01-JAN-2008', 'DD-MON-YYYY')) tablespace result3,
 partition result_biodata_y_2008 values less than (to_date('01-JAN-2009', 'DD-MON-YYYY')) tablespace result4,
 partition result_biodata_y_2009 values less than (to_date('01-JAN-2010', 'DD-MON-YYYY')) tablespace result1,
 partition result_biodata_y_2010 values less than (to_date('01-JAN-2011', 'DD-MON-YYYY')) tablespace result2,
 partition result_biodata_y_2011 values less than (to_date('01-JAN-2012', 'DD-MON-YYYY')) tablespace result3,
 partition result_biodata_y_2012 values less than (to_date('01-JAN-2013', 'DD-MON-YYYY')) tablespace result4,
 partition result_biodata_y_2013 values less than (to_date('01-JAN-2014', 'DD-MON-YYYY')) tablespace result1,
 partition result_biodata_y_2014 values less than (to_date('01-JAN-2015', 'DD-MON-YYYY')) tablespace result2,
 partition result_biodata_y_2015 values less than (to_date('01-JAN-2016', 'DD-MON-YYYY')) tablespace result3,
 partition result_biodata_y_2016 values less than (to_date('01-JAN-2017', 'DD-MON-YYYY')) tablespace result4,
 partition result_biodata_y_maxx values less than (maxvalue) tablespace result2
);
--rollback drop table result_swap_biodata cascade constraints purge;


--changeset drsteini:1BiodataTablesAC
create table station_sum_swap_biodata
(data_source_id					number
,data_source					varchar2(8 char)
,station_id 					number
,site_id						varchar2(4000 char)
,organization					varchar2(4000 char)
,site_type						varchar2(4000 char)
,huc							varchar2(12 char)
,governmental_unit_code			varchar2(9 char)
,geom							mdsys.sdo_geometry
,result_count					number
,huc_2                          generated always as (case when length(huc) > 1 then substr(huc,1,2) else null end)
,huc_4                          generated always as (case when length(huc) > 3 then substr(huc,1,4) else null end)
,huc_6                          generated always as (case when length(huc) > 5 then substr(huc,1,6) else null end)
,huc_8                          generated always as (case when length(huc) > 7 then substr(huc,1,8) else null end)
,huc_10                         generated always as (case when length(huc) > 9 then substr(huc,1,10) else null end)
,huc_12                         generated always as (case when length(huc) = 12 then substr(huc,1,12) else null end)
,country_code                   generated always as (regexp_substr(governmental_unit_code, '[^:]+'))
,state_code                     generated always as (regexp_substr(governmental_unit_code, '[^:]+:[^:]+'))
,county_code                    generated always as (regexp_substr(governmental_unit_code, '[^:]+:[^:]+:[^:]+'))
)
parallel 4 compress pctfree 0 nologging cache;
--rollback drop table station_sum_swap_biodata cascade constraints purge;


--changeset drsteini:1BiodataTablesAD
create table result_sum_swap_biodata
(data_source_id                 number
,data_source                    varchar2(8 char)
,station_id                     number
,site_id                        varchar2(4000 char)
,event_date                     date
,analytical_method              varchar2(4000 char)
,p_code                         varchar2(4000 char)
,characteristic_name            varchar2(4000 char)
,characteristic_type            varchar2(4000 char)
,sample_media                   varchar2(4000 char)
,organization                   varchar2(4000 char)
,site_type                      varchar2(4000 char)
,huc                            varchar2(12 char)
,governmental_unit_code         varchar2(9 char)
,project_id                     varchar2(4000 char)
,assemblage_sampled_name		varchar2(4000 char)
,result_count                	number
,huc_2                          generated always as (case when length(huc) > 1 then substr(huc,1,2) else null end)
,huc_4                          generated always as (case when length(huc) > 3 then substr(huc,1,4) else null end)
,huc_6                          generated always as (case when length(huc) > 5 then substr(huc,1,6) else null end)
,huc_8                          generated always as (case when length(huc) > 7 then substr(huc,1,8) else null end)
,huc_10                         generated always as (case when length(huc) > 9 then substr(huc,1,10) else null end)
,huc_12                         generated always as (case when length(huc) = 12 then substr(huc,1,12) else null end)
,country_code                   generated always as (regexp_substr(governmental_unit_code, '[^:]+'))
,state_code                     generated always as (regexp_substr(governmental_unit_code, '[^:]+:[^:]+'))
,county_code                    generated always as (regexp_substr(governmental_unit_code, '[^:]+:[^:]+:[^:]+'))
) parallel 4 compress pctfree 0 nologging cache
partition by range (event_date)
    (partition result_sum_biodata_p_1990 values less than (to_date('01-JAN-1990', 'DD-MON-YYYY')),
     partition result_sum_biodata_y_1990 values less than (to_date('01-JAN-1991', 'DD-MON-YYYY')),
     partition result_sum_biodata_y_1991 values less than (to_date('01-JAN-1992', 'DD-MON-YYYY')),
     partition result_sum_biodata_y_1992 values less than (to_date('01-JAN-1993', 'DD-MON-YYYY')),
     partition result_sum_biodata_y_1993 values less than (to_date('01-JAN-1994', 'DD-MON-YYYY')),
     partition result_sum_biodata_y_1994 values less than (to_date('01-JAN-1995', 'DD-MON-YYYY')),
     partition result_sum_biodata_y_1995 values less than (to_date('01-JAN-1996', 'DD-MON-YYYY')),
     partition result_sum_biodata_y_1996 values less than (to_date('01-JAN-1997', 'DD-MON-YYYY')),
     partition result_sum_biodata_y_1997 values less than (to_date('01-JAN-1998', 'DD-MON-YYYY')),
     partition result_sum_biodata_y_1998 values less than (to_date('01-JAN-1999', 'DD-MON-YYYY')),
     partition result_sum_biodata_y_1999 values less than (to_date('01-JAN-2000', 'DD-MON-YYYY')),
     partition result_sum_biodata_y_2000 values less than (to_date('01-JAN-2001', 'DD-MON-YYYY')),
     partition result_sum_biodata_y_2001 values less than (to_date('01-JAN-2002', 'DD-MON-YYYY')),
     partition result_sum_biodata_y_2002 values less than (to_date('01-JAN-2003', 'DD-MON-YYYY')),
     partition result_sum_biodata_y_2003 values less than (to_date('01-JAN-2004', 'DD-MON-YYYY')),
     partition result_sum_biodata_y_2004 values less than (to_date('01-JAN-2005', 'DD-MON-YYYY')),
     partition result_sum_biodata_y_2005 values less than (to_date('01-JAN-2006', 'DD-MON-YYYY')),
     partition result_sum_biodata_y_2006 values less than (to_date('01-JAN-2007', 'DD-MON-YYYY')),
     partition result_sum_biodata_y_2007 values less than (to_date('01-JAN-2008', 'DD-MON-YYYY')),
     partition result_sum_biodata_y_2008 values less than (to_date('01-JAN-2009', 'DD-MON-YYYY')),
     partition result_sum_biodata_y_2009 values less than (to_date('01-JAN-2010', 'DD-MON-YYYY')),
     partition result_sum_biodata_y_2010 values less than (to_date('01-JAN-2011', 'DD-MON-YYYY')),
     partition result_sum_biodata_y_2011 values less than (to_date('01-JAN-2012', 'DD-MON-YYYY')),
     partition result_sum_biodata_y_2012 values less than (to_date('01-JAN-2013', 'DD-MON-YYYY')),
     partition result_sum_biodata_y_2013 values less than (to_date('01-JAN-2014', 'DD-MON-YYYY')),
     partition result_sum_biodata_y_2014 values less than (to_date('01-JAN-2015', 'DD-MON-YYYY')),
     partition result_sum_biodata_y_2015 values less than (to_date('01-JAN-2016', 'DD-MON-YYYY')),
     partition result_sum_biodata_y_2016 values less than (to_date('01-JAN-2017', 'DD-MON-YYYY')),
     partition result_sum_biodata_y_maxx values less than (maxvalue)
    );
--rollback drop table result_sum_swap_biodata cascade constraints purge;


--changeset drsteini:1BiodataTablesAE
create table result_ct_sum_swap_biodata
(data_source_id					number
,data_source					varchar2(8 char)
,station_id 					number
,site_id						varchar2(4000 char)
,analytical_method				varchar2(4000 char)
,p_code							varchar2(4000 char)
,characteristic_name			varchar2(4000 char)
,characteristic_type			varchar2(4000 char)
,sample_media					varchar2(4000 char)
,organization					varchar2(4000 char)
,site_type						varchar2(4000 char)
,huc							varchar2(12 char)
,governmental_unit_code			varchar2(9 char)
,project_id                     varchar2(4000 char)
,assemblage_sampled_name		varchar2(4000 char)
,result_count					number
,huc_2                          generated always as (case when length(huc) > 1 then substr(huc,1,2) else null end)
,huc_4                          generated always as (case when length(huc) > 3 then substr(huc,1,4) else null end)
,huc_6                          generated always as (case when length(huc) > 5 then substr(huc,1,6) else null end)
,huc_8                          generated always as (case when length(huc) > 7 then substr(huc,1,8) else null end)
,huc_10                         generated always as (case when length(huc) > 9 then substr(huc,1,10) else null end)
,huc_12                         generated always as (case when length(huc) = 12 then substr(huc,1,12) else null end)
,country_code                   generated always as (regexp_substr(governmental_unit_code, '[^:]+'))
,state_code                     generated always as (regexp_substr(governmental_unit_code, '[^:]+:[^:]+'))
,county_code                    generated always as (regexp_substr(governmental_unit_code, '[^:]+:[^:]+:[^:]+'))
) parallel 4 compress pctfree 0 nologging cache
partition by list (characteristic_type)
    (partition rcts_biodata_biol values ('Biological'),
     partition rcts_biodata_info values ('Information'),
     partition rcts_biodata_inorg1 values ('Inorganics, Major, Metals'),
     partition rcts_biodata_inorg2 values ('Inorganics, Major, Non-metals'),
     partition rcts_biodata_inorg3 values ('Inorganics, Minor, Metals'),
     partition rcts_biodata_inorg4 values ('Inorganics, Minor, Non-metals'),
     partition rcts_biodata_micro values ('Microbiological'),
     partition rcts_biodata_na values ('Not Assigned'),
     partition rcts_biodata_nut values ('Nutrient'),
     partition rcts_biodata_org1 values ('Organics, Other'),
     partition rcts_biodata_org2 values ('Organics, PCBs'),
     partition rcts_biodata_org3 values ('Organics, Pesticide'),
     partition rcts_biodata_phys values ('Physical'),
     partition rcts_biodata_pop values ('Population/Community'),
     partition rcts_biodata_radio values ('Radiochemical'),
     partition rcts_biodata_sed values ('Sediment'),
     partition rcts_biodata_iso values ('Stable Isotopes'),
     partition rcts_biodata_tox values ('Toxicity'),
     partition rcts_biodata_def values (default)
);
--rollback drop table result_ct_sum_swap_biodata cascade constraints purge;


--changeset drsteini:1BiodataTablesAF
create table result_nr_sum_swap_biodata
(data_source_id					number
,data_source					varchar2(8 char)
,station_id 					number
,event_date						date
,analytical_method				varchar2(4000 char)
,p_code							varchar2(4000 char)
,characteristic_name			varchar2(4000 char)
,characteristic_type			varchar2(4000 char)
,sample_media					varchar2(4000 char)
,project_id                     varchar2(4000 char)
,assemblage_sampled_name		varchar2(4000 char)
,result_count				number
) parallel 4 compress pctfree 0 nologging cache
partition by range (event_date)
    (partition res_nr_sum_biodata_p_1990 values less than (to_date('01-JAN-1990', 'DD-MON-YYYY')),
     partition res_nr_sum_biodata_y_1990 values less than (to_date('01-JAN-1991', 'DD-MON-YYYY')),
     partition res_nr_sum_biodata_y_1991 values less than (to_date('01-JAN-1992', 'DD-MON-YYYY')),
     partition res_nr_sum_biodata_y_1992 values less than (to_date('01-JAN-1993', 'DD-MON-YYYY')),
     partition res_nr_sum_biodata_y_1993 values less than (to_date('01-JAN-1994', 'DD-MON-YYYY')),
     partition res_nr_sum_biodata_y_1994 values less than (to_date('01-JAN-1995', 'DD-MON-YYYY')),
     partition res_nr_sum_biodata_y_1995 values less than (to_date('01-JAN-1996', 'DD-MON-YYYY')),
     partition res_nr_sum_biodata_y_1996 values less than (to_date('01-JAN-1997', 'DD-MON-YYYY')),
     partition res_nr_sum_biodata_y_1997 values less than (to_date('01-JAN-1998', 'DD-MON-YYYY')),
     partition res_nr_sum_biodata_y_1998 values less than (to_date('01-JAN-1999', 'DD-MON-YYYY')),
     partition res_nr_sum_biodata_y_1999 values less than (to_date('01-JAN-2000', 'DD-MON-YYYY')),
     partition res_nr_sum_biodata_y_2000 values less than (to_date('01-JAN-2001', 'DD-MON-YYYY')),
     partition res_nr_sum_biodata_y_2001 values less than (to_date('01-JAN-2002', 'DD-MON-YYYY')),
     partition res_nr_sum_biodata_y_2002 values less than (to_date('01-JAN-2003', 'DD-MON-YYYY')),
     partition res_nr_sum_biodata_y_2003 values less than (to_date('01-JAN-2004', 'DD-MON-YYYY')),
     partition res_nr_sum_biodata_y_2004 values less than (to_date('01-JAN-2005', 'DD-MON-YYYY')),
     partition res_nr_sum_biodata_y_2005 values less than (to_date('01-JAN-2006', 'DD-MON-YYYY')),
     partition res_nr_sum_biodata_y_2006 values less than (to_date('01-JAN-2007', 'DD-MON-YYYY')),
     partition res_nr_sum_biodata_y_2007 values less than (to_date('01-JAN-2008', 'DD-MON-YYYY')),
     partition res_nr_sum_biodata_y_2008 values less than (to_date('01-JAN-2009', 'DD-MON-YYYY')),
     partition res_nr_sum_biodata_y_2009 values less than (to_date('01-JAN-2010', 'DD-MON-YYYY')),
     partition res_nr_sum_biodata_y_2010 values less than (to_date('01-JAN-2011', 'DD-MON-YYYY')),
     partition res_nr_sum_biodata_y_2011 values less than (to_date('01-JAN-2012', 'DD-MON-YYYY')),
     partition res_nr_sum_biodata_y_2012 values less than (to_date('01-JAN-2013', 'DD-MON-YYYY')),
     partition res_nr_sum_biodata_y_2013 values less than (to_date('01-JAN-2014', 'DD-MON-YYYY')),
     partition res_nr_sum_biodata_y_2014 values less than (to_date('01-JAN-2015', 'DD-MON-YYYY')),
     partition res_nr_sum_biodata_y_2015 values less than (to_date('01-JAN-2016', 'DD-MON-YYYY')),
     partition res_nr_sum_biodata_y_2016 values less than (to_date('01-JAN-2017', 'DD-MON-YYYY')),
     partition res_nr_sum_biodata_y_maxx values less than (maxvalue)
    );
--rollback drop table result_nr_sum_swap_biodata cascade constraints purge;

    
--changeset drsteini:1BiodataTablesAG
create table char_name_swap_biodata
(data_source_id					number
,code_value						varchar2(500 char)
,description					varchar2(4000 char)
) parallel 4 compress pctfree 0 nologging cache;
--rollback drop table char_name_swap_biodata cascade constraints purge;


--changeset drsteini:1BiodataTablesAH
create table char_type_swap_biodata
(data_source_id					number
,code_value						varchar2(500 char)
,description					varchar2(4000 char)
) parallel 4 compress pctfree 0 nologging cache;
--rollback drop table char_type_swap_biodata cascade constraints purge;


--changeset drsteini:1BiodataTablesAI
create table country_swap_biodata
(data_source_id					number
,code_value						varchar2(500 char)
,description					varchar2(4000 char)
) parallel 4 compress pctfree 0 nologging cache;
--rollback drop table country_swap_biodata cascade constraints purge;


--changeset drsteini:1BiodataTablesAJ
create table county_swap_biodata
(data_source_id					number
,code_value						varchar2(500 char)
,description					varchar2(4000 char)
,country_code                   generated always as (regexp_substr(code_value, '[^:]+'))
,state_code                     generated always as (regexp_substr(code_value, '[^:]+:[^:]+'))
) parallel 4 compress pctfree 0 nologging cache;
--rollback drop table county_swap_biodata cascade constraints purge;


--changeset drsteini:1BiodataTablesAK
create table sample_media_swap_biodata
(data_source_id					number
,code_value						varchar2(500 char)
,description					varchar2(4000 char)
) parallel 4 compress pctfree 0 nologging cache;
--rollback drop table sample_media_swap_biodata cascade constraints purge;


--changeset drsteini:1BiodataTablesAL
create table organization_swap_biodata
(data_source_id					number
,code_value						varchar2(500 char)
,description					varchar2(4000 char)
) parallel 4 compress pctfree 0 nologging cache;
--rollback drop table organization_swap_biodata cascade constraints purge;


--changeset drsteini:1BiodataTablesAM
create table site_type_swap_biodata
(data_source_id					number
,code_value						varchar2(500 char)
,description					varchar2(4000 char)
) parallel 4 compress pctfree 0 nologging cache;
--rollback drop table site_type_swap_biodata cascade constraints purge;


--changeset drsteini:1BiodataTablesAO
create table state_swap_biodata
(data_source_id					number
,code_value						varchar2(500 char)
,description_with_country		varchar2(57 char)
,description_with_out_country	varchar2(53 char)
,country_code                   generated always as (regexp_substr(code_value, '[^:]+'))
) parallel 4 compress pctfree 0 nologging cache;
--rollback drop table state_swap_biodata cascade constraints purge;


--changeset drsteini:1BiodataTablesAS
create table project_swap_biodata
(data_source_id					number
,code_value						varchar2(500 char)
,description					varchar2(4000 char)
) parallel 4 compress pctfree 0 nologging cache;
--rollback drop table project_swap_biodata cascade constraints purge;


--changeset drsteini:1BiodataTablesAT
create table assemblage_swap_biodata
(data_source_id					number
,code_value						varchar2(500 char)
,description					varchar2(4000 char)
) parallel 4 compress pctfree 0 nologging cache;
--rollback drop table assemblage_swap_biodata cascade constraints purge;


--changeset drsteini:1BiodataTablesAU
create table biodata_activity
(dw_effort_id                   number
,station_id                     number
,site_id                        varchar2(4000 char)
,event_date                     date
,analytical_method				varchar2(4000 char)
,activity                       varchar2(4000 char)
,sample_media                   varchar2(4000 char)
,organization                   varchar2(4000 char)
,site_type                      varchar2(4000 char)
,huc                            varchar2(4000 char)
,governmental_unit_code         varchar2(4000 char)
,organization_name              varchar2(4000 char)
,activity_type_code             varchar2(4000 char)
,activity_media_subdiv_name     varchar2(4000 char)
,activity_start_time            varchar2(4000 char)
,act_start_time_zone            varchar2(4000 char)
,activity_stop_date             varchar2(4000 char)
,activity_stop_time             varchar2(4000 char)
,act_stop_time_zone             varchar2(4000 char)
,activity_relative_depth_name   varchar2(4000 char)
,activity_depth                 varchar2(4000 char)
,activity_depth_unit            varchar2(4000 char)
,activity_depth_ref_point       varchar2(4000 char)
,activity_upper_depth           varchar2(4000 char)
,activity_upper_depth_unit      varchar2(4000 char)
,activity_lower_depth           varchar2(4000 char)
,activity_lower_depth_unit      varchar2(4000 char)
,project_id                     varchar2(4000 char)
,activity_conducting_org        varchar2(4000 char)
,activity_comment               varchar2(4000 char)
,activity_latitude              number
,activity_longitude             number
,activity_source_map_scale      number
,act_horizontal_accuracy        varchar2(4000 char)
,act_horizontal_accuracy_unit   varchar2(4000 char)
,act_horizontal_collect_method  varchar2(4000 char)
,act_horizontal_datum_name      varchar2(4000 char)
,assemblage_sampled_name        varchar2(4000 char)
,act_collection_duration        varchar2(4000 char)
,act_collection_duration_unit   varchar2(4000 char)
,act_sam_compnt_name            varchar2(4000 char)
,act_sam_compnt_place_in_series number
,act_reach_length               varchar2(4000 char)
,act_reach_length_unit          varchar2(4000 char)
,act_reach_width                varchar2(4000 char)
,act_reach_width_unit           varchar2(4000 char)
,act_pass_count                 number
,net_type_name                  varchar2(4000 char)
,act_net_surface_area           varchar2(4000 char)
,act_net_surface_area_unit      varchar2(4000 char)
,act_net_mesh_size              varchar2(4000 char)
,act_net_mesh_size_unit         varchar2(4000 char)
,act_boat_speed                 varchar2(4000 char)
,act_boat_speed_unit            varchar2(4000 char)
,act_current_speed              varchar2(4000 char)
,act_current_speed_unit         varchar2(4000 char)
,toxicity_test_type_name        varchar2(4000 char)
,sample_collect_method_id       varchar2(4000 char)
,sample_collect_method_ctx      varchar2(4000 char)
,sample_collect_method_name     varchar2(4000 char)
,act_sam_collect_meth_qual_type varchar2(4000 char)
,act_sam_collect_meth_desc      varchar2(4000 char)
,sample_collect_equip_name      varchar2(4000 char)
,act_sam_collect_equip_comments varchar2(4000 char)
,act_sam_prep_meth_id           varchar2(4000 char)
,act_sam_prep_meth_context      varchar2(4000 char)
,act_sam_prep_meth_name         varchar2(4000 char)
,act_sam_prep_meth_qual_type    varchar2(4000 char)
,act_sam_prep_meth_desc         varchar2(4000 char)
,sample_container_type          varchar2(4000 char)
,sample_container_color         varchar2(4000 char)
,act_sam_chemical_preservative  varchar2(4000 char)
,thermal_preservative_name      varchar2(4000 char)
,act_sam_transport_storage_desc varchar2(4000 char)
) parallel 4 compress pctfree 0 nologging cache;
--rollback drop table biodata_activity cascade constraints purge;

--changeset drsteini:1BiodataTablesAV
create table taxa_name_swap_biodata
(data_source_id					number
,code_value						varchar2(500 char)
,description					varchar2(4000 char)
) parallel 4 compress pctfree 0 nologging cache;
--rollback drop table taxa_name_swap_biodata cascade constraints purge;

--changeset drsteini:1BiodataTablesAW
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_tab_cols where table_name = 'RESULT_SUM_SWAP_BIODATA' and column_name = 'SAMPLE_TISSUE_TAXONOMIC_NAME'
alter table result_sum_swap_biodata add (sample_tissue_taxonomic_name varchar2(4000 char));
--rollback select 'no rollback - cannot drop column from compressed table' from dual;

--changeset drsteini:1BiodataTablesAX
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_tab_cols where table_name = 'RESULT_CT_SUM_SWAP_BIODATA' and column_name = 'SAMPLE_TISSUE_TAXONOMIC_NAME'
alter table result_ct_sum_swap_biodata add (sample_tissue_taxonomic_name varchar2(4000 char));
--rollback select 'no rollback - cannot drop column from compressed table' from dual;

--changeset drsteini:1BiodataTablesAY
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_tab_cols where table_name = 'RESULT_NR_SUM_SWAP_BIODATA' and column_name = 'SAMPLE_TISSUE_TAXONOMIC_NAME'
alter table result_nr_sum_swap_biodata add (sample_tissue_taxonomic_name varchar2(4000 char));
--rollback select 'no rollback - cannot drop column from compressed table' from dual;

--changeset drsteini:WQP-788-create_project_dim_swap_biodata
create table project_dim_swap_biodata
(data_source_id					number
,code_value						varchar2(500 char)
,project_dim_value				varchar2(4000 char)
);
--rollback drop table project_dim_swap_biodata cascade constraints purge;
