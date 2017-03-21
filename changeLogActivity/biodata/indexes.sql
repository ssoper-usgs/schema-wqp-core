--liquibase formatted sql

--This is for the wqp_core schema

--changeset drsteini:WQP-913-create-a_biodata_activity_id
create bitmap index a_biodata_activity_id on activity_swap_biodata(activity_id) local parallel 4 nologging;
--rollback drop index a_biodata_activity_id;

--changeset drsteini:WQP-913-create-a_biodata_activity
create bitmap index a_biodata_activity on activity_swap_biodata(activity) local parallel 4 nologging;
--rollback drop index a_biodata_activity;

--changeset drsteini:WQP-913-create-a_biodata_country
create bitmap index a_biodata_country on activity_swap_biodata(country_code) local parallel 4 nologging;
--rollback drop index a_biodata_country;

--changeset drsteini:WQP-913-create-a_biodata_county
create bitmap index a_biodata_county on activity_swap_biodata(county_code) local parallel 4 nologging;
--rollback drop index a_biodata_county;

--changeset drsteini:WQP-913-create-a_biodata_event_date
create bitmap index a_biodata_event_date on activity_swap_biodata(event_date) local parallel 4 nologging;
--rollback drop index a_biodata_event_date;

--changeset drsteini:WQP-913-create-a_biodata_huc10
create bitmap index a_biodata_huc10 on activity_swap_biodata(huc_10) local parallel 4 nologging;
--rollback drop index a_biodata_huc10;

--changeset drsteini:WQP-913-create-a_biodata_huc12
create bitmap index a_biodata_huc12 on activity_swap_biodata(huc_12) local parallel 4 nologging;
--rollback drop index a_biodata_huc12;

--changeset drsteini:WQP-913-create-a_biodata_huc2
create bitmap index a_biodata_huc2 on activity_swap_biodata(huc_2) local parallel 4 nologging;
--rollback drop index a_biodata_huc2;

--changeset drsteini:WQP-913-create-a_biodata_huc4
create bitmap index a_biodata_huc4 on activity_swap_biodata(huc_4) local parallel 4 nologging;
--rollback drop index a_biodata_huc4;

--changeset drsteini:WQP-913-create-a_biodata_huc6
create bitmap index a_biodata_huc6 on activity_swap_biodata(huc_6) local parallel 4 nologging;
--rollback drop index a_biodata_huc6;

--changeset drsteini:WQP-913-create-a_biodata_huc8
create bitmap index a_biodata_huc8 on activity_swap_biodata(huc_8) local parallel 4 nologging;
--rollback drop index a_biodata_huc8;

--changeset drsteini:WQP-913-create-a_biodata_organization
create bitmap index a_biodata_organization on activity_swap_biodata(organization) local parallel 4 nologging;
--rollback drop index a_biodata_organization;

--changeset drsteini:WQP-913-create-a_biodata_sample_media
create bitmap index a_biodata_sample_media on activity_swap_biodata(sample_media) local parallel 4 nologging;
--rollback drop index a_biodata_sample_media;

--changeset drsteini:WQP-913-create-a_biodata_site
create bitmap index a_biodata_site on activity_swap_biodata(site_id) local parallel 4 nologging;
--rollback drop index a_biodata_site;

--changeset drsteini:WQP-913-create-a_biodata_site_type
create bitmap index a_biodata_site_type on activity_swap_biodata(site_type) local parallel 4 nologging;
--rollback drop index a_biodata_site_type;

--changeset drsteini:WQP-913-create-a_biodata_state
create bitmap index a_biodata_state on activity_swap_biodata(state_code) local parallel 4 nologging;
--rollback drop index a_biodata_state;

--changeset drsteini:WQP-913-create-a_biodata_station
create bitmap index a_biodata_station on activity_swap_biodata(station_id) local parallel 4 nologging;
--rollback drop index a_biodata_station;



--changeset drsteini:WQP-913-create-am_biodata_activity_id
create bitmap index am_biodata_activity_id on act_metric_swap_biodata(activity_id) local parallel 4 nologging;
--rollback drop index am_biodata_activity_id;

--changeset drsteini:WQP-913-create-am_biodata_activity
create bitmap index am_biodata_activity on act_metric_swap_biodata(activity) local parallel 4 nologging;
--rollback drop index am_biodata_activity;

--changeset drsteini:WQP-913-create-am_biodata_country
create bitmap index am_biodata_country on act_metric_swap_biodata(country_code) local parallel 4 nologging;
--rollback drop index am_biodata_country;

