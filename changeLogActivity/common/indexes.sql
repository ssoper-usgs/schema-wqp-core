--liquibase formatted sql

--This is for the wqp_core schema

--changeset drsteini:WQP-913-create-activity_activity_id
create bitmap index activity_activity_id on activity(activity_id) local parallel 4 nologging;
--rollback drop index activity_activity_id;

--changeset drsteini:WQP-913-create-activity_activity
create bitmap index activity_activity on activity(activity) local parallel 4 nologging;
--rollback drop index activity_activity;

--changeset drsteini:WQP-913-create-activity_country
create bitmap index activity_country on activity(country_code) local parallel 4 nologging;
--rollback drop index activity_country;

--changeset drsteini:WQP-913-create-activity_county
create bitmap index activity_county on activity(county_code) local parallel 4 nologging;
--rollback drop index activity_county;

--changeset drsteini:WQP-913-create-activity_event_date
create bitmap index activity_event_date on activity(event_date) local parallel 4 nologging;
--rollback drop index activity_event_date;

--changeset drsteini:WQP-913-create-activity_huc10
create bitmap index activity_huc10 on activity(huc_10) local parallel 4 nologging;
--rollback drop index activity_huc10;

--changeset drsteini:WQP-913-create-activity_huc12
create bitmap index activity_huc12 on activity(huc_12) local parallel 4 nologging;
--rollback drop index activity_huc12;

--changeset drsteini:WQP-913-create-activity_huc2
create bitmap index activity_huc2 on activity(huc_2) local parallel 4 nologging;
--rollback drop index activity_huc2;

--changeset drsteini:WQP-913-create-activity_huc4
create bitmap index activity_huc4 on activity(huc_4) local parallel 4 nologging;
--rollback drop index activity_huc4;

--changeset drsteini:WQP-913-create-activity_huc6
create bitmap index activity_huc6 on activity(huc_6) local parallel 4 nologging;
--rollback drop index activity_huc6;

--changeset drsteini:WQP-913-create-activity_huc8
create bitmap index activity_huc8 on activity(huc_8) local parallel 4 nologging;
--rollback drop index activity_huc8;

--changeset drsteini:WQP-913-create-activity_organization
create bitmap index activity_organization on activity(organization) local parallel 4 nologging;
--rollback drop index activity_organization;

--changeset drsteini:WQP-913-create-activity_sample_media
create bitmap index activity_sample_media on activity(sample_media) local parallel 4 nologging;
--rollback drop index activity_sample_media;

--changeset drsteini:WQP-913-create-activity_site
create bitmap index activity_site on activity(site_id) local parallel 4 nologging;
--rollback drop index activity_site;

--changeset drsteini:WQP-913-create-activity_site_type
create bitmap index activity_site_type on activity(site_type) local parallel 4 nologging;
--rollback drop index activity_site_type;

--changeset drsteini:WQP-913-create-activity_state
create bitmap index activity_state on activity(state_code) local parallel 4 nologging;
--rollback drop index activity_state;

--changeset drsteini:WQP-913-create-activity_station
create bitmap index activity_station on activity(station_id) local parallel 4 nologging;
--rollback drop index activity_station;



--changeset drsteini:WQP-913-create-act_metric_activity_id
create bitmap index act_metric_activity_id on act_metric(activity_id) local parallel 4 nologging;
--rollback drop index act_metric_activity_id;

--changeset drsteini:WQP-913-create-act_metric_activity
create bitmap index act_metric_activity on act_metric(activity) local parallel 4 nologging;
--rollback drop index act_metric_activity;

--changeset drsteini:WQP-913-create-act_metric_country
create bitmap index act_metric_country on act_metric(country_code) local parallel 4 nologging;
--rollback drop index act_metric_country;

--changeset drsteini:WQP-913-create-act_metric_county
create bitmap index act_metric_county on act_metric(county_code) local parallel 4 nologging;
--rollback drop index act_metric_county;

--changeset drsteini:WQP-913-create-act_metric_event_date
create bitmap index act_metric_event_date on act_metric(event_date) local parallel 4 nologging;
--rollback drop index act_metric_event_date;

--changeset drsteini:WQP-913-create-act_metric_huc10
create bitmap index act_metric_huc10 on act_metric(huc_10) local parallel 4 nologging;
--rollback drop index act_metric_huc10;

