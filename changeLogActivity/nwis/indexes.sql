--liquibase formatted sql

--This is for the wqp_core schema

--changeset drsteini:WQP-913-create-a_nwis_activity_id
create bitmap index a_nwis_activity_id on activity_swap_nwis(activity_id) local parallel 4 nologging;
--rollback drop index a_nwis_activity_id;

--changeset drsteini:WQP-913-create-a_nwis_activity
create bitmap index a_nwis_activity on activity_swap_nwis(activity) local parallel 4 nologging;
--rollback drop index a_nwis_activity;

--changeset drsteini:WQP-913-create-a_nwis_country
create bitmap index a_nwis_country on activity_swap_nwis(country_code) local parallel 4 nologging;
--rollback drop index a_nwis_country;

--changeset drsteini:WQP-913-create-a_nwis_county
create bitmap index a_nwis_county on activity_swap_nwis(county_code) local parallel 4 nologging;
--rollback drop index a_nwis_county;

--changeset drsteini:WQP-913-create-a_nwis_event_date
create bitmap index a_nwis_event_date on activity_swap_nwis(event_date) local parallel 4 nologging;
--rollback drop index a_nwis_event_date;

--changeset drsteini:WQP-913-create-a_nwis_huc10
create bitmap index a_nwis_huc10 on activity_swap_nwis(huc_10) local parallel 4 nologging;
--rollback drop index a_nwis_huc10;

--changeset drsteini:WQP-913-create-a_nwis_huc12
create bitmap index a_nwis_huc12 on activity_swap_nwis(huc_12) local parallel 4 nologging;
--rollback drop index a_nwis_huc12;

--changeset drsteini:WQP-913-create-a_nwis_huc2
create bitmap index a_nwis_huc2 on activity_swap_nwis(huc_2) local parallel 4 nologging;
--rollback drop index a_nwis_huc2;

--changeset drsteini:WQP-913-create-a_nwis_huc4
create bitmap index a_nwis_huc4 on activity_swap_nwis(huc_4) local parallel 4 nologging;
--rollback drop index a_nwis_huc4;

--changeset drsteini:WQP-913-create-a_nwis_huc6
create bitmap index a_nwis_huc6 on activity_swap_nwis(huc_6) local parallel 4 nologging;
--rollback drop index a_nwis_huc6;

--changeset drsteini:WQP-913-create-a_nwis_huc8
create bitmap index a_nwis_huc8 on activity_swap_nwis(huc_8) local parallel 4 nologging;
--rollback drop index a_nwis_huc8;

--changeset drsteini:WQP-913-create-a_nwis_organization
create bitmap index a_nwis_organization on activity_swap_nwis(organization) local parallel 4 nologging;
--rollback drop index a_nwis_organization;

--changeset drsteini:WQP-913-create-a_nwis_sample_media
create bitmap index a_nwis_sample_media on activity_swap_nwis(sample_media) local parallel 4 nologging;
--rollback drop index a_nwis_sample_media;

--changeset drsteini:WQP-913-create-a_nwis_site
create bitmap index a_nwis_site on activity_swap_nwis(site_id) local parallel 4 nologging;
--rollback drop index a_nwis_site;

--changeset drsteini:WQP-913-create-a_nwis_site_type
create bitmap index a_nwis_site_type on activity_swap_nwis(site_type) local parallel 4 nologging;
--rollback drop index a_nwis_site_type;

--changeset drsteini:WQP-913-create-a_nwis_state
create bitmap index a_nwis_state on activity_swap_nwis(state_code) local parallel 4 nologging;
--rollback drop index a_nwis_state;

--changeset drsteini:WQP-913-create-a_nwis_station
create bitmap index a_nwis_station on activity_swap_nwis(station_id) local parallel 4 nologging;
--rollback drop index a_nwis_station;



--changeset drsteini:WQP-913-create-am_nwis_activity_id
create bitmap index am_nwis_activity_id on act_metric_swap_nwis(activity_id) local parallel 4 nologging;
--rollback drop index am_nwis_activity_id;

--changeset drsteini:WQP-913-create-am_nwis_activity
create bitmap index am_nwis_activity on act_metric_swap_nwis(activity) local parallel 4 nologging;
--rollback drop index am_nwis_activity;

--changeset drsteini:WQP-913-create-am_nwis_country
create bitmap index am_nwis_country on act_metric_swap_nwis(country_code) local parallel 4 nologging;
--rollback drop index am_nwis_country;

