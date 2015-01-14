--liquibase formatted sql

--This is for the wqp_core schema

--changeset drsteini:1IndexesAA
create index results_station on wqp_results(station_id);
--rollback drop index results_station;

--changeset drsteini:1IndexesAB
create index results_data_source on wqp_results(data_source_id);
--rollback drop index results_data_source;

--changeset drsteini:1IndexesAC
create index results_event_date on wqp_results(event_date_id);
--rollback drop index results_event_date;

--changeset drsteini:1IndexesAD
create index results_analytical_method on wqp_results(analytical_method_id);
--rollback drop index results_analytical_method;

--changeset drsteini:1IndexesAE
create index results_p_code on wqp_results(p_code_id);
--rollback drop index results_p_code;

--changeset drsteini:1IndexesAF
create index results_activity on wqp_results(activity_id);
--rollback drop index results_activity;

--changeset drsteini:1IndexesAG
create index results_characteristic_name on wqp_results(characteristic_name_id);
--rollback drop index results_characteristic_name;

--changeset drsteini:1IndexesAH
create index results_characteristic_type on wqp_results(characteristic_type_id);
--rollback drop index results_characteristic_type;

--changeset drsteini:1IndexesAI
create index results_sample_media on wqp_results(sample_media_id);
--rollback drop index results_sample_media;

--changeset drsteini:1IndexesAJ
create index results_organization on wqp_results(organization_id);
--rollback drop index results_organization;

--changeset drsteini:1IndexesAK
create index results_site_type on wqp_results(site_type_id);
--rollback drop index results_site_type;

--changeset drsteini:1IndexesAL
create index results_huc2 on wqp_results(huc2);
--rollback drop index results_huc2;

--changeset drsteini:1IndexesAM
create index results_huc4 on wqp_results(huc4);
--rollback drop index results_huc4;

--changeset drsteini:1IndexesAN
create index results_huc6 on wqp_results(huc6);
--rollback drop index results_huc6;

--changeset drsteini:1IndexesAO
create index results_huc8 on wqp_results(huc8);
--rollback drop index results_huc8;

--changeset drsteini:1IndexesAP
create index results_huc10 on wqp_results(huc10);
--rollback drop index results_huc10;

--changeset drsteini:1IndexesAQ
create index results_huc12 on wqp_results(huc12);
--rollback drop index results_huc12;

--changeset drsteini:1IndexesAR
create index results_country_code on wqp_results(country_code_id);
--rollback drop index results_country_code;

--changeset drsteini:1IndexesAS
create index results_state_code on wqp_results(state_code_id);
--rollback drop index results_state_code;

--changeset drsteini:1IndexesAT
create index results_county_code on wqp_results(county_code_id);
--rollback drop index results_county_code;

--changeset drsteini:1IndexesAU
create index stations_site on stations(site_id);
--rollback drop index stations_site;

--changeset drsteini:1IndexesAV
create index stations_data_source on stations(data_source_id);
--rollback drop index stations_data_source;

--changeset drsteini:1IndexesAW
create index stations_organization on stations(organization_id);
--rollback drop index stations_organization;

--changeset drsteini:1IndexesAX
create index stations_site_type on stations(site_type_id);
--rollback drop index stations_site_type;

--changeset drsteini:1IndexesAY
create index stations_huc2 on stations(huc2);
--rollback drop index stations_huc2;

--changeset drsteini:1IndexesAZ
create index stations_huc4 on stations(huc4);
--rollback drop index stations_huc4;

--changeset drsteini:1IndexesBA
create index stations_huc6 on stations(huc6);
--rollback drop index stations_huc6;

--changeset drsteini:1IndexesBB
create index stations_huc8 on stations(huc8);
--rollback drop index stations_huc8;

--changeset drsteini:1IndexesBC
create index stations_huc10 on stations(huc10);
--rollback drop index stations_huc10;

--changeset drsteini:1IndexesBD
create index stations_huc12 on stations(huc12);
--rollback drop index stations_huc12;

--changeset drsteini:1IndexesBE
create index stations_country_code on stations(country_code_id);
--rollback drop index stations_country_code;

--changeset drsteini:1IndexesBF
create index stations_state_code on stations(state_code_id);
--rollback drop index stations_state_code;

--changeset drsteini:1IndexesBG
create index stations_county_code on stations(county_code_id);
--rollback drop index stations_county_code;

--changeset drsteini:1IndexesBH
insert into user_sdo_geom_metadata
values ('WQP_RESULTS', 'GEOGRAPHY',
        mdsys.sdo_dim_array( mdsys.sdo_dim_element('X', -180, 180, 0.005), mdsys.sdo_dim_element('Y', -90, 90, 0.005)), 8307);
--rollback delete from user_sdo_geom_metadata where table_name = 'WQP_RESULTS';

--changeset drsteini:1IndexesBI
create index results_geography on wqp_results(geography) indextype is mdsys.spatial_index parameters ('SDO_INDX_DIMS=2 LAYER_GTYPE="POINT"');
--rollback drop index results_geography;

--changeset drsteini:1IndexesBJ
insert into user_sdo_geom_metadata
values ('STATIONS', 'GEOGRAPHY',
        mdsys.sdo_dim_array( mdsys.sdo_dim_element('X', -180, 180, 0.005), mdsys.sdo_dim_element('Y', -90, 90, 0.005)), 8307);
--rollback delete from user_sdo_geom_metadata where table_name = 'STATIONS';

--changeset drsteini:1IndexesBK
create index stations_geography on stations(geography) indextype is mdsys.spatial_index parameters ('SDO_INDX_DIMS=2 LAYER_GTYPE="POINT"');
--rollback drop index stations_geography;
