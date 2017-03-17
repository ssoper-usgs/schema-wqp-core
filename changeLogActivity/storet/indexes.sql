--liquibase formatted sql

--This is for the wqp_core schema

--changeset drsteini:WQP-913-create-a_storet_activity_id
create bitmap index a_storet_activity_id on activity_swap_storet(activity_id) local parallel 4 nologging;
--rollback drop index a_storet_activity_id;

--changeset drsteini:WQP-913-create-a_storet_activity
create bitmap index a_storet_activity on activity_swap_storet(activity) local parallel 4 nologging;
--rollback drop index a_storet_activity;

--changeset drsteini:WQP-913-create-a_storet_country
create bitmap index a_storet_country on activity_swap_storet(country_code) local parallel 4 nologging;
--rollback drop index a_storet_country;

--changeset drsteini:WQP-913-create-a_storet_county
create bitmap index a_storet_county on activity_swap_storet(county_code) local parallel 4 nologging;
--rollback drop index a_storet_county;

--changeset drsteini:WQP-913-create-a_storet_event_date
create bitmap index a_storet_event_date on activity_swap_storet(event_date) local parallel 4 nologging;
--rollback drop index a_storet_event_date;

--changeset drsteini:WQP-913-create-a_storet_huc10
create bitmap index a_storet_huc10 on activity_swap_storet(huc_10) local parallel 4 nologging;
--rollback drop index a_storet_huc10;

--changeset drsteini:WQP-913-create-a_storet_huc12
create bitmap index a_storet_huc12 on activity_swap_storet(huc_12) local parallel 4 nologging;
--rollback drop index a_storet_huc12;

--changeset drsteini:WQP-913-create-a_storet_huc2
create bitmap index a_storet_huc2 on activity_swap_storet(huc_2) local parallel 4 nologging;
--rollback drop index a_storet_huc2;

--changeset drsteini:WQP-913-create-a_storet_huc4
create bitmap index a_storet_huc4 on activity_swap_storet(huc_4) local parallel 4 nologging;
--rollback drop index a_storet_huc4;

--changeset drsteini:WQP-913-create-a_storet_huc6
create bitmap index a_storet_huc6 on activity_swap_storet(huc_6) local parallel 4 nologging;
--rollback drop index a_storet_huc6;

--changeset drsteini:WQP-913-create-a_storet_huc8
create bitmap index a_storet_huc8 on activity_swap_storet(huc_8) local parallel 4 nologging;
--rollback drop index a_storet_huc8;

--changeset drsteini:WQP-913-create-a_storet_organization
create bitmap index a_storet_organization on activity_swap_storet(organization) local parallel 4 nologging;
--rollback drop index a_storet_organization;

--changeset drsteini:WQP-913-create-a_storet_sample_media
create bitmap index a_storet_sample_media on activity_swap_storet(sample_media) local parallel 4 nologging;
--rollback drop index a_storet_sample_media;

--changeset drsteini:WQP-913-create-a_storet_site
create bitmap index a_storet_site on activity_swap_storet(site_id) local parallel 4 nologging;
--rollback drop index a_storet_site;

--changeset drsteini:WQP-913-create-a_storet_site_type
create bitmap index a_storet_site_type on activity_swap_storet(site_type) local parallel 4 nologging;
--rollback drop index a_storet_site_type;

--changeset drsteini:WQP-913-create-a_storet_state
create bitmap index a_storet_state on activity_swap_storet(state_code) local parallel 4 nologging;
--rollback drop index a_storet_state;

--changeset drsteini:WQP-913-create-a_storet_station
create bitmap index a_storet_station on activity_swap_storet(station_id) local parallel 4 nologging;
--rollback drop index a_storet_station;



--changeset drsteini:WQP-913-create-am_storet_activity_id
create bitmap index am_storet_activity_id on act_metric_swap_storet(activity_id) local parallel 4 nologging;
--rollback drop index am_storet_activity_id;

--changeset drsteini:WQP-913-create-am_storet_activity
create bitmap index am_storet_activity on act_metric_swap_storet(activity) local parallel 4 nologging;
--rollback drop index am_storet_activity;

--changeset drsteini:WQP-913-create-am_storet_country
create bitmap index am_storet_country on act_metric_swap_storet(country_code) local parallel 4 nologging;
--rollback drop index am_storet_country;