--changeset drsteini:WQP-913-create-am_nwis_county
create bitmap index am_nwis_county on act_metric_swap_nwis(county_code) local parallel 4 nologging;
--rollback drop index am_nwis_county;

--changeset drsteini:WQP-913-create-am_nwis_event_date
create bitmap index am_nwis_event_date on act_metric_swap_nwis(event_date) local parallel 4 nologging;
--rollback drop index am_nwis_event_date;

--changeset drsteini:WQP-913-create-am_nwis_huc10
create bitmap index am_nwis_huc10 on act_metric_swap_nwis(huc_10) local parallel 4 nologging;
--rollback drop index am_nwis_huc10;

--changeset drsteini:WQP-913-create-am_nwis_huc12
create bitmap index am_nwis_huc12 on act_metric_swap_nwis(huc_12) local parallel 4 nologging;
--rollback drop index am_nwis_huc12;

--changeset drsteini:WQP-913-create-am_nwis_huc2
create bitmap index am_nwis_huc2 on act_metric_swap_nwis(huc_2) local parallel 4 nologging;
--rollback drop index am_nwis_huc2;

--changeset drsteini:WQP-913-create-am_nwis_huc4
create bitmap index am_nwis_huc4 on act_metric_swap_nwis(huc_4) local parallel 4 nologging;
--rollback drop index am_nwis_huc4;

--changeset drsteini:WQP-913-create-am_nwis_huc6
create bitmap index am_nwis_huc6 on act_metric_swap_nwis(huc_6) local parallel 4 nologging;
--rollback drop index am_nwis_huc6;

--changeset drsteini:WQP-913-create-am_nwis_huc8
create bitmap index am_nwis_huc8 on act_metric_swap_nwis(huc_8) local parallel 4 nologging;
--rollback drop index am_nwis_huc8;

--changeset drsteini:WQP-913-create-am_nwis_organization
create bitmap index am_nwis_organization on act_metric_swap_nwis(organization) local parallel 4 nologging;
--rollback drop index am_nwis_organization;

--changeset drsteini:WQP-913-create-am_nwis_sample_media
create bitmap index am_nwis_sample_media on act_metric_swap_nwis(sample_media) local parallel 4 nologging;
--rollback drop index am_nwis_sample_media;

--changeset drsteini:WQP-913-create-am_nwis_site
create bitmap index am_nwis_site on act_metric_swap_nwis(site_id) local parallel 4 nologging;
--rollback drop index am_nwis_site;

--changeset drsteini:WQP-913-create-am_nwis_site_type
create bitmap index am_nwis_site_type on act_metric_swap_nwis(site_type) local parallel 4 nologging;
--rollback drop index am_nwis_site_type;

--changeset drsteini:WQP-913-create-am_nwis_state
create bitmap index am_nwis_state on act_metric_swap_nwis(state_code) local parallel 4 nologging;
--rollback drop index am_nwis_state;

--changeset drsteini:WQP-913-create-am_nwis_station
create bitmap index am_nwis_station on act_metric_swap_nwis(station_id) local parallel 4 nologging;
--rollback drop index am_nwis_station;

--changeset drsteini:WQP-933-create-as_nwis_country
create bitmap index as_nwis_country on activity_sum_swap_nwis(country_code) local parallel 4 nologging;
--rollback drop index as_nwis_country;

--changeset drsteini:WQP-933-create-as_nwis_county
create bitmap index as_nwis_county on activity_sum_swap_nwis(county_code) local parallel 4 nologging;
--rollback drop index as_nwis_county;

--changeset drsteini:WQP-933-create-as_nwis_event_date
create bitmap index as_nwis_event_date on activity_sum_swap_nwis(event_date) local parallel 4 nologging;
--rollback drop index as_nwis_event_date;

--changeset drsteini:WQP-933-create-as_nwis_huc10
create bitmap index as_nwis_huc10 on activity_sum_swap_nwis(huc_10) local parallel 4 nologging;
--rollback drop index as_nwis_huc10;

--changeset drsteini:WQP-933-create-as_nwis_huc12
create bitmap index as_nwis_huc12 on activity_sum_swap_nwis(huc_12) local parallel 4 nologging;
--rollback drop index as_nwis_huc12;

--changeset drsteini:WQP-933-create-as_nwis_huc2
create bitmap index as_nwis_huc2 on activity_sum_swap_nwis(huc_2) local parallel 4 nologging;
--rollback drop index as_nwis_huc2;

