--liquibase formatted sql

--This is for the wqp_core schema

--changeset drsteini:1CommonTablesAA
create table station
(data_source_id					number
,data_source					varchar2(8 char)
,station_id 					number
,site_id						varchar2(4000 char)
,organization					varchar2(4000 char)
,site_type						varchar2(4000 char)
,huc							varchar2(12 char)
,governmental_unit_code			varchar2(9 char)
,geom							mdsys.sdo_geometry
,station_name                   varchar2(4000 char)
,organization_name              varchar2(4000 char)
,description_text               varchar2(4000 char)
,station_type_name				varchar2(4000 char)
,latitude                 		number
,longitude                		number
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
) parallel 4 compress pctfree 0 nologging cache
partition by range (data_source_id)
(partition station_stewards values less than (2)
,partition station_nwis values less than (3)
,partition station_storet values less than (4)
,partition station_garbage values less than (maxvalue)
);
--rollback drop table station cascade constraints purge;


--changeset drsteini:1CommonTablesAB
create table pc_result
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
,sample_collect_method_id       varchar2(4000 char)
,sample_collect_method_ctx      varchar2(4000 char)
,sample_collect_method_name     varchar2(4000 char)
,sample_collect_equip_name      varchar2(4000 char)
,result_id                      number
,result_detection_condition_tx  varchar2(4000 char)
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
,result_comment                 varchar2(4000 char)
,result_depth_meas_value        varchar2(4000 char)
,result_depth_meas_unit_code    varchar2(4000 char)
,result_depth_alt_ref_pt_txt    varchar2(4000 char)
,sample_tissue_taxonomic_name   varchar2(4000 char)
,sample_tissue_anatomy_name     varchar2(4000 char)
,analytical_procedure_id        varchar2(4000 char)
,analytical_procedure_source    varchar2(4000 char)
,analytical_method_name         varchar2(4000 char)
,analytical_method_citation     varchar2(4000 char)
,lab_name                       varchar2(4000 char)
,analysis_date_time             varchar2(4000 char)
,lab_remark                     varchar2(4000 char)
,detection_limit                varchar2(4000 char)
,detection_limit_unit           varchar2(4000 char)
,detection_limit_desc           varchar2(4000 char)
,analysis_prep_date_tx          varchar2(4000 char)
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
partition by range (data_source_id)
  subpartition by range (event_date)
  subpartition template
    (subpartition p_1990 values less than (to_date('01-JAN-1990', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_1990 values less than (to_date('01-JAN-1991', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_1991 values less than (to_date('01-JAN-1992', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_1992 values less than (to_date('01-JAN-1993', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_1993 values less than (to_date('01-JAN-1994', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_1994 values less than (to_date('01-JAN-1995', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_1995 values less than (to_date('01-JAN-1996', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_1996 values less than (to_date('01-JAN-1997', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_1997 values less than (to_date('01-JAN-1998', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_1998 values less than (to_date('01-JAN-1999', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_1999 values less than (to_date('01-JAN-2000', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_2000 values less than (to_date('01-JAN-2001', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_2001 values less than (to_date('01-JAN-2002', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_2002 values less than (to_date('01-JAN-2003', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_2003 values less than (to_date('01-JAN-2004', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_2004 values less than (to_date('01-JAN-2005', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_2005 values less than (to_date('01-JAN-2006', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_2006 values less than (to_date('01-JAN-2007', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_2007 values less than (to_date('01-JAN-2008', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_2008 values less than (to_date('01-JAN-2009', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_2009 values less than (to_date('01-JAN-2010', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_2010 values less than (to_date('01-JAN-2011', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_2011 values less than (to_date('01-JAN-2012', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_2012 values less than (to_date('01-JAN-2013', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_2013 values less than (to_date('01-JAN-2014', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_2014 values less than (to_date('01-JAN-2015', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_2015 values less than (to_date('01-JAN-2016', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_2016 values less than (to_date('01-JAN-2017', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_maxx values less than (maxvalue) tablespace result2
    )
(partition pc_result_stewards values less than (2)
,partition pc_result_nwis values less than (3)
,partition pc_result_storet values less than (4)
,partition pc_result_garbage values less than (maxvalue)
);
--rollback drop table pc_result cascade constraints purge;


--changeset drsteini:1CommonTablesAC
create table station_sum
(data_source_id					number
,data_source					varchar2(8 char)
,station_id 					number
,site_id						varchar2(4000 char)
,organization					varchar2(4000 char)
,site_type						varchar2(4000 char)
,huc							varchar2(12 char)
,governmental_unit_code			varchar2(9 char)
,geom							mdsys.sdo_geometry
,pc_result_count				number
,biological_result_count		number
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
partition by range (data_source_id)
(partition station_sum_stewards values less than (2)
,partition station_sum_nwis values less than (3)
,partition station_sum_storet values less than (4)
,partition station_sum_garbage values less than (maxvalue)
);
--rollback drop table station_sum cascade constraints purge;


--changeset drsteini:1CommonTablesAD
create table pc_result_sum
(data_source_id					number
,data_source					varchar2(8 char)
,station_id 					number
,site_id						varchar2(4000 char)
,event_date						date
,analytical_method				varchar2(4000 char)
,p_code							varchar2(4000 char)
,characteristic_name			varchar2(4000 char)
,characteristic_type			varchar2(4000 char)
,sample_media					varchar2(4000 char)
,organization					varchar2(4000 char)
,site_type						varchar2(4000 char)
,huc							varchar2(12 char)
,governmental_unit_code			varchar2(9 char)
,pc_result_count				number
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
partition by range (data_source_id)
  subpartition by range (event_date)
  subpartition template
    (subpartition p_1990 values less than (to_date('01-JAN-1990', 'DD-MON-YYYY')),
     subpartition y_1990 values less than (to_date('01-JAN-1991', 'DD-MON-YYYY')),
     subpartition y_1991 values less than (to_date('01-JAN-1992', 'DD-MON-YYYY')),
     subpartition y_1992 values less than (to_date('01-JAN-1993', 'DD-MON-YYYY')),
     subpartition y_1993 values less than (to_date('01-JAN-1994', 'DD-MON-YYYY')),
     subpartition y_1994 values less than (to_date('01-JAN-1995', 'DD-MON-YYYY')),
     subpartition y_1995 values less than (to_date('01-JAN-1996', 'DD-MON-YYYY')),
     subpartition y_1996 values less than (to_date('01-JAN-1997', 'DD-MON-YYYY')),
     subpartition y_1997 values less than (to_date('01-JAN-1998', 'DD-MON-YYYY')),
     subpartition y_1998 values less than (to_date('01-JAN-1999', 'DD-MON-YYYY')),
     subpartition y_1999 values less than (to_date('01-JAN-2000', 'DD-MON-YYYY')),
     subpartition y_2000 values less than (to_date('01-JAN-2001', 'DD-MON-YYYY')),
     subpartition y_2001 values less than (to_date('01-JAN-2002', 'DD-MON-YYYY')),
     subpartition y_2002 values less than (to_date('01-JAN-2003', 'DD-MON-YYYY')),
     subpartition y_2003 values less than (to_date('01-JAN-2004', 'DD-MON-YYYY')),
     subpartition y_2004 values less than (to_date('01-JAN-2005', 'DD-MON-YYYY')),
     subpartition y_2005 values less than (to_date('01-JAN-2006', 'DD-MON-YYYY')),
     subpartition y_2006 values less than (to_date('01-JAN-2007', 'DD-MON-YYYY')),
     subpartition y_2007 values less than (to_date('01-JAN-2008', 'DD-MON-YYYY')),
     subpartition y_2008 values less than (to_date('01-JAN-2009', 'DD-MON-YYYY')),
     subpartition y_2009 values less than (to_date('01-JAN-2010', 'DD-MON-YYYY')),
     subpartition y_2010 values less than (to_date('01-JAN-2011', 'DD-MON-YYYY')),
     subpartition y_2011 values less than (to_date('01-JAN-2012', 'DD-MON-YYYY')),
     subpartition y_2012 values less than (to_date('01-JAN-2013', 'DD-MON-YYYY')),
     subpartition y_2013 values less than (to_date('01-JAN-2014', 'DD-MON-YYYY')),
     subpartition y_2014 values less than (to_date('01-JAN-2015', 'DD-MON-YYYY')),
     subpartition y_2015 values less than (to_date('01-JAN-2016', 'DD-MON-YYYY')),
     subpartition y_2016 values less than (to_date('01-JAN-2017', 'DD-MON-YYYY')),
     subpartition y_maxx values less than (maxvalue)
    )
(partition pc_result_sum_stewards values less than (2)
,partition pc_result_sum_nwis values less than (3)
,partition pc_result_sum_storet values less than (4)
,partition pc_result_sum_garbage values less than (maxvalue)
);
--rollback drop table pc_result_sum cascade constraints purge;
 

--changeset drsteini:1CommonTablesAE
create table pc_result_ct_sum
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
,pc_result_count				number
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
partition by range (data_source_id)
  subpartition by list (characteristic_type)
  subpartition template
    (subpartition biol values ('Biological'),
     subpartition info values ('Information'),
     subpartition inorg1 values ('Inorganics, Major, Metals'),
     subpartition inorg2 values ('Inorganics, Major, Non-metals'),
     subpartition inorg3 values ('Inorganics, Minor, Metals'),
     subpartition inorg4 values ('Inorganics, Minor, Non-metals'),
     subpartition micro values ('Microbiological'),
     subpartition na values ('Not Assigned'),
     subpartition nut values ('Nutrient'),
     subpartition org1 values ('Organics, Other'),
     subpartition org2 values ('Organics, PCBs'),
     subpartition org3 values ('Organics, Pesticide'),
     subpartition phys values ('Physical'),
     subpartition pop values ('Population/Community'),
     subpartition radio values ('Radiochemical'),
     subpartition sed values ('Sediment'),
     subpartition iso values ('Stable Isotopes'),
     subpartition tox values ('Toxicity'),
     subpartition def values (default)
    )
(partition pcrcts_stewards values less than (2)
,partition pcrcts_nwis values less than (3)
,partition pcrcts_storet values less than (4)
,partition pcrcts_garbage values less than (maxvalue)
);
--rollback drop table pc_result_ct_sum cascade constraints purge;


--changeset drsteini:1CommonTablesAF
create table pc_result_nr_sum
(data_source_id					number
,data_source					varchar2(8 char)
,station_id 					number
,event_date						date
,analytical_method				varchar2(4000 char)
,p_code							varchar2(4000 char)
,characteristic_name			varchar2(4000 char)
,characteristic_type			varchar2(4000 char)
,sample_media					varchar2(4000 char)
,pc_result_count				number
) parallel 4 compress pctfree 0 nologging cache
partition by range (data_source_id)
  subpartition by range (event_date)
  subpartition template
    (subpartition p_1990 values less than (to_date('01-JAN-1990', 'DD-MON-YYYY')),
     subpartition y_1990 values less than (to_date('01-JAN-1991', 'DD-MON-YYYY')),
     subpartition y_1991 values less than (to_date('01-JAN-1992', 'DD-MON-YYYY')),
     subpartition y_1992 values less than (to_date('01-JAN-1993', 'DD-MON-YYYY')),
     subpartition y_1993 values less than (to_date('01-JAN-1994', 'DD-MON-YYYY')),
     subpartition y_1994 values less than (to_date('01-JAN-1995', 'DD-MON-YYYY')),
     subpartition y_1995 values less than (to_date('01-JAN-1996', 'DD-MON-YYYY')),
     subpartition y_1996 values less than (to_date('01-JAN-1997', 'DD-MON-YYYY')),
     subpartition y_1997 values less than (to_date('01-JAN-1998', 'DD-MON-YYYY')),
     subpartition y_1998 values less than (to_date('01-JAN-1999', 'DD-MON-YYYY')),
     subpartition y_1999 values less than (to_date('01-JAN-2000', 'DD-MON-YYYY')),
     subpartition y_2000 values less than (to_date('01-JAN-2001', 'DD-MON-YYYY')),
     subpartition y_2001 values less than (to_date('01-JAN-2002', 'DD-MON-YYYY')),
     subpartition y_2002 values less than (to_date('01-JAN-2003', 'DD-MON-YYYY')),
     subpartition y_2003 values less than (to_date('01-JAN-2004', 'DD-MON-YYYY')),
     subpartition y_2004 values less than (to_date('01-JAN-2005', 'DD-MON-YYYY')),
     subpartition y_2005 values less than (to_date('01-JAN-2006', 'DD-MON-YYYY')),
     subpartition y_2006 values less than (to_date('01-JAN-2007', 'DD-MON-YYYY')),
     subpartition y_2007 values less than (to_date('01-JAN-2008', 'DD-MON-YYYY')),
     subpartition y_2008 values less than (to_date('01-JAN-2009', 'DD-MON-YYYY')),
     subpartition y_2009 values less than (to_date('01-JAN-2010', 'DD-MON-YYYY')),
     subpartition y_2010 values less than (to_date('01-JAN-2011', 'DD-MON-YYYY')),
     subpartition y_2011 values less than (to_date('01-JAN-2012', 'DD-MON-YYYY')),
     subpartition y_2012 values less than (to_date('01-JAN-2013', 'DD-MON-YYYY')),
     subpartition y_2013 values less than (to_date('01-JAN-2014', 'DD-MON-YYYY')),
     subpartition y_2014 values less than (to_date('01-JAN-2015', 'DD-MON-YYYY')),
     subpartition y_2015 values less than (to_date('01-JAN-2016', 'DD-MON-YYYY')),
     subpartition y_2016 values less than (to_date('01-JAN-2017', 'DD-MON-YYYY')),
     subpartition y_maxx values less than (maxvalue)
    )
(partition pc_res_nr_sum_stewards values less than (2)
,partition pc_res_nr_sum_nwis values less than (3)
,partition pc_res_nr_sum_storet values less than (4)
,partition pc_res_nr_sum_garbage values less than (maxvalue)
);
--rollback drop table pc_result_nr_sum cascade constraints purge;


--changeset drsteini:1CommonTablesAG
create table char_name
(data_source_id					number
,code_value						varchar2(500 char)
,description					varchar2(4000 char)
) parallel 4 compress pctfree 0 nologging cache
partition by range (data_source_id)
(partition char_name_stewards values less than (2)
,partition char_name_nwis values less than (3)
,partition char_name_storet values less than (4)
,partition char_name_garbage values less than (maxvalue)
);
--rollback drop table char_name cascade constraints purge;


--changeset drsteini:1CommonTablesAH
create table char_type
(data_source_id					number
,code_value						varchar2(500 char)
,description					varchar2(4000 char)
) parallel 4 compress pctfree 0 nologging cache
partition by range (data_source_id)
(partition char_type_stewards values less than (2)
,partition char_type_nwis values less than (3)
,partition char_type_storet values less than (4)
,partition char_type_garbage values less than (maxvalue)
);
--rollback drop table char_type cascade constraints purge;


--changeset drsteini:1CommonTablesAI
create table country
(data_source_id					number
,code_value						varchar2(500 char)
,description					varchar2(4000 char)
) parallel 4 compress pctfree 0 nologging cache
partition by range (data_source_id)
(partition country_stewards values less than (2)
,partition country_nwis values less than (3)
,partition country_storet values less than (4)
,partition country_garbage values less than (maxvalue)
);
--rollback drop table country cascade constraints purge;


--changeset drsteini:1CommonTablesAJ
create table county
(data_source_id					number
,code_value						varchar2(500 char)
,description					varchar2(4000 char)
,country_code                   generated always as (regexp_substr(code_value, '[^:]+'))
,state_code                     generated always as (regexp_substr(code_value, '[^:]+:[^:]+'))
) parallel 4 compress pctfree 0 nologging cache
partition by range (data_source_id)
(partition county_stewards values less than (2)
,partition county_nwis values less than (3)
,partition county_storet values less than (4)
,partition county_garbage values less than (maxvalue)
);
--rollback drop table county cascade constraints purge;


--changeset drsteini:1CommonTablesAK
create table organization
(data_source_id					number
,code_value						varchar2(500 char)
,description					varchar2(4000 char)
) parallel 4 compress pctfree 0 nologging cache
partition by range (data_source_id)
(partition organization_stewards values less than (2)
,partition organization_nwis values less than (3)
,partition organization_storet values less than (4)
,partition organization_garbage values less than (maxvalue)
);
--rollback drop table organization cascade constraints purge;


--changeset drsteini:1CommonTablesAL
create table sample_media
(data_source_id					number
,code_value						varchar2(500 char)
,description					varchar2(4000 char)
) parallel 4 compress pctfree 0 nologging cache
partition by range (data_source_id)
(partition sample_media_stewards values less than (2)
,partition sample_media_nwis values less than (3)
,partition sample_media_storet values less than (4)
,partition sample_media_garbage values less than (maxvalue)
);
--rollback drop table sample_media cascade constraints purge;


--changeset drsteini:1CommonTablesAM
create table site_type
(data_source_id					number
,code_value						varchar2(500 char)
,description					varchar2(4000 char)
) parallel 4 compress pctfree 0 nologging cache
partition by range (data_source_id)
(partition site_type_stewards values less than (2)
,partition site_type_nwis values less than (3)
,partition site_type_storet values less than (4)
,partition site_type_garbage values less than (maxvalue)
);
--rollback drop table site_type cascade constraints purge;


--changeset drsteini:1CommonTablesAN
create table state
(data_source_id					number
,code_value						varchar2(500 char)
,description_with_country		varchar2(57 char)
,description_with_out_country	varchar2(53 char)
,country_code                   generated always as (regexp_substr(code_value, '[^:]+'))
) parallel 4 compress pctfree 0 nologging cache
partition by range (data_source_id)
(partition state_stewards values less than (2)
,partition state_nwis values less than (3)
,partition state_storet values less than (4)
,partition state_garbage values less than (maxvalue)
);
--rollback drop table state cascade constraints purge;


--changeset drsteini:1CommonTablesAO
create table qwportal_summary
(data_source_id					number
,fips_state_code				varchar2(2 char)
,fips_county_code				varchar2(3 char)
,fips_state_and_county			varchar2(5 char)
,site_type						varchar2(30 char)
,huc8							varchar2(8 char)
,min_date						date
,max_date						date
,samples_past_12_months			number
,samples_past_60_months			number
,samples_all_time				number
,results_past_12_months			number
,results_past_60_months			number
,results_all_time				number
,nwis_or_epa					generated always as (case data_source_id when 2 then 'N' when 3 then 'E' else null end)
) parallel 4 compress pctfree 0 nologging cache
partition by range (data_source_id)
(partition summary_stewards values less than (2)
,partition summary_nwis values less than (3)
,partition summary_storet values less than (4)
,partition summary_garbage values less than (maxvalue)
);
--rollback drop table qwportal_summary cascade constraints purge;


--changeset drsteini:1CommonTablesAP
create table last_etl
(data_source_id					number
,completed_utc					timestamp
);
--rollback drop table last_etl cascade constraints purge;


--changeset drsteini:1CommonTablesAQ
create table data_source
(data_source_id					number				constraint nn_data_source_pk not null
,text							varchar2(8)
,constraint data_source_pk
   primary key (data_source_id)
);
--rollback drop table data_source cascade constraints purge;


--changeset drsteini:1CommonTablesAR
create table huc8_conus_hi_ak_pr_dis 
(cat_num						varchar2(8 char)
,first_cat_						varchar2(60 char)
,geom							mdsys.sdo_geometry
);
--rollback drop table huc8_conus_hi_ak_pr_dis cascade constraints purge;


--changeset drsteini:1CommonTablesAS
create table us_counties_dis_20121015 
(fips							varchar2(5 char)
,area							float(63)
,perimeter						float(63)
,countyp010						float(63)
,state							varchar2(5 char)
,county_name					varchar2(50 char)
,state_fips						varchar2(2 char)
,square_mil						float(63)
,geom							mdsys.sdo_geometry
);
--rollback drop table us_counties_dis_20121015 cascade constraints purge;


--changeset drsteini:1CommonTablesAT
create table wqx_site_type_conversion
(mltyp_uid						number				constraint nn_wqx_site_type_conversion_pk not null
,mltyp_name						varchar2(45 char)
,station_group_type				varchar2(256 char)
,constraint wqx_site_type_conversion_pk
   primary key (mltyp_uid)
);
--rollback drop table wqx_site_type_conversion cascade constraints purge;