--changeset drsteini:WQP-913-create-am_storet_county
create bitmap index am_storet_county on act_metric_swap_storet(county_code) local parallel 4 nologging;
--rollback drop index am_storet_county;

--changeset drsteini:WQP-913-create-am_storet_event_date
create bitmap index am_storet_event_date on act_metric_swap_storet(event_date) local parallel 4 nologging;
--rollback drop index am_storet_event_date;

--changeset drsteini:WQP-913-create-am_storet_huc10
create bitmap index am_storet_huc10 on act_metric_swap_storet(huc_10) local parallel 4 nologging;
--rollback drop index am_storet_huc10;

--changeset drsteini:WQP-913-create-am_storet_huc12
create bitmap index am_storet_huc12 on act_metric_swap_storet(huc_12) local parallel 4 nologging;
--rollback drop index am_storet_huc12;

--changeset drsteini:WQP-913-create-am_storet_huc2
create bitmap index am_storet_huc2 on act_metric_swap_storet(huc_2) local parallel 4 nologging;
--rollback drop index am_storet_huc2;

--changeset drsteini:WQP-913-create-am_storet_huc4
create bitmap index am_storet_huc4 on act_metric_swap_storet(huc_4) local parallel 4 nologging;
--rollback drop index am_storet_huc4;

--changeset drsteini:WQP-913-create-am_storet_huc6
create bitmap index am_storet_huc6 on act_metric_swap_storet(huc_6) local parallel 4 nologging;
--rollback drop index am_storet_huc6;

--changeset drsteini:WQP-913-create-am_storet_huc8
create bitmap index am_storet_huc8 on act_metric_swap_storet(huc_8) local parallel 4 nologging;
--rollback drop index am_storet_huc8;

--changeset drsteini:WQP-913-create-am_storet_organization
create bitmap index am_storet_organization on act_metric_swap_storet(organization) local parallel 4 nologging;
--rollback drop index am_storet_organization;

--changeset drsteini:WQP-913-create-am_storet_sample_media
create bitmap index am_storet_sample_media on act_metric_swap_storet(sample_media) local parallel 4 nologging;
--rollback drop index am_storet_sample_media;

--changeset drsteini:WQP-913-create-am_storet_site
create bitmap index am_storet_site on act_metric_swap_storet(site_id) local parallel 4 nologging;
--rollback drop index am_storet_site;

--changeset drsteini:WQP-913-create-am_storet_site_type
create bitmap index am_storet_site_type on act_metric_swap_storet(site_type) local parallel 4 nologging;
--rollback drop index am_storet_site_type;

--changeset drsteini:WQP-913-create-am_storet_state
create bitmap index am_storet_state on act_metric_swap_storet(state_code) local parallel 4 nologging;
--rollback drop index am_storet_state;

--changeset drsteini:WQP-913-create-am_storet_station
create bitmap index am_storet_station on act_metric_swap_storet(station_id) local parallel 4 nologging;
--rollback drop index am_storet_station;

--changeset drsteini:WQP-933-create-as_storet_country
create bitmap index as_storet_country on activity_sum_swap_storet(country_code) local parallel 4 nologging;
--rollback drop index as_storet_country;

--changeset drsteini:WQP-933-create-as_storet_county
create bitmap index as_storet_county on activity_sum_swap_storet(county_code) local parallel 4 nologging;
--rollback drop index as_storet_county;

--changeset drsteini:WQP-933-create-as_storet_event_date
create bitmap index as_storet_event_date on activity_sum_swap_storet(event_date) local parallel 4 nologging;
--rollback drop index as_storet_event_date;

--changeset drsteini:WQP-933-create-as_storet_huc10
create bitmap index as_storet_huc10 on activity_sum_swap_storet(huc_10) local parallel 4 nologging;
--rollback drop index as_storet_huc10;

--changeset drsteini:WQP-933-create-as_storet_huc12
create bitmap index as_storet_huc12 on activity_sum_swap_storet(huc_12) local parallel 4 nologging;
--rollback drop index as_storet_huc12;

--changeset drsteini:WQP-933-create-as_storet_huc2
create bitmap index as_storet_huc2 on activity_sum_swap_storet(huc_2) local parallel 4 nologging;
--rollback drop index as_storet_huc2;