--changeset drsteini:WQP-913-create-am_biodata_county
create bitmap index am_biodata_county on act_metric_swap_biodata(county_code) local parallel 4 nologging;
--rollback drop index am_biodata_county;

--changeset drsteini:WQP-913-create-am_biodata_event_date
create bitmap index am_biodata_event_date on act_metric_swap_biodata(event_date) local parallel 4 nologging;
--rollback drop index am_biodata_event_date;

--changeset drsteini:WQP-913-create-am_biodata_huc10
create bitmap index am_biodata_huc10 on act_metric_swap_biodata(huc_10) local parallel 4 nologging;
--rollback drop index am_biodata_huc10;

--changeset drsteini:WQP-913-create-am_biodata_huc12
create bitmap index am_biodata_huc12 on act_metric_swap_biodata(huc_12) local parallel 4 nologging;
--rollback drop index am_biodata_huc12;

--changeset drsteini:WQP-913-create-am_biodata_huc2
create bitmap index am_biodata_huc2 on act_metric_swap_biodata(huc_2) local parallel 4 nologging;
--rollback drop index am_biodata_huc2;

--changeset drsteini:WQP-913-create-am_biodata_huc4
create bitmap index am_biodata_huc4 on act_metric_swap_biodata(huc_4) local parallel 4 nologging;
--rollback drop index am_biodata_huc4;

--changeset drsteini:WQP-913-create-am_biodata_huc6
create bitmap index am_biodata_huc6 on act_metric_swap_biodata(huc_6) local parallel 4 nologging;
--rollback drop index am_biodata_huc6;

--changeset drsteini:WQP-913-create-am_biodata_huc8
create bitmap index am_biodata_huc8 on act_metric_swap_biodata(huc_8) local parallel 4 nologging;
--rollback drop index am_biodata_huc8;

--changeset drsteini:WQP-913-create-am_biodata_organization
create bitmap index am_biodata_organization on act_metric_swap_biodata(organization) local parallel 4 nologging;
--rollback drop index am_biodata_organization;

--changeset drsteini:WQP-913-create-am_biodata_sample_media
create bitmap index am_biodata_sample_media on act_metric_swap_biodata(sample_media) local parallel 4 nologging;
--rollback drop index am_biodata_sample_media;

--changeset drsteini:WQP-913-create-am_biodata_site
create bitmap index am_biodata_site on act_metric_swap_biodata(site_id) local parallel 4 nologging;
--rollback drop index am_biodata_site;

--changeset drsteini:WQP-913-create-am_biodata_site_type
create bitmap index am_biodata_site_type on act_metric_swap_biodata(site_type) local parallel 4 nologging;
--rollback drop index am_biodata_site_type;

--changeset drsteini:WQP-913-create-am_biodata_state
create bitmap index am_biodata_state on act_metric_swap_biodata(state_code) local parallel 4 nologging;
--rollback drop index am_biodata_state;

--changeset drsteini:WQP-913-create-am_biodata_station
create bitmap index am_biodata_station on act_metric_swap_biodata(station_id) local parallel 4 nologging;
--rollback drop index am_biodata_station;

--changeset drsteini:WQP-933-create-as_biodata_country
create bitmap index as_biodata_country on activity_sum_swap_biodata(country_code) local parallel 4 nologging;
--rollback drop index as_biodata_country;

--changeset drsteini:WQP-933-create-as_biodata_county
create bitmap index as_biodata_county on activity_sum_swap_biodata(county_code) local parallel 4 nologging;
--rollback drop index as_biodata_county;

--changeset drsteini:WQP-933-create-as_biodata_event_date
create bitmap index as_biodata_event_date on activity_sum_swap_biodata(event_date) local parallel 4 nologging;
--rollback drop index as_biodata_event_date;

--changeset drsteini:WQP-933-create-as_biodata_huc10
create bitmap index as_biodata_huc10 on activity_sum_swap_biodata(huc_10) local parallel 4 nologging;
--rollback drop index as_biodata_huc10;

--changeset drsteini:WQP-933-create-as_biodata_huc12
create bitmap index as_biodata_huc12 on activity_sum_swap_biodata(huc_12) local parallel 4 nologging;
--rollback drop index as_biodata_huc12;

--changeset drsteini:WQP-933-create-as_biodata_huc2
create bitmap index as_biodata_huc2 on activity_sum_swap_biodata(huc_2) local parallel 4 nologging;
--rollback drop index as_biodata_huc2;

