--liquibase formatted sql

--This is for the wqp_core schema

--changeset drsteini:WQP-913-create-a_stewards_activity_id
create bitmap index a_stewards_activity_id on activity_swap_stewards(activity_id) local parallel 4 nologging;
--rollback drop index a_stewards_activity_id;

--changeset drsteini:WQP-913-create-a_stewards_activity
create bitmap index a_stewards_activity on activity_swap_stewards(activity) local parallel 4 nologging;
--rollback drop index a_stewards_activity;

--changeset drsteini:WQP-913-create-a_stewards_country
create bitmap index a_stewards_country on activity_swap_stewards(country_code) local parallel 4 nologging;
--rollback drop index a_stewards_country;

--changeset drsteini:WQP-913-create-a_stewards_county
create bitmap index a_stewards_county on activity_swap_stewards(county_code) local parallel 4 nologging;
--rollback drop index a_stewards_county;

--changeset drsteini:WQP-913-create-a_stewards_event_date
create bitmap index a_stewards_event_date on activity_swap_stewards(event_date) local parallel 4 nologging;
--rollback drop index a_stewards_event_date;

--changeset drsteini:WQP-913-create-a_stewards_huc10
create bitmap index a_stewards_huc10 on activity_swap_stewards(huc_10) local parallel 4 nologging;
--rollback drop index a_stewards_huc10;

--changeset drsteini:WQP-913-create-a_stewards_huc12
create bitmap index a_stewards_huc12 on activity_swap_stewards(huc_12) local parallel 4 nologging;
--rollback drop index a_stewards_huc12;

--changeset drsteini:WQP-913-create-a_stewards_huc2
create bitmap index a_stewards_huc2 on activity_swap_stewards(huc_2) local parallel 4 nologging;
--rollback drop index a_stewards_huc2;

--changeset drsteini:WQP-913-create-a_stewards_huc4
create bitmap index a_stewards_huc4 on activity_swap_stewards(huc_4) local parallel 4 nologging;
--rollback drop index a_stewards_huc4;

--changeset drsteini:WQP-913-create-a_stewards_huc6
create bitmap index a_stewards_huc6 on activity_swap_stewards(huc_6) local parallel 4 nologging;
--rollback drop index a_stewards_huc6;

--changeset drsteini:WQP-913-create-a_stewards_huc8
create bitmap index a_stewards_huc8 on activity_swap_stewards(huc_8) local parallel 4 nologging;
--rollback drop index a_stewards_huc8;

--changeset drsteini:WQP-913-create-a_stewards_organization
create bitmap index a_stewards_organization on activity_swap_stewards(organization) local parallel 4 nologging;
--rollback drop index a_stewards_organization;

--changeset drsteini:WQP-913-create-a_stewards_sample_media
create bitmap index a_stewards_sample_media on activity_swap_stewards(sample_media) local parallel 4 nologging;
--rollback drop index a_stewards_sample_media;

--changeset drsteini:WQP-913-create-a_stewards_site
create bitmap index a_stewards_site on activity_swap_stewards(site_id) local parallel 4 nologging;
--rollback drop index a_stewards_site;

--changeset drsteini:WQP-913-create-a_stewards_site_type
create bitmap index a_stewards_site_type on activity_swap_stewards(site_type) local parallel 4 nologging;
--rollback drop index a_stewards_site_type;

--changeset drsteini:WQP-913-create-a_stewards_state
create bitmap index a_stewards_state on activity_swap_stewards(state_code) local parallel 4 nologging;
--rollback drop index a_stewards_state;

--changeset drsteini:WQP-913-create-a_stewards_station
create bitmap index a_stewards_station on activity_swap_stewards(station_id) local parallel 4 nologging;
--rollback drop index a_stewards_station;



--changeset drsteini:WQP-913-create-am_stewards_activity_id
create bitmap index am_stewards_activity_id on act_metric_swap_stewards(activity_id) local parallel 4 nologging;
--rollback drop index am_stewards_activity_id;

--changeset drsteini:WQP-913-create-am_stewards_activity
create bitmap index am_stewards_activity on act_metric_swap_stewards(activity) local parallel 4 nologging;
--rollback drop index am_stewards_activity;

--changeset drsteini:WQP-913-create-am_stewards_country
create bitmap index am_stewards_country on act_metric_swap_stewards(country_code) local parallel 4 nologging;
--rollback drop index am_stewards_country;

--changeset drsteini:WQP-913-create-am_stewards_county
create bitmap index am_stewards_county on act_metric_swap_stewards(county_code) local parallel 4 nologging;
--rollback drop index am_stewards_county;