--changeset drsteini:WQP-933-create-as_storet_huc4
create bitmap index as_storet_huc4 on activity_sum_swap_storet(huc_4) local parallel 4 nologging;
--rollback drop index as_storet_huc4;

--changeset drsteini:WQP-933-create-as_storet_huc6
create bitmap index as_storet_huc6 on activity_sum_swap_storet(huc_6) local parallel 4 nologging;
--rollback drop index as_storet_huc6;

--changeset drsteini:WQP-933-create-as_storet_huc8
create bitmap index as_storet_huc8 on activity_sum_swap_storet(huc_8) local parallel 4 nologging;
--rollback drop index as_storet_huc8;

--changeset drsteini:WQP-933-create-as_storet_organization
create bitmap index as_storet_organization on activity_sum_swap_storet(organization) local parallel 4 nologging;
--rollback drop index as_storet_organization;

--changeset drsteini:WQP-933-create-as_storet_project
create bitmap index as_storet_project on activity_sum_swap_storet(project_id) local parallel 4 nologging;
--rollback drop index as_storet_project;

--changeset drsteini:WQP-933-create-as_storet_sample_media
create bitmap index as_storet_sample_media on activity_sum_swap_storet(sample_media) local parallel 4 nologging;
--rollback drop index as_storet_sample_media;

--changeset drsteini:WQP-933-create-as_storet_site
create bitmap index as_storet_site on activity_sum_swap_storet(site_id) local parallel 4 nologging;
--rollback drop index as_storet_site;

--changeset drsteini:WQP-933-create-as_storet_site_type
create bitmap index as_storet_site_type on activity_sum_swap_storet(site_type) local parallel 4 nologging;
--rollback drop index as_storet_site_type;

--changeset drsteini:WQP-933-create-as_storet_state
create bitmap index as_storet_state on activity_sum_swap_storet(state_code) local parallel 4 nologging;
--rollback drop index as_storet_state;

--changeset drsteini:WQP-933-create-as_storet_station
create bitmap index as_storet_station on activity_sum_swap_storet(station_id) local parallel 4 nologging;
--rollback drop index as_storet_station;

--changeset drsteini:create.rdql_storet_activity
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_STORET_ACTIVITY';
create bitmap index rdql_storet_activity on res_detect_qnt_lmt_swap_storet(activity) parallel 4 nologging;
--rollback drop index rdql_storet_activity;

--changeset drsteini:create.rdql_storet_analytical
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_STORET_ANALYTICAL';
create bitmap index rdql_storet_analytical on res_detect_qnt_lmt_swap_storet(analytical_method) parallel 4 nologging;
--rollback drop index rdql_storet_analytical;

--changeset drsteini:create.rdql_storet_assemblage
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_STORET_ASSEMBLAGE';
create bitmap index rdql_storet_assemblage on res_detect_qnt_lmt_swap_storet(assemblage_sampled_name) parallel 4 nologging;
--rollback drop index rdql_storet_assemblage;

--changeset drsteini:create.rdql_storet_char_name
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_STORET_CHAR_NAME';
create bitmap index rdql_storet_char_name on res_detect_qnt_lmt_swap_storet(characteristic_name) parallel 4 nologging;
--rollback drop index rdql_storet_char_name;

--changeset drsteini:create.rdql_storet_char_type
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_STORET_CHAR_TYPE';
create bitmap index rdql_storet_char_type on res_detect_qnt_lmt_swap_storet(characteristic_type) parallel 4 nologging;
--rollback drop index rdql_storet_char_type;

--changeset drsteini:create.rdql_storet_country
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_STORET_COUNTRY';
create bitmap index rdql_storet_country on res_detect_qnt_lmt_swap_storet(country_code) parallel 4 nologging;
--rollback drop index rdql_storet_country;

--changeset drsteini:create.rdql_storet_county
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_STORET_COUNTY';
create bitmap index rdql_storet_county on res_detect_qnt_lmt_swap_storet(county_code) parallel 4 nologging;
--rollback drop index rdql_storet_county;

--changeset drsteini:create.rdql_storet_event_date
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_STORET_EVENT_DATE';
create bitmap index rdql_storet_event_date on res_detect_qnt_lmt_swap_storet(event_date) parallel 4 nologging;
--rollback drop index rdql_storet_event_date;