--changeset drsteini:WQP-933-create-as_biodata_huc4
create bitmap index as_biodata_huc4 on activity_sum_swap_biodata(huc_4) local parallel 4 nologging;
--rollback drop index as_biodata_huc4;

--changeset drsteini:WQP-933-create-as_biodata_huc6
create bitmap index as_biodata_huc6 on activity_sum_swap_biodata(huc_6) local parallel 4 nologging;
--rollback drop index as_biodata_huc6;

--changeset drsteini:WQP-933-create-as_biodata_huc8
create bitmap index as_biodata_huc8 on activity_sum_swap_biodata(huc_8) local parallel 4 nologging;
--rollback drop index as_biodata_huc8;

--changeset drsteini:WQP-933-create-as_biodata_organization
create bitmap index as_biodata_organization on activity_sum_swap_biodata(organization) local parallel 4 nologging;
--rollback drop index as_biodata_organization;

--changeset drsteini:WQP-933-create-as_biodata_project
create bitmap index as_biodata_project on activity_sum_swap_biodata(project_id) local parallel 4 nologging;
--rollback drop index as_biodata_project;

--changeset drsteini:WQP-933-create-as_biodata_sample_media
create bitmap index as_biodata_sample_media on activity_sum_swap_biodata(sample_media) local parallel 4 nologging;
--rollback drop index as_biodata_sample_media;

--changeset drsteini:WQP-933-create-as_biodata_site
create bitmap index as_biodata_site on activity_sum_swap_biodata(site_id) local parallel 4 nologging;
--rollback drop index as_biodata_site;

--changeset drsteini:WQP-933-create-as_biodata_site_type
create bitmap index as_biodata_site_type on activity_sum_swap_biodata(site_type) local parallel 4 nologging;
--rollback drop index as_biodata_site_type;

--changeset drsteini:WQP-933-create-as_biodata_state
create bitmap index as_biodata_state on activity_sum_swap_biodata(state_code) local parallel 4 nologging;
--rollback drop index as_biodata_state;

--changeset drsteini:WQP-933-create-as_biodata_station
create bitmap index as_biodata_station on activity_sum_swap_biodata(station_id) local parallel 4 nologging;
--rollback drop index as_biodata_station;

--changeset drsteini:create.rdql_biodata_activity
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_BIODATA_ACTIVITY';
create bitmap index rdql_biodata_activity on res_detect_qnt_lmt_swap_biodata(activity) parallel 4 nologging;
--rollback drop index rdql_biodata_activity;

--changeset drsteini:create.rdql_biodata_analytical
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_BIODATA_ANALYTICAL';
create bitmap index rdql_biodata_analytical on res_detect_qnt_lmt_swap_biodata(analytical_method) parallel 4 nologging;
--rollback drop index rdql_biodata_analytical;

--changeset drsteini:create.rdql_biodata_assemblage
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_BIODATA_ASSEMBLAGE';
create bitmap index rdql_biodata_assemblage on res_detect_qnt_lmt_swap_biodata(assemblage_sampled_name) parallel 4 nologging;
--rollback drop index rdql_biodata_assemblage;

--changeset drsteini:create.rdql_biodata_char_name
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_BIODATA_CHAR_NAME';
create bitmap index rdql_biodata_char_name on res_detect_qnt_lmt_swap_biodata(characteristic_name) parallel 4 nologging;
--rollback drop index rdql_biodata_char_name;

--changeset drsteini:create.rdql_biodata_char_type
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_BIODATA_CHAR_TYPE';
create bitmap index rdql_biodata_char_type on res_detect_qnt_lmt_swap_biodata(characteristic_type) parallel 4 nologging;
--rollback drop index rdql_biodata_char_type;

--changeset drsteini:create.rdql_biodata_country
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_BIODATA_COUNTRY';
create bitmap index rdql_biodata_country on res_detect_qnt_lmt_swap_biodata(country_code) parallel 4 nologging;
--rollback drop index rdql_biodata_country;

--changeset drsteini:create.rdql_biodata_county
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_BIODATA_COUNTY';
create bitmap index rdql_biodata_county on res_detect_qnt_lmt_swap_biodata(county_code) parallel 4 nologging;
--rollback drop index rdql_biodata_county;

--changeset drsteini:create.rdql_biodata_event_date
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_BIODATA_EVENT_DATE';
create bitmap index rdql_biodata_event_date on res_detect_qnt_lmt_swap_biodata(event_date) parallel 4 nologging;
--rollback drop index rdql_biodata_event_date;

