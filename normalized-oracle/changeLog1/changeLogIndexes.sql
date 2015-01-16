--liquibase formatted sql

--This is for the wqp_core schema

--changeset drsteini:1IndexesAA
create index results_station_n on wqp_results_n(station_id);
--rollback drop index results_station_n;

--changeset drsteini:1IndexesAB
create index results_data_source_n on wqp_results_n(data_source_id);
--rollback drop index results_data_source_n;

--changeset drsteini:1IndexesAC
create index results_event_date_n on wqp_results_n(event_date_id);
--rollback drop index results_event_date_n;

--changeset drsteini:1IndexesAD
create index results_analytical_method_n on wqp_results_n(analytical_method_id);
--rollback drop index results_analytical_method_n;

--changeset drsteini:1IndexesAE
create index results_p_code_n on wqp_results_n(p_code_id);
--rollback drop index results_p_code_n;

--changeset drsteini:1IndexesAF
create index results_activity_n on wqp_results_n(activity_id);
--rollback drop index results_activity_n;

--changeset drsteini:1IndexesAG
create index results_characteristic_name_n on wqp_results_n(characteristic_name_id);
--rollback drop index results_characteristic_name_n;

--changeset drsteini:1IndexesAH
create index results_characteristic_type_n on wqp_results_n(characteristic_type_id);
--rollback drop index results_characteristic_type_n;

--changeset drsteini:1IndexesAI
create index results_sample_media_n on wqp_results_n(sample_media_id);
--rollback drop index results_sample_media_n;

--changeset drsteini:1IndexesAJ
create index results_organization_n on wqp_results_n(organization_id);
--rollback drop index results_organization_n;

--changeset drsteini:1IndexesAK
create index results_site_type_n on wqp_results_n(site_type_id);
--rollback drop index results_site_type_n;

--changeset drsteini:1IndexesAL
create index results_huc2_n on wqp_results_n(huc2);
--rollback drop index results_huc2_n;

--changeset drsteini:1IndexesAM
create index results_huc4_n on wqp_results_n(huc4);
--rollback drop index results_huc4_n;

--changeset drsteini:1IndexesAN
create index results_huc6_n on wqp_results_n(huc6);
--rollback drop index results_huc6_n;

--changeset drsteini:1IndexesAO
create index results_huc8_n on wqp_results_n(huc8);
--rollback drop index results_huc8_n;

--changeset drsteini:1IndexesAP
create index results_huc10_n on wqp_results_n(huc10);
--rollback drop index results_huc10_n;

--changeset drsteini:1IndexesAQ
create index results_huc12_n on wqp_results_n(huc12);
--rollback drop index results_huc12_n;

--changeset drsteini:1IndexesAR
create index results_country_code_n on wqp_results_n(country_code_id);
--rollback drop index results_country_code_n;

--changeset drsteini:1IndexesAS
create index results_state_code_n on wqp_results_n(state_code_id);
--rollback drop index results_state_code_n;

--changeset drsteini:1IndexesAT
create index results_county_code_n on wqp_results_n(county_code_id);
--rollback drop index results_county_code_n;

--changeset drsteini:1IndexesAU
create index stations_site_n on stations_n(site_id);
--rollback drop index stations_site_n;

--changeset drsteini:1IndexesAV
create index stations_data_source_n on stations_n(data_source_id);
--rollback drop index stations_data_source_n;

--changeset drsteini:1IndexesAW
create index stations_organization_n on stations_n(organization_id);
--rollback drop index stations_organization_n;

--changeset drsteini:1IndexesAX
create index stations_site_type_n on stations_n(site_type_id);
--rollback drop index stations_site_type_n;

--changeset drsteini:1IndexesAY
create index stations_huc2_n on stations_n(huc2);
--rollback drop index stations_huc2_n;

--changeset drsteini:1IndexesAZ
create index stations_huc4_n on stations_n(huc4);
--rollback drop index stations_huc4_n;

--changeset drsteini:1IndexesBA
create index stations_huc6_n on stations_n(huc6);
--rollback drop index stations_huc6_n;

--changeset drsteini:1IndexesBB
create index stations_huc8_n on stations_n(huc8);
--rollback drop index stations_huc8_n;

--changeset drsteini:1IndexesBC
create index stations_huc10_n on stations_n(huc10);
--rollback drop index stations_huc10_n;

--changeset drsteini:1IndexesBD
create index stations_huc12_n on stations_n(huc12);
--rollback drop index stations_huc12_n;

--changeset drsteini:1IndexesBE
create index stations_country_code_n on stations_n(country_code_id);
--rollback drop index stations_country_code_n;

--changeset drsteini:1IndexesBF
create index stations_state_code_n on stations_n(state_code_id);
--rollback drop index stations_state_code_n;

--changeset drsteini:1IndexesBG
create index stations_county_code_n on stations_n(county_code_id);
--rollback drop index stations_county_code_n;

--changeset drsteini:1IndexesBH
insert into user_sdo_geom_metadata
values ('WQP_RESULTS_N', 'GEOGRAPHY',
        mdsys.sdo_dim_array( mdsys.sdo_dim_element('X', -180, 180, 0.005), mdsys.sdo_dim_element('Y', -90, 90, 0.005)), 8307);
--rollback delete from user_sdo_geom_metadata where table_name = 'WQP_RESULTS_N';

--changeset drsteini:1IndexesBI
create index results_geography_n on wqp_results_n(geography) indextype is mdsys.spatial_index parameters ('SDO_INDX_DIMS=2 LAYER_GTYPE="POINT"');
--rollback drop index results_geography_n;

--changeset drsteini:1IndexesBJ
insert into user_sdo_geom_metadata
values ('STATIONS_N', 'GEOGRAPHY',
        mdsys.sdo_dim_array( mdsys.sdo_dim_element('X', -180, 180, 0.005), mdsys.sdo_dim_element('Y', -90, 90, 0.005)), 8307);
--rollback delete from user_sdo_geom_metadata where table_name = 'STATIONS_N';

--changeset drsteini:1IndexesBK
create index stations_geography_n on stations_n(geography_n) indextype is mdsys.spatial_index parameters ('SDO_INDX_DIMS=2 LAYER_GTYPE="POINT"');
--rollback drop index stations_geography_n;
