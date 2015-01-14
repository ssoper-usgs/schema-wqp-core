--liquibase formatted sql

--This is for the wqp_core schema

--changeset drsteini:1RIAA
alter table wqp_results add constraint results_station_fk foreign key (station_id) references stations (station_id);
--rollback alter table wqp_results drop contraint results_station_fk;

--changeset drsteini:1RIAB
alter table wqp_results add constraint results_data_source_fk foreign key (data_source_id) references data_sources (id);
--rollback alter table wqp_results drop contraint results_data_source_fk;

--changeset drsteini:1RIAC
alter table wqp_results add constraint results_event_date_fk foreign key (event_date_id) references event_dates (id);
--rollback alter table wqp_results drop contraint results_event_date_fk;

--changeset drsteini:1RIAD
alter table wqp_results add constraint results_analytical_method_fk foreign key (analytical_method_id) references analytical_methods (id);
--rollback alter table wqp_results drop contraint results_analytical_method_fk;

--changeset drsteini:1RIAE
alter table wqp_results add constraint results_p_code_fk foreign key (p_code_id) references p_codes (id);
--rollback alter table wqp_results drop contraint results_p_code_fk;

--changeset drsteini:1RIAF
alter table wqp_results add constraint results_characteristic_name_fk foreign key (characteristic_name_id) references characteristic_names (id);
--rollback alter table wqp_results drop contraint results_characteristic_name_fk;

--changeset drsteini:1RIAG
alter table wqp_results add constraint results_characteristic_type_fk foreign key (characteristic_type_id) references characteristic_types (id);
--rollback alter table wqp_results drop contraint results_characteristic_type_fk;

--changeset drsteini:1RIAH
alter table wqp_results add constraint results_sample_media_fk foreign key (sample_media_id) references sample_medias (id);
--rollback alter table wqp_results drop contraint results_sample_media_fk;

--changeset drsteini:1RIAI
alter table wqp_results add constraint results_organization_fk foreign key (organization_id) references organizations (id);
--rollback alter table wqp_results drop contraint results_organization_fk;

--changeset drsteini:1RIAJ
alter table wqp_results add constraint results_site_type_fk foreign key (site_type_id) references site_types (id);
--rollback alter table wqp_results drop contraint results_site_type_fk;

--changeset drsteini:1RIAK
alter table wqp_results add constraint results_country_fk foreign key (country_code_id) references country_codes (id);
--rollback alter table wqp_results drop contraint results_country_fk;

--changeset drsteini:1RIAL
alter table wqp_results add constraint results_state_fk foreign key (state_code_id) references state_codes (id);
--rollback alter table wqp_results drop contraint results_state_fk;

--changeset drsteini:1RIAM
alter table wqp_results add constraint results_county_fk foreign key (county_code_id) references county_codes (id);
--rollback alter table wqp_results drop contraint results_county_fk;

--changeset drsteini:1RIAN
alter table stations add constraint stations_data_source_fk foreign key (data_source_id) references data_sources (id);
--rollback alter table stations drop contraint stations_data_source_fk;

--changeset drsteini:1RIAO
alter table stations add constraint stations_organization_fk foreign key (organization_id) references organizations (id);
--rollback alter table stations drop contraint stations_organization_fk;

--changeset drsteini:1RIAP
alter table stations add constraint stations_site_type_fk foreign key (site_type_id) references site_types (id);
--rollback alter table stations drop contraint stations_site_type_fk;

--changeset drsteini:1RIAQ
alter table stations add constraint stations_country_fk foreign key (country_code_id) references country_codes (id);
--rollback alter table stations drop contraint stations_country_fk;

--changeset drsteini:1RIAR
alter table stations add constraint stations_state_fk foreign key (state_code_id) references state_codes (id);
--rollback alter table stations drop contraint stations_state_fk;

--changeset drsteini:1RIAS
alter table stations add constraint stations_county_fk foreign key (county_code_id) references county_codes (id);
--rollback alter table stations drop contraint stations_county_fk;
