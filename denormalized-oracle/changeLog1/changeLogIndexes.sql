--liquibase formatted sql

--This is for the wqp_core schema

--changeset drsteini:1IndexesAA
create index results_station_d on wqp_results_d(station_id);
--rollback drop index results_station_d;

--changeset drsteini:1IndexesAB
create index results_data_source_d on wqp_results_d(data_source);
--rollback drop index results_data_source_d;

--changeset drsteini:1IndexesAC
create index results_event_date_d on wqp_results_d(event_date_id);
--rollback drop index results_event_date_d;

--changeset drsteini:1IndexesAD
create index results_analytical_method_d on wqp_results_d(analytical_method);
--rollback drop index results_analytical_method_d;

--changeset drsteini:1IndexesAE
create index results_p_code_d on wqp_results_d(p_code);
--rollback drop index results_p_code_d;

--changeset drsteini:1IndexesAF
create index results_activity_d on wqp_results_d(activity);
--rollback drop index results_activity_d;

--changeset drsteini:1IndexesAG
create index results_characteristic_name_d on wqp_results_d(characteristic_name);
--rollback drop index results_characteristic_name_d;

--changeset drsteini:1IndexesAH
create index results_characteristic_type_d on wqp_results_d(characteristic_type);
--rollback drop index results_characteristic_type_d;

--changeset drsteini:1IndexesAI
create index results_sample_media_d on wqp_results_d(sample_media);
--rollback drop index results_sample_media_d;

--changeset drsteini:1IndexesAJ
create index results_organization_d on wqp_results_d(organization);
--rollback drop index results_organization_d;

--changeset drsteini:1IndexesAK
create index results_site_type_d on wqp_results_d(site_type);
--rollback drop index results_site_type_d;

--changeset drsteini:1IndexesAL
create index results_huc2_d on wqp_results_d(huc2);
--rollback drop index results_huc2_d;

--changeset drsteini:1IndexesAM
create index results_huc4_d on wqp_results_d(huc4);
--rollback drop index results_huc4_d;

--changeset drsteini:1IndexesAN
create index results_huc6_d on wqp_results_d(huc6);
--rollback drop index results_huc6_d;

--changeset drsteini:1IndexesAO
create index results_huc8_d on wqp_results_d(huc8);
--rollback drop index results_huc8_d;

--changeset drsteini:1IndexesAP
create index results_huc10_d on wqp_results_d(huc10);
--rollback drop index results_huc10_d;

--changeset drsteini:1IndexesAQ
create index results_huc12_d on wqp_results_d(huc12);
--rollback drop index results_huc12_d;

--changeset drsteini:1IndexesAR
create index results_country_code_d on wqp_results_d(country_code);
--rollback drop index results_country_code_d;

--changeset drsteini:1IndexesAS
create index results_state_code_d on wqp_results_d(state_code);
--rollback drop index results_state_code_d;

--changeset drsteini:1IndexesAT
create index results_county_code_d on wqp_results_d(county_code);
--rollback drop index results_county_code_d;

--changeset drsteini:1IndexesAU
create index stations_site_d on stations_d(site_id);
--rollback drop index stations_site_d;

--changeset drsteini:1IndexesAV
create index stations_data_source_d on stations_d(data_source);
--rollback drop index stations_data_source_d;

--changeset drsteini:1IndexesAW
create index stations_organization_d on stations_d(organization);
--rollback drop index stations_organization_d;

--changeset drsteini:1IndexesAX
create index stations_site_type_d on stations_d(site_type);
--rollback drop index stations_site_type_d;

--changeset drsteini:1IndexesAY
create index stations_huc2_d on stations_d(huc2);
--rollback drop index stations_huc2_d;

--changeset drsteini:1IndexesAZ
create index stations_huc4_d on stations_d(huc4);
--rollback drop index stations_huc4_d;

--changeset drsteini:1IndexesBA
create index stations_huc6_d on stations_d(huc6);
--rollback drop index stations_huc6_d;

--changeset drsteini:1IndexesBB
create index stations_huc8_d on stations_d(huc8);
--rollback drop index stations_huc8_d;

--changeset drsteini:1IndexesBC
create index stations_huc10_d on stations_d(huc10);
--rollback drop index stations_huc10_d;

--changeset drsteini:1IndexesBD
create index stations_huc12_d on stations_d(huc12);
--rollback drop index stations_huc12_d;

--changeset drsteini:1IndexesBE
create index stations_country_code_d on stations_d(country_code);
--rollback drop index stations_country_code_d;

--changeset drsteini:1IndexesBF
create index stations_state_code_d on stations_d(state_code);
--rollback drop index stations_state_code_d;

--changeset drsteini:1IndexesBG
create index stations_county_code_d on stations_d(county_code);
--rollback drop index stations_county_code_d;

--changeset drsteini:1IndexesBH
insert into user_sdo_geom_metadata
values ('WQP_RESULTS_D', 'GEOGRAPHY',
        mdsys.sdo_dim_array( mdsys.sdo_dim_element('X', -180, 180, 0.005), mdsys.sdo_dim_element('Y', -90, 90, 0.005)), 8307);
--rollback delete from user_sdo_geom_metadata where table_name = 'WQP_RESULTS_D';

--changeset drsteini:1IndexesBI
create index results_geography_d on wqp_results_d(geography) indextype is mdsys.spatial_index parameters ('SDO_INDX_DIMS=2 LAYER_GTYPE="POINT"');
--rollback drop index results_geography_d;

--changeset drsteini:1IndexesBJ
insert into user_sdo_geom_metadata
values ('STATIONS_D', 'GEOGRAPHY',
        mdsys.sdo_dim_array( mdsys.sdo_dim_element('X', -180, 180, 0.005), mdsys.sdo_dim_element('Y', -90, 90, 0.005)), 8307);
--rollback delete from user_sdo_geom_metadata where table_name = 'STATIONS_D';

--changeset drsteini:1IndexesBK
create index stations_geography_d on stations_d(geography) indextype is mdsys.spatial_index parameters ('SDO_INDX_DIMS=2 LAYER_GTYPE="POINT"');
--rollback drop index stations_geography_d;