--changeset drsteini:WQP-933-create-as_nwis_huc4
create bitmap index as_nwis_huc4 on activity_sum_swap_nwis(huc_4) local parallel 4 nologging;
--rollback drop index as_nwis_huc4;

--changeset drsteini:WQP-933-create-as_nwis_huc6
create bitmap index as_nwis_huc6 on activity_sum_swap_nwis(huc_6) local parallel 4 nologging;
--rollback drop index as_nwis_huc6;

--changeset drsteini:WQP-933-create-as_nwis_huc8
create bitmap index as_nwis_huc8 on activity_sum_swap_nwis(huc_8) local parallel 4 nologging;
--rollback drop index as_nwis_huc8;

--changeset drsteini:WQP-933-create-as_nwis_organization
create bitmap index as_nwis_organization on activity_sum_swap_nwis(organization) local parallel 4 nologging;
--rollback drop index as_nwis_organization;

--changeset drsteini:WQP-933-create-as_nwis_project
create bitmap index as_nwis_project on activity_sum_swap_nwis(project_id) local parallel 4 nologging;
--rollback drop index as_nwis_project;

--changeset drsteini:WQP-933-create-as_nwis_sample_media
create bitmap index as_nwis_sample_media on activity_sum_swap_nwis(sample_media) local parallel 4 nologging;
--rollback drop index as_nwis_sample_media;

--changeset drsteini:WQP-933-create-as_nwis_site
create bitmap index as_nwis_site on activity_sum_swap_nwis(site_id) local parallel 4 nologging;
--rollback drop index as_nwis_site;

--changeset drsteini:WQP-933-create-as_nwis_site_type
create bitmap index as_nwis_site_type on activity_sum_swap_nwis(site_type) local parallel 4 nologging;
--rollback drop index as_nwis_site_type;

--changeset drsteini:WQP-933-create-as_nwis_state
create bitmap index as_nwis_state on activity_sum_swap_nwis(state_code) local parallel 4 nologging;
--rollback drop index as_nwis_state;

--changeset drsteini:WQP-933-create-as_nwis_station
create bitmap index as_nwis_station on activity_sum_swap_nwis(station_id) local parallel 4 nologging;
--rollback drop index as_nwis_station;

--changeset drsteini:create.rdql_nwis_activity
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_NWIS_ACTIVITY';
create bitmap index rdql_nwis_activity on res_detect_qnt_lmt_swap_nwis(activity) parallel 4 nologging;
--rollback drop index rdql_nwis_activity;

--changeset drsteini:create.rdql_nwis_analytical
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_NWIS_ANALYTICAL';
create bitmap index rdql_nwis_analytical on res_detect_qnt_lmt_swap_nwis(analytical_method) parallel 4 nologging;
--rollback drop index rdql_nwis_analytical;

--changeset drsteini:create.rdql_nwis_assemblage
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_NWIS_ASSEMBLAGE';
create bitmap index rdql_nwis_assemblage on res_detect_qnt_lmt_swap_nwis(assemblage_sampled_name) parallel 4 nologging;
--rollback drop index rdql_nwis_assemblage;

--changeset drsteini:create.rdql_nwis_char_name
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_NWIS_CHAR_NAME';
create bitmap index rdql_nwis_char_name on res_detect_qnt_lmt_swap_nwis(characteristic_name) parallel 4 nologging;
--rollback drop index rdql_nwis_char_name;

--changeset drsteini:create.rdql_nwis_char_type
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_NWIS_CHAR_TYPE';
create bitmap index rdql_nwis_char_type on res_detect_qnt_lmt_swap_nwis(characteristic_type) parallel 4 nologging;
--rollback drop index rdql_nwis_char_type;

--changeset drsteini:create.rdql_nwis_country
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_NWIS_COUNTRY';
create bitmap index rdql_nwis_country on res_detect_qnt_lmt_swap_nwis(country_code) parallel 4 nologging;
--rollback drop index rdql_nwis_country;

--changeset drsteini:create.rdql_nwis_county
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_NWIS_COUNTY';
create bitmap index rdql_nwis_county on res_detect_qnt_lmt_swap_nwis(county_code) parallel 4 nologging;
--rollback drop index rdql_nwis_county;

--changeset drsteini:create.rdql_nwis_event_date
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_NWIS_EVENT_DATE';
create bitmap index rdql_nwis_event_date on res_detect_qnt_lmt_swap_nwis(event_date) parallel 4 nologging;
--rollback drop index rdql_nwis_event_date;