--changeset drsteini:create.rdql_storet_huc2
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_STORET_HUC2';
create bitmap index rdql_storet_huc2 on res_detect_qnt_lmt_swap_storet(huc_2) parallel 4 nologging;
--rollback drop index rdql_storet_huc2;

--changeset drsteini:create.rdql_storet_huc4
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_STORET_HUC4';
create bitmap index rdql_storet_huc4 on res_detect_qnt_lmt_swap_storet(huc_4) parallel 4 nologging;
--rollback drop index rdql_storet_huc4;

--changeset drsteini:create.rdql_storet_huc6
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_STORET_HUC6';
create bitmap index rdql_storet_huc6 on res_detect_qnt_lmt_swap_storet(huc_6) parallel 4 nologging;
--rollback drop index rdql_storet_huc6;

--changeset drsteini:create.rdql_storet_huc8
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_STORET_HUC8';
create bitmap index rdql_storet_huc8 on res_detect_qnt_lmt_swap_storet(huc_8) parallel 4 nologging;
--rollback drop index rdql_storet_huc8;

--changeset drsteini:create.rdql_storet_huc10
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_STORET_HUC10';
create bitmap index rdql_storet_huc10 on res_detect_qnt_lmt_swap_storet(huc_10) parallel 4 nologging;
--rollback drop index rdql_storet_huc10;

--changeset drsteini:create.rdql_storet_huc12
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_STORET_HUC12';
create bitmap index rdql_storet_huc12 on res_detect_qnt_lmt_swap_storet(HUC_12) parallel 4 nologging;
--rollback drop index rdql_storet_huc12;

--changeset drsteini:create.rdql_storet_organization
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_STORET_ORGANIZATION';
create bitmap index rdql_storet_organization on res_detect_qnt_lmt_swap_storet(organization) parallel 4 nologging;
--rollback drop index rdql_storet_organization;

--changeset drsteini:create.rdql_storet_p_code
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_STORET_P_CODE';
create bitmap index rdql_storet_p_code on res_detect_qnt_lmt_swap_storet(p_code) parallel 4 nologging;
--rollback drop index rdql_storet_p_code;

--changeset drsteini:create.rdql_storet_project
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_STORET_PORJECT';
create bitmap index rdql_storet_project on res_detect_qnt_lmt_swap_storet(project_id) parallel 4 nologging;
--rollback drop index rdql_storet_project;

--changeset drsteini:create.rdql_storet_result
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_STORET_RESULT';
create bitmap index rdql_storet_result on res_detect_qnt_lmt_swap_storet(result_id) parallel 4 nologging;
--rollback drop index rdql_storet_result;

--changeset drsteini:create.rdql_storet_sample_media
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_STORET_SAMPLE_MEDIA';
create bitmap index rdql_storet_sample_media on res_detect_qnt_lmt_swap_storet(sample_media) parallel 4 nologging;
--rollback drop index rdql_storet_sample_media;

--changeset drsteini:create.rdql_storet_site
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_STORET_SITE';
create bitmap index rdql_storet_site on res_detect_qnt_lmt_swap_storet(site_id) parallel 4 nologging;
--rollback drop index rdql_storet_site;

--changeset drsteini:create.rdql_storet_site_type
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_STORET_SITE_TYPE';
create bitmap index rdql_storet_site_type on res_detect_qnt_lmt_swap_storet(site_type) parallel 4 nologging;
--rollback drop index rdql_storet_site_type;

--changeset drsteini:create.rdql_storet_state
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_STORET_STATE';
create bitmap index rdql_storet_state on res_detect_qnt_lmt_swap_storet(state_code) parallel 4 nologging;
--rollback drop index rdql_storet_state;

--changeset drsteini:create.rdql_storet_station
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_STORET_STATION';
create bitmap index rdql_storet_station on res_detect_qnt_lmt_swap_storet(station_id) parallel 4 nologging;
--rollback drop index rdql_storet_station;

--changeset drsteini:create.rdql_storet_taxa_name
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_STORET_TAXA_NAME';
create bitmap index rdql_storet_taxa_name on res_detect_qnt_lmt_swap_storet(sample_tissue_taxonomic_name) parallel 4 nologging;
--rollback drop index rdql_storet_taxa_name;
