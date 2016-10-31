--liquibase formatted sql

--This is for the wqp_core schema

--changeset drsteini:WQP-913-create-activity_swap_nwis
create table activity_swap_nwis
(data_source_id                 number
,data_source                    varchar2(8 char)
,station_id                     number
,site_id                        varchar2(4000 char)
,event_date                     date
,activity                       varchar2(4000 char)
,sample_media                   varchar2(4000 char)
,organization                   varchar2(4000 char)
,site_type                      varchar2(4000 char)
,huc                            varchar2(4000 char)
,governmental_unit_code         varchar2(4000 char)
,organization_name              varchar2(4000 char)
,activity_id                    number
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
(partition activity_nwis_p_1990 values less than (to_date('01-JAN-1990', 'DD-MON-YYYY')) tablespace result1,
 partition activity_nwis_y_1990 values less than (to_date('01-JAN-1991', 'DD-MON-YYYY')) tablespace result2,
 partition activity_nwis_y_1991 values less than (to_date('01-JAN-1992', 'DD-MON-YYYY')) tablespace result3,
 partition activity_nwis_y_1992 values less than (to_date('01-JAN-1993', 'DD-MON-YYYY')) tablespace result4,
 partition activity_nwis_y_1993 values less than (to_date('01-JAN-1994', 'DD-MON-YYYY')) tablespace result1,
 partition activity_nwis_y_1994 values less than (to_date('01-JAN-1995', 'DD-MON-YYYY')) tablespace result2,
 partition activity_nwis_y_1995 values less than (to_date('01-JAN-1996', 'DD-MON-YYYY')) tablespace result3,
 partition activity_nwis_y_1996 values less than (to_date('01-JAN-1997', 'DD-MON-YYYY')) tablespace result4,
 partition activity_nwis_y_1997 values less than (to_date('01-JAN-1998', 'DD-MON-YYYY')) tablespace result1,
 partition activity_nwis_y_1998 values less than (to_date('01-JAN-1999', 'DD-MON-YYYY')) tablespace result2,
 partition activity_nwis_y_1999 values less than (to_date('01-JAN-2000', 'DD-MON-YYYY')) tablespace result3,
 partition activity_nwis_y_2000 values less than (to_date('01-JAN-2001', 'DD-MON-YYYY')) tablespace result4,
 partition activity_nwis_y_2001 values less than (to_date('01-JAN-2002', 'DD-MON-YYYY')) tablespace result1,
 partition activity_nwis_y_2002 values less than (to_date('01-JAN-2003', 'DD-MON-YYYY')) tablespace result2,
 partition activity_nwis_y_2003 values less than (to_date('01-JAN-2004', 'DD-MON-YYYY')) tablespace result3,
 partition activity_nwis_y_2004 values less than (to_date('01-JAN-2005', 'DD-MON-YYYY')) tablespace result4,
 partition activity_nwis_y_2005 values less than (to_date('01-JAN-2006', 'DD-MON-YYYY')) tablespace result1,
 partition activity_nwis_y_2006 values less than (to_date('01-JAN-2007', 'DD-MON-YYYY')) tablespace result2,
 partition activity_nwis_y_2007 values less than (to_date('01-JAN-2008', 'DD-MON-YYYY')) tablespace result3,
 partition activity_nwis_y_2008 values less than (to_date('01-JAN-2009', 'DD-MON-YYYY')) tablespace result4,
 partition activity_nwis_y_2009 values less than (to_date('01-JAN-2010', 'DD-MON-YYYY')) tablespace result1,
 partition activity_nwis_y_2010 values less than (to_date('01-JAN-2011', 'DD-MON-YYYY')) tablespace result2,
 partition activity_nwis_y_2011 values less than (to_date('01-JAN-2012', 'DD-MON-YYYY')) tablespace result3,
 partition activity_nwis_y_2012 values less than (to_date('01-JAN-2013', 'DD-MON-YYYY')) tablespace result4,
 partition activity_nwis_y_2013 values less than (to_date('01-JAN-2014', 'DD-MON-YYYY')) tablespace result1,
 partition activity_nwis_y_2014 values less than (to_date('01-JAN-2015', 'DD-MON-YYYY')) tablespace result2,
 partition activity_nwis_y_2015 values less than (to_date('01-JAN-2016', 'DD-MON-YYYY')) tablespace result3,
 partition activity_nwis_y_2016 values less than (to_date('01-JAN-2017', 'DD-MON-YYYY')) tablespace result4,
 partition activity_nwis_y_maxx values less than (maxvalue) tablespace result2
);
--rollback drop table activity_swap_nwis cascade constraints purge;

--changeset drsteini:WQP-913-create-act_metric_swap_nwis
create table act_metric_swap_nwis
(data_source_id                 number
,data_source                    varchar2(8 char)
,station_id                     number
,site_id                        varchar2(4000 char)
,event_date                     date
,activity                       varchar2(4000 char)
,sample_media                   varchar2(4000 char)
,organization                   varchar2(4000 char)
,site_type                      varchar2(4000 char)
,huc                            varchar2(4000 char)
,governmental_unit_code         varchar2(4000 char)
,organization_name              varchar2(4000 char)
,activity_id                    number
,type_identifier                varchar2(4000 char)
,identifier_context             varchar2(4000 char)
,type_name                      varchar2(4000 char)
,resource_title                 varchar2(4000 char)
,resource_creator               varchar2(4000 char)
,resource_subject               varchar2(4000 char)
,resource_publisher             varchar2(4000 char)
,resource_date                  varchar2(4000 char)
,resource_identifier            varchar2(4000 char)
,type_scale                     varchar2(4000 char)
,formula_description            varchar2(4000 char)
,measure_value                  varchar2(4000 char)
,unit_code                      varchar2(4000 char)
,score                          varchar2(4000 char)
,comment_text                   varchar2(4000 char)
,index_identifier               varchar2(4000 char)
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
(partition act_metric_nwis_p_1990 values less than (to_date('01-JAN-1990', 'DD-MON-YYYY')) tablespace result1,
 partition act_metric_nwis_y_1990 values less than (to_date('01-JAN-1991', 'DD-MON-YYYY')) tablespace result2,
 partition act_metric_nwis_y_1991 values less than (to_date('01-JAN-1992', 'DD-MON-YYYY')) tablespace result3,
 partition act_metric_nwis_y_1992 values less than (to_date('01-JAN-1993', 'DD-MON-YYYY')) tablespace result4,
 partition act_metric_nwis_y_1993 values less than (to_date('01-JAN-1994', 'DD-MON-YYYY')) tablespace result1,
 partition act_metric_nwis_y_1994 values less than (to_date('01-JAN-1995', 'DD-MON-YYYY')) tablespace result2,
 partition act_metric_nwis_y_1995 values less than (to_date('01-JAN-1996', 'DD-MON-YYYY')) tablespace result3,
 partition act_metric_nwis_y_1996 values less than (to_date('01-JAN-1997', 'DD-MON-YYYY')) tablespace result4,
 partition act_metric_nwis_y_1997 values less than (to_date('01-JAN-1998', 'DD-MON-YYYY')) tablespace result1,
 partition act_metric_nwis_y_1998 values less than (to_date('01-JAN-1999', 'DD-MON-YYYY')) tablespace result2,
 partition act_metric_nwis_y_1999 values less than (to_date('01-JAN-2000', 'DD-MON-YYYY')) tablespace result3,
 partition act_metric_nwis_y_2000 values less than (to_date('01-JAN-2001', 'DD-MON-YYYY')) tablespace result4,
 partition act_metric_nwis_y_2001 values less than (to_date('01-JAN-2002', 'DD-MON-YYYY')) tablespace result1,
 partition act_metric_nwis_y_2002 values less than (to_date('01-JAN-2003', 'DD-MON-YYYY')) tablespace result2,
 partition act_metric_nwis_y_2003 values less than (to_date('01-JAN-2004', 'DD-MON-YYYY')) tablespace result3,
 partition act_metric_nwis_y_2004 values less than (to_date('01-JAN-2005', 'DD-MON-YYYY')) tablespace result4,
 partition act_metric_nwis_y_2005 values less than (to_date('01-JAN-2006', 'DD-MON-YYYY')) tablespace result1,
 partition act_metric_nwis_y_2006 values less than (to_date('01-JAN-2007', 'DD-MON-YYYY')) tablespace result2,
 partition act_metric_nwis_y_2007 values less than (to_date('01-JAN-2008', 'DD-MON-YYYY')) tablespace result3,
 partition act_metric_nwis_y_2008 values less than (to_date('01-JAN-2009', 'DD-MON-YYYY')) tablespace result4,
 partition act_metric_nwis_y_2009 values less than (to_date('01-JAN-2010', 'DD-MON-YYYY')) tablespace result1,
 partition act_metric_nwis_y_2010 values less than (to_date('01-JAN-2011', 'DD-MON-YYYY')) tablespace result2,
 partition act_metric_nwis_y_2011 values less than (to_date('01-JAN-2012', 'DD-MON-YYYY')) tablespace result3,
 partition act_metric_nwis_y_2012 values less than (to_date('01-JAN-2013', 'DD-MON-YYYY')) tablespace result4,
 partition act_metric_nwis_y_2013 values less than (to_date('01-JAN-2014', 'DD-MON-YYYY')) tablespace result1,
 partition act_metric_nwis_y_2014 values less than (to_date('01-JAN-2015', 'DD-MON-YYYY')) tablespace result2,
 partition act_metric_nwis_y_2015 values less than (to_date('01-JAN-2016', 'DD-MON-YYYY')) tablespace result3,
 partition act_metric_nwis_y_2016 values less than (to_date('01-JAN-2017', 'DD-MON-YYYY')) tablespace result4,
 partition act_metric_nwis_y_maxx values less than (maxvalue) tablespace result2
);
--rollback drop table act_metric_swap_nwis cascade constraints purge;