--changeset drsteini:create.rdql_nwis_huc2
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_NWIS_HUC2';
create bitmap index rdql_nwis_huc2 on res_detect_qnt_lmt_swap_nwis(huc_2) parallel 4 nologging;
--rollback drop index rdql_nwis_huc2;

--changeset drsteini:create.rdql_nwis_huc4
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_NWIS_HUC4';
create bitmap index rdql_nwis_huc4 on res_detect_qnt_lmt_swap_nwis(huc_4) parallel 4 nologging;
--rollback drop index rdql_nwis_huc4;

--changeset drsteini:create.rdql_nwis_huc6
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_NWIS_HUC6';
create bitmap index rdql_nwis_huc6 on res_detect_qnt_lmt_swap_nwis(huc_6) parallel 4 nologging;
--rollback drop index rdql_nwis_huc6;

--changeset drsteini:create.rdql_nwis_huc8
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_NWIS_HUC8';
create bitmap index rdql_nwis_huc8 on res_detect_qnt_lmt_swap_nwis(huc_8) parallel 4 nologging;
--rollback drop index rdql_nwis_huc8;

--changeset drsteini:create.rdql_nwis_huc10
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_NWIS_HUC10';
create bitmap index rdql_nwis_huc10 on res_detect_qnt_lmt_swap_nwis(huc_10) parallel 4 nologging;
--rollback drop index rdql_nwis_huc10;

--changeset drsteini:create.rdql_nwis_huc12
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_NWIS_HUC12';
create bitmap index rdql_nwis_huc12 on res_detect_qnt_lmt_swap_nwis(HUC_12) parallel 4 nologging;
--rollback drop index rdql_nwis_huc12;

--changeset drsteini:create.rdql_nwis_organization
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_NWIS_ORGANIZATION';
create bitmap index rdql_nwis_organization on res_detect_qnt_lmt_swap_nwis(organization) parallel 4 nologging;
--rollback drop index rdql_nwis_organization;

--changeset drsteini:create.rdql_nwis_p_code
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_NWIS_P_CODE';
create bitmap index rdql_nwis_p_code on res_detect_qnt_lmt_swap_nwis(p_code) parallel 4 nologging;
--rollback drop index rdql_nwis_p_code;

--changeset drsteini:create.rdql_nwis_project
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_NWIS_PROJECT';
create bitmap index rdql_nwis_project on res_detect_qnt_lmt_swap_nwis(project_id) parallel 4 nologging;
--rollback drop index rdql_nwis_project;

--changeset drsteini:create.rdql_nwis_result
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_NWIS_RESULT';
create bitmap index rdql_nwis_result on res_detect_qnt_lmt_swap_nwis(result_id) parallel 4 nologging;
--rollback drop index rdql_nwis_result;

--changeset drsteini:create.rdql_nwis_sample_media
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_NWIS_SAMPLE_MEDIA';
create bitmap index rdql_nwis_sample_media on res_detect_qnt_lmt_swap_nwis(sample_media) parallel 4 nologging;
--rollback drop index rdql_nwis_sample_media;

--changeset drsteini:create.rdql_nwis_site
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_NWIS_SITE';
create bitmap index rdql_nwis_site on res_detect_qnt_lmt_swap_nwis(site_id) parallel 4 nologging;
--rollback drop index rdql_nwis_site;

--changeset drsteini:create.rdql_nwis_site_type
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_NWIS_SITE_TYPE';
create bitmap index rdql_nwis_site_type on res_detect_qnt_lmt_swap_nwis(site_type) parallel 4 nologging;
--rollback drop index rdql_nwis_site_type;

--changeset drsteini:create.rdql_nwis_state
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_NWIS_STATE';
create bitmap index rdql_nwis_state on res_detect_qnt_lmt_swap_nwis(state_code) parallel 4 nologging;
--rollback drop index rdql_nwis_state;

--changeset drsteini:create.rdql_nwis_station
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_NWIS_STATION';
create bitmap index rdql_nwis_station on res_detect_qnt_lmt_swap_nwis(station_id) parallel 4 nologging;
--rollback drop index rdql_nwis_station;

--changeset drsteini:create.rdql_nwis_taxa_name
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_NWIS_TAXA_NAME';
create bitmap index rdql_nwis_taxa_name on res_detect_qnt_lmt_swap_nwis(sample_tissue_taxonomic_name) parallel 4 nologging;
--rollback drop index rdql_nwis_taxa_name;