--changeset drsteini:WQP-913-create-am_stewards_event_date
create bitmap index am_stewards_event_date on act_metric_swap_stewards(event_date) local parallel 4 nologging;
--rollback drop index am_stewards_event_date;

--changeset drsteini:WQP-913-create-am_stewards_huc10
create bitmap index am_stewards_huc10 on act_metric_swap_stewards(huc_10) local parallel 4 nologging;
--rollback drop index am_stewards_huc10;

--changeset drsteini:WQP-913-create-am_stewards_huc12
create bitmap index am_stewards_huc12 on act_metric_swap_stewards(huc_12) local parallel 4 nologging;
--rollback drop index am_stewards_huc12;

--changeset drsteini:WQP-913-create-am_stewards_huc2
create bitmap index am_stewards_huc2 on act_metric_swap_stewards(huc_2) local parallel 4 nologging;
--rollback drop index am_stewards_huc2;

--changeset drsteini:WQP-913-create-am_stewards_huc4
create bitmap index am_stewards_huc4 on act_metric_swap_stewards(huc_4) local parallel 4 nologging;
--rollback drop index am_stewards_huc4;

--changeset drsteini:WQP-913-create-am_stewards_huc6
create bitmap index am_stewards_huc6 on act_metric_swap_stewards(huc_6) local parallel 4 nologging;
--rollback drop index am_stewards_huc6;

--changeset drsteini:WQP-913-create-am_stewards_huc8
create bitmap index am_stewards_huc8 on act_metric_swap_stewards(huc_8) local parallel 4 nologging;
--rollback drop index am_stewards_huc8;

--changeset drsteini:WQP-913-create-am_stewards_organization
create bitmap index am_stewards_organization on act_metric_swap_stewards(organization) local parallel 4 nologging;
--rollback drop index am_stewards_organization;

--changeset drsteini:WQP-913-create-am_stewards_sample_media
create bitmap index am_stewards_sample_media on act_metric_swap_stewards(sample_media) local parallel 4 nologging;
--rollback drop index am_stewards_sample_media;

--changeset drsteini:WQP-913-create-am_stewards_site
create bitmap index am_stewards_site on act_metric_swap_stewards(site_id) local parallel 4 nologging;
--rollback drop index am_stewards_site;

--changeset drsteini:WQP-913-create-am_stewards_site_type
create bitmap index am_stewards_site_type on act_metric_swap_stewards(site_type) local parallel 4 nologging;
--rollback drop index am_stewards_site_type;

--changeset drsteini:WQP-913-create-am_stewards_state
create bitmap index am_stewards_state on act_metric_swap_stewards(state_code) local parallel 4 nologging;
--rollback drop index am_stewards_state;

--changeset drsteini:WQP-913-create-am_stewards_station
create bitmap index am_stewards_station on act_metric_swap_stewards(station_id) local parallel 4 nologging;
--rollback drop index am_stewards_station;

--changeset drsteini:WQP-933-create-as_stewards_country
create bitmap index as_stewards_country on activity_sum_swap_stewards(country_code) local parallel 4 nologging;
--rollback drop index as_stewards_country;

--changeset drsteini:WQP-933-create-as_stewards_county
create bitmap index as_stewards_county on activity_sum_swap_stewards(county_code) local parallel 4 nologging;
--rollback drop index as_stewards_county;

--changeset drsteini:WQP-933-create-as_stewards_event_date
create bitmap index as_stewards_event_date on activity_sum_swap_stewards(event_date) local parallel 4 nologging;
--rollback drop index as_stewards_event_date;

--changeset drsteini:WQP-933-create-as_stewards_huc10
create bitmap index as_stewards_huc10 on activity_sum_swap_stewards(huc_10) local parallel 4 nologging;
--rollback drop index as_stewards_huc10;

--changeset drsteini:WQP-933-create-as_stewards_huc12
create bitmap index as_stewards_huc12 on activity_sum_swap_stewards(huc_12) local parallel 4 nologging;
--rollback drop index as_stewards_huc12;

--changeset drsteini:WQP-933-create-as_stewards_huc2
create bitmap index as_stewards_huc2 on activity_sum_swap_stewards(huc_2) local parallel 4 nologging;
--rollback drop index as_stewards_huc2;

--changeset drsteini:WQP-933-create-as_stewards_huc4
create bitmap index as_stewards_huc4 on activity_sum_swap_stewards(huc_4) local parallel 4 nologging;
--rollback drop index as_stewards_huc4;