--changeset drsteini:WQP-913-create-act_metric_huc12
create bitmap index act_metric_huc12 on act_metric(huc_12) local parallel 4 nologging;
--rollback drop index act_metric_huc12;

--changeset drsteini:WQP-913-create-act_metric_huc2
create bitmap index act_metric_huc2 on act_metric(huc_2) local parallel 4 nologging;
--rollback drop index act_metric_huc2;

--changeset drsteini:WQP-913-create-act_metric_huc4
create bitmap index act_metric_huc4 on act_metric(huc_4) local parallel 4 nologging;
--rollback drop index act_metric_huc4;

--changeset drsteini:WQP-913-create-act_metric_huc6
create bitmap index act_metric_huc6 on act_metric(huc_6) local parallel 4 nologging;
--rollback drop index act_metric_huc6;

--changeset drsteini:WQP-913-create-act_metric_huc8
create bitmap index act_metric_huc8 on act_metric(huc_8) local parallel 4 nologging;
--rollback drop index act_metric_huc8;

--changeset drsteini:WQP-913-create-act_metric_organization
create bitmap index act_metric_organization on act_metric(organization) local parallel 4 nologging;
--rollback drop index act_metric_organization;

--changeset drsteini:WQP-913-create-act_metric_sample_media
create bitmap index act_metric_sample_media on act_metric(sample_media) local parallel 4 nologging;
--rollback drop index act_metric_sample_media;

--changeset drsteini:WQP-913-create-act_metric_site
create bitmap index act_metric_site on act_metric(site_id) local parallel 4 nologging;
--rollback drop index act_metric_site;

--changeset drsteini:WQP-913-create-act_metric_site_type
create bitmap index act_metric_site_type on act_metric(site_type) local parallel 4 nologging;
--rollback drop index act_metric_site_type;

--changeset drsteini:WQP-913-create-act_metric_state
create bitmap index act_metric_state on act_metric(state_code) local parallel 4 nologging;
--rollback drop index act_metric_state;

--changeset drsteini:WQP-913-create-act_metric_station
create bitmap index act_metric_station on act_metric(station_id) local parallel 4 nologging;
--rollback drop index act_metric_station;

--changeset drsteini:WQP-933-create-activity_sum_country
create bitmap index activity_sum_country on activity_sum(country_code) local parallel 4 nologging;
--rollback drop index activity_sum_country;

--changeset drsteini:WQP-933-create-activity_sum_county
create bitmap index activity_sum_county on activity_sum(county_code) local parallel 4 nologging;
--rollback drop index activity_sum_county;

--changeset drsteini:WQP-933-create-activity_sum_event_date
create bitmap index activity_sum_event_date on activity_sum(event_date) local parallel 4 nologging;
--rollback drop index activity_sum_event_date;

--changeset drsteini:WQP-933-create-activity_sum_huc10
create bitmap index activity_sum_huc10 on activity_sum(huc_10) local parallel 4 nologging;
--rollback drop index activity_sum_huc10;

--changeset drsteini:WQP-933-create-activity_sum_huc12
create bitmap index activity_sum_huc12 on activity_sum(huc_12) local parallel 4 nologging;
--rollback drop index activity_sum_huc12;

--changeset drsteini:WQP-933-create-activity_sum_huc2
create bitmap index activity_sum_huc2 on activity_sum(huc_2) local parallel 4 nologging;
--rollback drop index activity_sum_huc2;

--changeset drsteini:WQP-933-create-activity_sum_huc4
create bitmap index activity_sum_huc4 on activity_sum(huc_4) local parallel 4 nologging;
--rollback drop index activity_sum_huc4;

--changeset drsteini:WQP-933-create-activity_sum_huc6
create bitmap index activity_sum_huc6 on activity_sum(huc_6) local parallel 4 nologging;
--rollback drop index activity_sum_huc6;

--changeset drsteini:WQP-933-create-activity_sum_huc8
create bitmap index activity_sum_huc8 on activity_sum(huc_8) local parallel 4 nologging;
--rollback drop index activity_sum_huc8;

--changeset drsteini:WQP-933-create-activity_sum_organization
create bitmap index activity_sum_organization on activity_sum(organization) local parallel 4 nologging;
--rollback drop index activity_sum_organization;

--changeset drsteini:WQP-933-create-activity_sum_project
create bitmap index activity_sum_project on activity_sum(project_id) local parallel 4 nologging;
--rollback drop index activity_sum_project;

