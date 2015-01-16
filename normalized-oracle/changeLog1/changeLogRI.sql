--liquibase formatted sql

--This is for the wqp_core schema

--changeset drsteini:1RIAA
alter table wqp_results_n add constraint results_station_fk_n foreign key (station_id) references stations_n (station_id);
--rollback alter table wqp_results_n drop constraint results_station_fk_n;

--changeset drsteini:1RIAB
alter table wqp_results_n add constraint results_data_source_fk_n foreign key (data_source_id) references data_sources (id);
--rollback alter table wqp_results_n drop constraint results_data_source_fk_n;

--changeset drsteini:1RIAC
alter table wqp_results_n add constraint results_event_date_fk_n foreign key (event_date_id) references event_dates (id);
--rollback alter table wqp_results_n drop constraint results_event_date_fk_n;

--changeset drsteini:1RIAD
alter table wqp_results_n add constraint results_analytical_method_fk_n foreign key (analytical_method_id) references analytical_methods (id);
--rollback alter table wqp_results_n drop constraint results_analytical_method_fk_n;

--changeset drsteini:1RIAE
alter table wqp_results_n add constraint results_p_code_fk_n foreign key (p_code_id) references p_codes (id);
--rollback alter table wqp_results_n drop constraint results_p_code_fk_n;

--changeset drsteini:1RIAF
alter table wqp_results_n add constraint results_characteristic_name_fk_n foreign key (characteristic_name_id) references characteristic_names (id);
--rollback alter table wqp_results_n drop constraint results_characteristic_name_fk_n;

--changeset drsteini:1RIAG
alter table wqp_results_n add constraint results_characteristic_type_fk_n foreign key (characteristic_type_id) references characteristic_types (id);
--rollback alter table wqp_results_n drop constraint results_characteristic_type_fk_n;

--changeset drsteini:1RIAH
alter table wqp_results_n add constraint results_sample_media_fk_n foreign key (sample_media_id) references sample_medias (id);
--rollback alter table wqp_results_n drop constraint results_sample_media_fk_n;

--changeset drsteini:1RIAI
alter table wqp_results_n add constraint results_organization_fk_n foreign key (organization_id) references organizations (id);
--rollback alter table wqp_results_n drop constraint results_organization_fk_n;

--changeset drsteini:1RIAJ
alter table wqp_results_n add constraint results_site_type_fk_n foreign key (site_type_id) references site_types (id);
--rollback alter table wqp_results_n drop constraint results_site_type_fk_n;

--changeset drsteini:1RIAK
alter table wqp_results_n add constraint results_country_fk_n foreign key (country_code_id) references country_codes (id);
--rollback alter table wqp_results_n drop constraint results_country_fk_n;

--changeset drsteini:1RIAL
alter table wqp_results_n add constraint results_state_fk_n foreign key (state_code_id) references state_codes (id);
--rollback alter table wqp_results_n drop constraint results_state_fk_n;

--changeset drsteini:1RIAM
alter table wqp_results add constraint results_county_fk foreign key (county_code_id) references county_codes (id);
--rollback alter table wqp_results drop constraint results_county_fk;

--changeset drsteini:1RIAN
alter table stations_n add constraint stations_data_source_fk_n foreign key (data_source_id) references data_sources (id);
--rollback alter table stations_n drop constraint stations_data_source_fk_n;

--changeset drsteini:1RIAO
alter table stations_n add constraint stations_organization_fk_n foreign key (organization_id) references organizations (id);
--rollback alter table stations_n drop constraint stations_organization_fk_n;

--changeset drsteini:1RIAP
alter table stations_n add constraint stations_site_type_fk_n foreign key (site_type_id) references site_types (id);
--rollback alter table stations_n drop constraint stations_site_type_fk_n;

--changeset drsteini:1RIAQ
alter table stations_n add constraint stations_country_fk_n foreign key (country_code_id) references country_codes (id);
--rollback alter table stations_n drop constraint stations_country_fk_n;

--changeset drsteini:1RIAR
alter table stations_n add constraint stations_state_fk_n foreign key (state_code_id) references state_codes (id);
--rollback alter table stations_n drop constraint stations_state_fk_n;

--changeset drsteini:1RIAS
alter table stations_n add constraint stations_county_fk_n foreign key (county_code_id) references county_codes (id);
--rollback alter table stations_n drop constraint stations_county_fk_n;