--changeset drsteini:WQP-933-create-as_stewards_huc6
create bitmap index as_stewards_huc6 on activity_sum_swap_stewards(huc_6) local parallel 4 nologging;
--rollback drop index as_stewards_huc6;

--changeset drsteini:WQP-933-create-as_stewards_huc8
create bitmap index as_stewards_huc8 on activity_sum_swap_stewards(huc_8) local parallel 4 nologging;
--rollback drop index as_stewards_huc8;

--changeset drsteini:WQP-933-create-as_stewards_organization
create bitmap index as_stewards_organization on activity_sum_swap_stewards(organization) local parallel 4 nologging;
--rollback drop index as_stewards_organization;

--changeset drsteini:WQP-933-create-as_stewards_project
create bitmap index as_stewards_project on activity_sum_swap_stewards(project_id) local parallel 4 nologging;
--rollback drop index as_stewards_project;

--changeset drsteini:WQP-933-create-as_stewards_sample_media
create bitmap index as_stewards_sample_media on activity_sum_swap_stewards(sample_media) local parallel 4 nologging;
--rollback drop index as_stewards_sample_media;

--changeset drsteini:WQP-933-create-as_stewards_site
create bitmap index as_stewards_site on activity_sum_swap_stewards(site_id) local parallel 4 nologging;
--rollback drop index as_stewards_site;

--changeset drsteini:WQP-933-create-as_stewards_site_type
create bitmap index as_stewards_site_type on activity_sum_swap_stewards(site_type) local parallel 4 nologging;
--rollback drop index as_stewards_site_type;

--changeset drsteini:WQP-933-create-as_stewards_state
create bitmap index as_stewards_state on activity_sum_swap_stewards(state_code) local parallel 4 nologging;
--rollback drop index as_stewards_state;

--changeset drsteini:WQP-933-create-as_stewards_station
create bitmap index as_stewards_station on activity_sum_swap_stewards(station_id) local parallel 4 nologging;
--rollback drop index as_stewards_station;

--changeset drsteini:WQP-1033.create.rdql_stewards_activity
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_STEWARDS_ACTIVITY';
create bitmap index rdql_stewards_activity on r_detect_qnt_lmt_swap_stewards(activity) local parallel 4 nologging;
--rollback drop index rdql_stewards_activity;

--changeset drsteini:WQP-1033.create.rdql_stewards_analytical
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_STEWARDS_ANALYTICAL';
create bitmap index rdql_stewards_analytical on r_detect_qnt_lmt_swap_stewards(analytical_method) local parallel 4 nologging;
--rollback drop index rdql_stewards_analytical;

--changeset drsteini:WQP-1033.create.rdql_stewards_assemblage
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_STEWARDS_ASSEMBLAGE';
create bitmap index rdql_stewards_assemblage on r_detect_qnt_lmt_swap_stewards(assemblage_sampled_name) local parallel 4 nologging;
--rollback drop index rdql_stewards_assemblage;

--changeset drsteini:WQP-1033.create.rdql_stewards_char_name
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_STEWARDS_CHAR_NAME';
create bitmap index rdql_stewards_char_name on r_detect_qnt_lmt_swap_stewards(characteristic_name) local parallel 4 nologging;
--rollback drop index rdql_stewards_char_name;

--changeset drsteini:WQP-1033.create.rdql_stewards_char_type
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_STEWARDS_CHAR_TYPE';
create bitmap index rdql_stewards_char_type on r_detect_qnt_lmt_swap_stewards(characteristic_type) local parallel 4 nologging;
--rollback drop index rdql_stewards_char_type;

--changeset drsteini:WQP-1033.create.rdql_stewards_country
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_STEWARDS_COUNTRY';
create bitmap index rdql_stewards_country on r_detect_qnt_lmt_swap_stewards(country_code) local parallel 4 nologging;
--rollback drop index rdql_stewards_country;

--changeset drsteini:WQP-1033.create.rdql_stewards_county
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_STEWARDS_COUNTY';
create bitmap index rdql_stewards_county on r_detect_qnt_lmt_swap_stewards(county_code) local parallel 4 nologging;
--rollback drop index rdql_stewards_county;

--changeset drsteini:WQP-1033.create.rdql_stewards_event_date
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_STEWARDS_EVENT_DATE';
create bitmap index rdql_stewards_event_date on r_detect_qnt_lmt_swap_stewards(event_date) local parallel 4 nologging;
--rollback drop index rdql_stewards_event_date;

--changeset drsteini:WQP-1033.create.rdql_stewards_huc2
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_STEWARDS_HUC2';
create bitmap index rdql_stewards_huc2 on r_detect_qnt_lmt_swap_stewards(huc_2) local parallel 4 nologging;
--rollback drop index rdql_stewards_huc2;