--changeset drsteini:WQP-933-create-activity_sum_sample_media
create bitmap index activity_sum_sample_media on activity_sum(sample_media) local parallel 4 nologging;
--rollback drop index activity_sum_sample_media;

--changeset drsteini:WQP-933-create-activity_sum_site
create bitmap index activity_sum_site on activity_sum(site_id) local parallel 4 nologging;
--rollback drop index activity_sum_site;

--changeset drsteini:WQP-933-create-activity_sum_site_type
create bitmap index activity_sum_site_type on activity_sum(site_type) local parallel 4 nologging;
--rollback drop index activity_sum_site_type;

--changeset drsteini:WQP-933-create-activity_sum_state
create bitmap index activity_sum_state on activity_sum(state_code) local parallel 4 nologging;
--rollback drop index activity_sum_state;

--changeset drsteini:WQP-933-create-activity_sum_station
create bitmap index activity_sum_station on activity_sum(station_id) local parallel 4 nologging;
--rollback drop index activity_sum_station;

--changeset drsteini:create.r_detect_qnt_lmt_activity
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'R_DETECT_QNT_LMT_ACTIVITY';
create bitmap index r_detect_qnt_lmt_activity on res_detect_qnt_lmt(activity) local parallel 4 nologging;
--rollback drop index r_detect_qnt_lmt_activity;

--changeset drsteini:create.r_detect_qnt_lmt_analytical
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'R_DETECT_QNT_LMT_ANALYTICAL';
create bitmap index r_detect_qnt_lmt_analytical on res_detect_qnt_lmt(analytical_method) local parallel 4 nologging;
--rollback drop index r_detect_qnt_lmt_analytical;

--changeset drsteini:create.r_detect_qnt_lmt_assemblage
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'R_DETECT_QNT_LMT_ASSEMBLAGE';
create bitmap index r_detect_qnt_lmt_assemblage on res_detect_qnt_lmt(assemblage_sampled_name) local parallel 4 nologging;
--rollback drop index r_detect_qnt_lmt_assemblage;

--changeset drsteini:create.r_detect_qnt_lmt_char_name
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'R_DETECT_QNT_LMT_CHAR_NAME';
create bitmap index r_detect_qnt_lmt_char_name on res_detect_qnt_lmt(characteristic_name) local parallel 4 nologging;
--rollback drop index r_detect_qnt_lmt_char_name;

--changeset drsteini:create.r_detect_qnt_lmt_char_type
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'R_DETECT_QNT_LMT_CHAR_TYPE';
create bitmap index r_detect_qnt_lmt_char_type on res_detect_qnt_lmt(characteristic_type) local parallel 4 nologging;
--rollback drop index r_detect_qnt_lmt_char_type;

--changeset drsteini:create.r_detect_qnt_lmt_country
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'R_DETECT_QNT_LMT_COUNTRY';
create bitmap index r_detect_qnt_lmt_country on res_detect_qnt_lmt(country_code) local parallel 4 nologging;
--rollback drop index r_detect_qnt_lmt_country;

--changeset drsteini:create.r_detect_qnt_lmt_county
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'R_DETECT_QNT_LMT_COUNTY';
create bitmap index r_detect_qnt_lmt_county on res_detect_qnt_lmt(county_code) local parallel 4 nologging;
--rollback drop index r_detect_qnt_lmt_county;

--changeset drsteini:create.r_detect_qnt_lmt_event_date
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'R_DETECT_QNT_LMT_EVENT_DATE';
create bitmap index r_detect_qnt_lmt_event_date on res_detect_qnt_lmt(event_date) local parallel 4 nologging;
--rollback drop index r_detect_qnt_lmt_event_date;

--changeset drsteini:create.r_detect_qnt_lmt_huc2
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'R_DETECT_QNT_LMT_HUC2';
create bitmap index r_detect_qnt_lmt_huc2 on res_detect_qnt_lmt(huc_2) local parallel 4 nologging;
--rollback drop index r_detect_qnt_lmt_huc2;

--changeset drsteini:create.r_detect_qnt_lmt_huc4
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'R_DETECT_QNT_LMT_HUC4';
create bitmap index r_detect_qnt_lmt_huc4 on res_detect_qnt_lmt(huc_4) local parallel 4 nologging;
--rollback drop index r_detect_qnt_lmt_huc4;