--changeset drsteini:create.rdql_biodata_huc2
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_BIODATA_HUC2';
create bitmap index rdql_biodata_huc2 on res_detect_qnt_lmt_swap_biodata(huc_2) parallel 4 nologging;
--rollback drop index rdql_biodata_huc2;

--changeset drsteini:create.rdql_biodata_huc4
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_BIODATA_HUC4';
create bitmap index rdql_biodata_huc4 on res_detect_qnt_lmt_swap_biodata(huc_4) parallel 4 nologging;
--rollback drop index rdql_biodata_huc4;

--changeset drsteini:create.rdql_biodata_huc6
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_BIODATA_HUC6';
create bitmap index rdql_biodata_huc6 on res_detect_qnt_lmt_swap_biodata(huc_6) parallel 4 nologging;
--rollback drop index rdql_biodata_huc6;

--changeset drsteini:create.rdql_biodata_huc8
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_BIODATA_HUC8';
create bitmap index rdql_biodata_huc8 on res_detect_qnt_lmt_swap_biodata(huc_8) parallel 4 nologging;
--rollback drop index rdql_biodata_huc8;

--changeset drsteini:create.rdql_biodata_huc10
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_BIODATA_HUC10';
create bitmap index rdql_biodata_huc10 on res_detect_qnt_lmt_swap_biodata(huc_10) parallel 4 nologging;
--rollback drop index rdql_biodata_huc10;

--changeset drsteini:create.rdql_biodata_huc12
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_BIODATA_HUC12';
create bitmap index rdql_biodata_huc12 on res_detect_qnt_lmt_swap_biodata(HUC_12) parallel 4 nologging;
--rollback drop index rdql_biodata_huc12;

--changeset drsteini:create.rdql_biodata_organization
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_BIODATA_ORGANIZATION';
create bitmap index rdql_biodata_organization on res_detect_qnt_lmt_swap_biodata(organization) parallel 4 nologging;
--rollback drop index rdql_biodata_organization;

--changeset drsteini:create.rdql_biodata_p_code
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_BIODATA_P_CODE';
create bitmap index rdql_biodata_p_code on res_detect_qnt_lmt_swap_biodata(p_code) parallel 4 nologging;
--rollback drop index rdql_biodata_p_code;

--changeset drsteini:create.rdql_biodata_project
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_BIODATA_PROJECT';
create bitmap index rdql_biodata_project on res_detect_qnt_lmt_swap_biodata(project_id) parallel 4 nologging;
--rollback drop index rdql_biodata_project;

--changeset drsteini:create.rdql_biodata_result
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_BIODATA_RESULT';
create bitmap index rdql_biodata_result on res_detect_qnt_lmt_swap_biodata(result_id) parallel 4 nologging;
--rollback drop index rdql_biodata_result;

--changeset drsteini:create.rdql_biodata_sample_media
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_BIODATA_SAMPLE_MEDIA';
create bitmap index rdql_biodata_sample_media on res_detect_qnt_lmt_swap_biodata(sample_media) parallel 4 nologging;
--rollback drop index rdql_biodata_sample_media;

--changeset drsteini:create.rdql_biodata_site
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_BIODATA_SITE';
create bitmap index rdql_biodata_site on res_detect_qnt_lmt_swap_biodata(site_id) parallel 4 nologging;
--rollback drop index rdql_biodata_site;

--changeset drsteini:create.rdql_biodata_site_type
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_BIODATA_SITE_TYPE';
create bitmap index rdql_biodata_site_type on res_detect_qnt_lmt_swap_biodata(site_type) parallel 4 nologging;
--rollback drop index rdql_biodata_site_type;

--changeset drsteini:create.rdql_biodata_state
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_BIODATA_STATE';
create bitmap index rdql_biodata_state on res_detect_qnt_lmt_swap_biodata(state_code) parallel 4 nologging;
--rollback drop index rdql_biodata_state;

--changeset drsteini:create.rdql_biodata_station
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_BIODATA_STATION';
create bitmap index rdql_biodata_station on res_detect_qnt_lmt_swap_biodata(station_id) parallel 4 nologging;
--rollback drop index rdql_biodata_station;

--changeset drsteini:create.rdql_biodata_taxa_name
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_indexes where index_name = 'RDQL_BIODATA_TAXA_NAME';
create bitmap index rdql_biodata_taxa_name on res_detect_qnt_lmt_swap_biodata(sample_tissue_taxonomic_name) parallel 4 nologging;
--rollback drop index rdql_biodata_taxa_name;