--changeset drsteini:WQP-1033.create.rdql_stewards_huc4
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_STEWARDS_HUC4';
create bitmap index rdql_stewards_huc4 on r_detect_qnt_lmt_swap_stewards(huc_4) local parallel 4 nologging;
--rollback drop index rdql_stewards_huc4;

--changeset drsteini:WQP-1033.create.rdql_stewards_huc6
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_STEWARDS_HUC6';
create bitmap index rdql_stewards_huc6 on r_detect_qnt_lmt_swap_stewards(huc_6) local parallel 4 nologging;
--rollback drop index rdql_stewards_huc6;

--changeset drsteini:WQP-1033.create.rdql_stewards_huc8
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_STEWARDS_HUC8';
create bitmap index rdql_stewards_huc8 on r_detect_qnt_lmt_swap_stewards(huc_8) local parallel 4 nologging;
--rollback drop index rdql_stewards_huc8;

--changeset drsteini:WQP-1033.create.rdql_stewards_huc10
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_STEWARDS_HUC10';
create bitmap index rdql_stewards_huc10 on r_detect_qnt_lmt_swap_stewards(huc_10) local parallel 4 nologging;
--rollback drop index rdql_stewards_huc10;

--changeset drsteini:WQP-1033.create.rdql_stewards_huc12
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_STEWARDS_HUC12';
create bitmap index rdql_stewards_huc12 on r_detect_qnt_lmt_swap_stewards(HUC_12) local parallel 4 nologging;
--rollback drop index rdql_stewards_huc12;

--changeset drsteini:WQP-1033.create.rdql_stewards_organization
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_STEWARDS_ORGANIZATION';
create bitmap index rdql_stewards_organization on r_detect_qnt_lmt_swap_stewards(organization) local parallel 4 nologging;
--rollback drop index rdql_stewards_organization;

--changeset drsteini:WQP-1033.create.rdql_stewards_p_code
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_STEWARDS_P_CODE';
create bitmap index rdql_stewards_p_code on r_detect_qnt_lmt_swap_stewards(p_code) local parallel 4 nologging;
--rollback drop index rdql_stewards_p_code;

--changeset drsteini:WQP-1033.create.rdql_stewards_project
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_STEWARDS_PROJECT';
create bitmap index rdql_stewards_project on r_detect_qnt_lmt_swap_stewards(project_id) local parallel 4 nologging;
--rollback drop index rdql_stewards_project;

--changeset drsteini:WQP-1033.create.rdql_stewards_result
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_STEWARDS_RESULT';
create bitmap index rdql_stewards_result on r_detect_qnt_lmt_swap_stewards(result_id) local parallel 4 nologging;
--rollback drop index rdql_stewards_result;

--changeset drsteini:WQP-1033.create.rdql_stewards_sample_media
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_STEWARDS_SAMPLE_MEDIA';
create bitmap index rdql_stewards_sample_media on r_detect_qnt_lmt_swap_stewards(sample_media) local parallel 4 nologging;
--rollback drop index rdql_stewards_sample_media;

--changeset drsteini:WQP-1033.create.rdql_stewards_site
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_STEWARDS_SITE';
create bitmap index rdql_stewards_site on r_detect_qnt_lmt_swap_stewards(site_id) local parallel 4 nologging;
--rollback drop index rdql_stewards_site;

--changeset drsteini:WQP-1033.create.rdql_stewards_site_type
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_STEWARDS_SITE_TYPE';
create bitmap index rdql_stewards_site_type on r_detect_qnt_lmt_swap_stewards(site_type) local parallel 4 nologging;
--rollback drop index rdql_stewards_site_type;

--changeset drsteini:WQP-1033.create.rdql_stewards_state
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_STEWARDS_STATE';
create bitmap index rdql_stewards_state on r_detect_qnt_lmt_swap_stewards(state_code) local parallel 4 nologging;
--rollback drop index rdql_stewards_state;

--changeset drsteini:WQP-1033.create.rdql_stewards_station
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_STEWARDS_STATION';
create bitmap index rdql_stewards_station on r_detect_qnt_lmt_swap_stewards(station_id) local parallel 4 nologging;
--rollback drop index rdql_stewards_station;

--changeset drsteini:WQP-1033.create.rdql_stewards_taxa_name
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_STEWARDS_TAXA_NAME';
create bitmap index rdql_stewards_taxa_name on r_detect_qnt_lmt_swap_stewards(sample_tissue_taxonomic_name) local parallel 4 nologging;
--rollback drop index rdql_stewards_taxa_name;