--changeset drsteini:create.r_detect_qnt_lmt_huc6
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'R_DETECT_QNT_LMT_HUC6';
create bitmap index r_detect_qnt_lmt_huc6 on res_detect_qnt_lmt(huc_6) local parallel 4 nologging;
--rollback drop index r_detect_qnt_lmt_huc6;

--changeset drsteini:create.r_detect_qnt_lmt_huc8
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'R_DETECT_QNT_LMT_HUC8';
create bitmap index r_detect_qnt_lmt_huc8 on res_detect_qnt_lmt(huc_8) local parallel 4 nologging;
--rollback drop index r_detect_qnt_lmt_huc8;

--changeset drsteini:create.r_detect_qnt_lmt_huc10
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'R_DETECT_QNT_LMT_HUC10';
create bitmap index r_detect_qnt_lmt_huc10 on res_detect_qnt_lmt(huc_10) local parallel 4 nologging;
--rollback drop index r_detect_qnt_lmt_huc10;

--changeset drsteini:create.r_detect_qnt_lmt_huc12
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'R_DETECT_QNT_LMT_HUC12';
create bitmap index r_detect_qnt_lmt_huc12 on res_detect_qnt_lmt(HUC_12) local parallel 4 nologging;
--rollback drop index r_detect_qnt_lmt_huc12;

--changeset drsteini:create.r_detect_qnt_lmt_organization
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'R_DETECT_QNT_LMT_ORGANIZATION';
create bitmap index r_detect_qnt_lmt_organization on res_detect_qnt_lmt(organization) local parallel 4 nologging;
--rollback drop index r_detect_qnt_lmt_organization;

--changeset drsteini:create.r_detect_qnt_lmt_p_code
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'R_DETECT_QNT_LMT_P_CODE';
create bitmap index r_detect_qnt_lmt_p_code on res_detect_qnt_lmt(p_code) local parallel 4 nologging;
--rollback drop index r_detect_qnt_lmt_p_code;

--changeset drsteini:create.r_detect_qnt_lmt_project
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'R_DETECT_QNT_LMT_PROJECT';
create bitmap index r_detect_qnt_lmt_project on res_detect_qnt_lmt(project_id) local parallel 4 nologging;
--rollback drop index r_detect_qnt_lmt_project;

--changeset drsteini:create.r_detect_qnt_lmt_result
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'R_DETECT_QNT_LMT_RESULT';
create bitmap index r_detect_qnt_lmt_result on res_detect_qnt_lmt(result_id) local parallel 4 nologging;
--rollback drop index r_detect_qnt_lmt_result;

--changeset drsteini:create.r_detect_qnt_lmt_sample_media
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'R_DETECT_QNT_LMT_SAMPLE_MEDIA';
create bitmap index r_detect_qnt_lmt_sample_media on res_detect_qnt_lmt(sample_media) local parallel 4 nologging;
--rollback drop index r_detect_qnt_lmt_sample_media;

--changeset drsteini:create.r_detect_qnt_lmt_site
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'R_DETECT_QNT_LMT_SITE';
create bitmap index r_detect_qnt_lmt_site on res_detect_qnt_lmt(site_id) local parallel 4 nologging;
--rollback drop index r_detect_qnt_lmt_site;

--changeset drsteini:create.r_detect_qnt_lmt_site_type
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'R_DETECT_QNT_LMT_SITE_TYPE';
create bitmap index r_detect_qnt_lmt_site_type on res_detect_qnt_lmt(site_type) local parallel 4 nologging;
--rollback drop index r_detect_qnt_lmt_site_type;

--changeset drsteini:create.r_detect_qnt_lmt_state
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'R_DETECT_QNT_LMT_STATE';
create bitmap index r_detect_qnt_lmt_state on res_detect_qnt_lmt(state_code) local parallel 4 nologging;
--rollback drop index r_detect_qnt_lmt_state;

--changeset drsteini:create.r_detect_qnt_lmt_station
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'R_DETECT_QNT_LMT_STATION';
create bitmap index r_detect_qnt_lmt_station on res_detect_qnt_lmt(station_id) local parallel 4 nologging;
--rollback drop index r_detect_qnt_lmt_station;

--changeset drsteini:create.r_detect_qnt_lmt_taxa_name
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'R_DETECT_QNT_LMT_TAXA_NAME';
create bitmap index r_detect_qnt_lmt_taxa_name on res_detect_qnt_lmt(sample_tissue_taxonomic_name) local parallel 4 nologging;
--rollback drop index r_detect_qnt_lmt_taxa_name;
