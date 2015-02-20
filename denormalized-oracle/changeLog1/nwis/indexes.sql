--liquibase formatted sql

--This is for the wqp_core schema

--changeset drsteini:1NwisIndexes
create bitmap index s_nwis_country on station_swap_nwis(country_code) parallel 4 nologging;
--rollback drop index s_nwis_country;

--changeset drsteini:1NwisIndexes
create bitmap index s_nwis_county on station_swap_nwis(county_code) parallel 4 nologging;
--rollback drop index s_nwis_county;

--changeset drsteini:1NwisIndexes
insert into user_sdo_geom_metadata
values ('STATION_SWAP_NWIS', 'GEOM',
        mdsys.sdo_dim_array( mdsys.sdo_dim_element('X', -180, 180, 0.005), mdsys.sdo_dim_element('Y', -90, 90, 0.005)), 8265);
--rollback delete from user_sdo_geom_metadata where table_name = 'STATION_SWAP_NWIS';

--changeset drsteini:1NwisIndexes
create index s_nwis_geom on station_swap_nwis(geom) indextype is mdsys.spatial_index parameters ('SDO_INDX_DIMS=2 LAYER_GTYPE="POINT"');
--rollback drop index s_nwis_geom;

--changeset drsteini:1NwisIndexes
create bitmap index s_nwis_huc10 on station_swap_nwis(huc_10) parallel 4 nologging;
--rollback drop index s_nwis_huc10;

--changeset drsteini:1NwisIndexes
create bitmap index s_nwis_huc12 on station_swap_nwis(huc_12) parallel 4 nologging;
--rollback drop index s_nwis_huc12;

--changeset drsteini:1NwisIndexes
create bitmap index s_nwis_huc2 on station_swap_nwis(huc_2) parallel 4 nologging;
--rollback drop index s_nwis_huc2;

--changeset drsteini:1NwisIndexes
create bitmap index s_nwis_huc4 on station_swap_nwis(huc_4) parallel 4 nologging;
--rollback drop index s_nwis_huc4;

--changeset drsteini:1NwisIndexes
create bitmap index s_nwis_huc6 on station_swap_nwis(huc_6) parallel 4 nologging;
--rollback drop index s_nwis_huc6;

--changeset drsteini:1NwisIndexes
create bitmap index s_nwis_huc8 on station_swap_nwis(huc_8) parallel 4 nologging;
--rollback drop index s_nwis_huc8;

--changeset drsteini:1NwisIndexes
create bitmap index s_nwis_organization on station_swap_nwis(organization) parallel 4 nologging;
--rollback drop index s_nwis_organization;

--changeset drsteini:1NwisIndexes
create bitmap index s_nwis_site on station_swap_nwis(site_id) parallel 4 nologging;
--rollback drop index s_nwis_site;

--changeset drsteini:1NwisIndexes
create bitmap index s_nwis_site_type on station_swap_nwis(site_type) parallel 4 nologging;
--rollback drop index s_nwis_site_type;

--changeset drsteini:1NwisIndexes
create bitmap index s_nwis_state on station_swap_nwis(state_code) parallel 4 nologging;
--rollback drop index s_nwis_state;

--changeset drsteini:1NwisIndexes
create bitmap index s_nwis_station on station_swap_nwis(station_id) parallel 4 nologging;
--rollback drop index s_nwis_station;






--changeset drsteini:1NwisIndexes
create bitmap index pcr_nwis_activity on pc_result_swap_nwis(activity) local parallel 4 nologging;
--rollback drop index pcr_nwis_activity;

--changeset drsteini:1NwisIndexes
create bitmap index pcr_nwis_analytical on pc_result_swap_nwis(analytical_method) local parallel 4 nologging;
--rollback drop index pcr_nwis_analyticalod;

--changeset drsteini:1NwisIndexes
create bitmap index pcr_nwis_char_name on pc_result_swap_nwis(characteristic_name) local parallel 4 nologging;
--rollback drop index pcr_nwis_char_name;

--changeset drsteini:1NwisIndexes
create bitmap index pcr_nwis_char_type on pc_result_swap_nwis(characteristic_type) local parallel 4 nologging;
--rollback drop index pcr_nwis_char_type;

--changeset drsteini:1NwisIndexes
create bitmap index pcr_nwis_country on pc_result_swap_nwis(country_code) local parallel 4 nologging;
--rollback drop index pcr_nwis_country;

--changeset drsteini:1NwisIndexes
create bitmap index pcr_nwis_county on pc_result_swap_nwis(county_code) local parallel 4 nologging;
--rollback drop index pcr_nwis_county;

--changeset drsteini:1NwisIndexes
create bitmap index pcr_nwis_event_date on pc_result_swap_nwis(event_date) local parallel 4 nologging;
--rollback drop index pcr_nwis_event_date;

--changeset drsteini:1NwisIndexes
create bitmap index pcr_nwis_huc10 on pc_result_swap_nwis(huc_10) local parallel 4 nologging;
--rollback drop index pcr_nwis_huc10;

--changeset drsteini:1NwisIndexes
create bitmap index pcr_nwis_huc12 on pc_result_swap_nwis(huc_12) local parallel 4 nologging;
--rollback drop index pcr_nwis_huc12;

--changeset drsteini:1NwisIndexes
create bitmap index pcr_nwis_huc2 on pc_result_swap_nwis(huc_2) local parallel 4 nologging;
--rollback drop index pcr_nwis_huc2;

--changeset drsteini:1NwisIndexes
create bitmap index pcr_nwis_huc4 on pc_result_swap_nwis(huc_4) local parallel 4 nologging;
--rollback drop index pcr_nwis_huc4;

--changeset drsteini:1NwisIndexes
create bitmap index pcr_nwis_huc6 on pc_result_swap_nwis(huc_6) local parallel 4 nologging;
--rollback drop index pcr_nwis_huc6;

--changeset drsteini:1NwisIndexes
create bitmap index pcr_nwis_huc8 on pc_result_swap_nwis(huc_8) local parallel 4 nologging;
--rollback drop index pcr_nwis_huc8;

--changeset drsteini:1NwisIndexes
create bitmap index pcr_nwis_organization on pc_result_swap_nwis(organization) local parallel 4 nologging;
--rollback drop index pcr_nwis_organization;

--changeset drsteini:1NwisIndexes
create bitmap index pcr_nwis_p_code on pc_result_swap_nwis(p_code) local parallel 4 nologging;
--rollback drop index pcr_nwis_p_code;

--changeset drsteini:1NwisIndexes
create bitmap index pcr_nwis_sample_media on pc_result_swap_nwis(sample_media) local parallel 4 nologging;
--rollback drop index pcr_nwis_sample_media;

--changeset drsteini:1NwisIndexes
create bitmap index pcr_nwis_site on pc_result_swap_nwis(site_id) local parallel 4 nologging;
--rollback drop index pcr_nwis_site;

--changeset drsteini:1NwisIndexes
create bitmap index pcr_nwis_site_type on pc_result_swap_nwis(site_type) local parallel 4 nologging;
--rollback drop index pcr_nwis_site_type;

--changeset drsteini:1NwisIndexes
create bitmap index pcr_nwis_state on pc_result_swap_nwis(state_code) local parallel 4 nologging;
--rollback drop index pcr_nwis_state;

--changeset drsteini:1NwisIndexes
create bitmap index pcr_nwis_station on pc_result_swap_nwis(station_id) local parallel 4 nologging;
--rollback drop index pcr_nwis_station;







--changeset drsteini:1NwisIndexes
create bitmap index ss_nwis_county on station_sum_swap_nwis(county_code) parallel 4 nologging;
--rollback drop index ss_nwis_county;

--changeset drsteini:1NwisIndexes
insert into user_sdo_geom_metadata
values ('STATION_SUM_SWAP_NWIS', 'GEOM',
        mdsys.sdo_dim_array( mdsys.sdo_dim_element('X', -180, 180, 0.005), mdsys.sdo_dim_element('Y', -90, 90, 0.005)), 8265);
--rollback delete from user_sdo_geom_metadata where table_name = 'STATION_SUM_SWAP_NWIS';

--changeset drsteini:1NwisIndexes
create index ss_nwis_geom on station_sum_swap_nwis(geom) indextype is mdsys.spatial_index parameters ('SDO_INDX_DIMS=2 LAYER_GTYPE="POINT"');
--rollback drop index ss_nwis_geom;

--changeset drsteini:1NwisIndexes
create bitmap index ss_nwis_huc10 on station_sum_swap_nwis(huc_10) parallel 4 nologging;
--rollback drop index ss_nwis_huc10;

--changeset drsteini:1NwisIndexes
create bitmap index ss_nwis_huc12 on station_sum_swap_nwis(huc_12) parallel 4 nologging;
--rollback drop index ss_nwis_huc12;

--changeset drsteini:1NwisIndexes
create bitmap index ss_nwis_huc2 on station_sum_swap_nwis(huc_2) parallel 4 nologging;
--rollback drop index ss_nwis_huc2;

--changeset drsteini:1NwisIndexes
create bitmap index ss_nwis_huc4 on station_sum_swap_nwis(huc_4) parallel 4 nologging;
--rollback drop index ss_nwis_huc4;

--changeset drsteini:1NwisIndexes
create bitmap index ss_nwis_huc6 on station_sum_swap_nwis(huc_6) parallel 4 nologging;
--rollback drop index ss_nwis_huc6;

--changeset drsteini:1NwisIndexes
create bitmap index ss_nwis_huc8 on station_sum_swap_nwis(huc_8) parallel 4 nologging;
--rollback drop index ss_nwis_huc8;

--changeset drsteini:1NwisIndexes
create bitmap index ss_nwis_organization on station_sum_swap_nwis(organization) parallel 4 nologging;
--rollback drop index ss_nwis_organization;

--changeset drsteini:1NwisIndexes
create bitmap index ss_nwis_site on station_sum_swap_nwis(site_id) parallel 4 nologging;
--rollback drop index ss_nwis_s_site;

--changeset drsteini:1NwisIndexes
create bitmap index ss_nwis_site_type on station_sum_swap_nwis(site_type) parallel 4 nologging;
--rollback drop index ss_nwis_site_type;

--changeset drsteini:1NwisIndexes
create bitmap index ss_nwis_state on station_sum_swap_nwis(state_code) parallel 4 nologging;
--rollback drop index ss_nwis_state;

--changeset drsteini:1NwisIndexes
create bitmap index ss_nwis_station on station_sum_swap_nwis(station_id) parallel 4 nologging;
--rollback drop index ss_nwis_s_station;




--changeset drsteini:1NwisIndexes
create bitmap index pcrs_nwis_analytical on pc_result_sum_swap_nwis(analytical_method) local parallel 4 nologging;
--rollback drop index pcrs_nwis_analytical;

--changeset drsteini:1NwisIndexes
create bitmap index pcrs_nwis_char_name on pc_result_sum_swap_nwis(characteristic_name) local parallel 4 nologging;
--rollback drop index pcrs_nwis_char_name;

--changeset drsteini:1NwisIndexes
create bitmap index pcrs_nwis_char_type on pc_result_sum_swap_nwis(characteristic_type) local parallel 4 nologging;
--rollback drop index pcrs_nwis_char_type;

--changeset drsteini:1NwisIndexes
create bitmap index pcrs_nwis_country on pc_result_sum_swap_nwis(country_code) local parallel 4 nologging;
--rollback drop index pcrs_nwis_country;

--changeset drsteini:1NwisIndexes
create bitmap index pcrs_nwis_county on pc_result_sum_swap_nwis(county_code) local parallel 4 nologging;
--rollback drop index pcrs_nwis_county;

--changeset drsteini:1NwisIndexes
create bitmap index pcrs_nwis_event_date on pc_result_sum_swap_nwis(event_date) local parallel 4 nologging;
--rollback drop index pcrs_nwis_event_date;

--changeset drsteini:1NwisIndexes
create bitmap index pcrs_nwis_huc10 on pc_result_sum_swap_nwis(huc_10) local parallel 4 nologging;
--rollback drop index pcrs_nwis_huc10;

--changeset drsteini:1NwisIndexes
create bitmap index pcrs_nwis_huc12 on pc_result_sum_swap_nwis(huc_12) local parallel 4 nologging;
--rollback drop index pcrs_nwis_huc12;

--changeset drsteini:1NwisIndexes
create bitmap index pcrs_nwis_huc2 on pc_result_sum_swap_nwis(huc_2) local parallel 4 nologging;
--rollback drop index pcrs_nwis_huc2;

--changeset drsteini:1NwisIndexes
create bitmap index pcrs_nwis_huc4 on pc_result_sum_swap_nwis(huc_4) local parallel 4 nologging;
--rollback drop index pcrs_nwis_huc4;

--changeset drsteini:1NwisIndexes
create bitmap index pcrs_nwis_huc6 on pc_result_sum_swap_nwis(huc_6) local parallel 4 nologging;
--rollback drop index pcrs_nwis_huc6;

--changeset drsteini:1NwisIndexes
create bitmap index pcrs_nwis_huc8 on pc_result_sum_swap_nwis(huc_8) local parallel 4 nologging;
--rollback drop index pcrs_nwis_huc8;

--changeset drsteini:1NwisIndexes
create bitmap index pcrs_nwis_organization on pc_result_sum_swap_nwis(organization) local parallel 4 nologging;
--rollback drop index pcrs_nwis_organization;

--changeset drsteini:1NwisIndexes
create bitmap index pcrs_nwis_p_code on pc_result_sum_swap_nwis(p_code) local parallel 4 nologging;
--rollback drop index pcrs_nwis_p_code;

--changeset drsteini:1NwisIndexes
create bitmap index pcrs_nwis_sample_media on pc_result_sum_swap_nwis(sample_media) local parallel 4 nologging;
--rollback drop index pcrs_nwis_sample_media;

--changeset drsteini:1NwisIndexes
create bitmap index pcrs_nwis_site on pc_result_sum_swap_nwis(site_id) local parallel 4 nologging;
--rollback drop index pcrs_nwis_site;

--changeset drsteini:1NwisIndexes
create bitmap index pcrs_nwis_site_type on pc_result_sum_swap_nwis(site_type) local parallel 4 nologging;
--rollback drop index pcrs_nwis_site_type;

--changeset drsteini:1NwisIndexes
create bitmap index pcrs_nwis_state on pc_result_sum_swap_nwis(state_code) local parallel 4 nologging;
--rollback drop index pcrs_nwis_state;

--changeset drsteini:1NwisIndexes
create bitmap index pcrs_nwis_station on pc_result_sum_swap_nwis(station_id) local parallel 4 nologging;
--rollback drop index pcrs_nwis_station;








--changeset drsteini:1NwisIndexes
create bitmap index pcrcts_nwis_analytical on pc_result_ct_sum_swap_nwis(analytical_method) local parallel 4 nologging;
--rollback drop index pcrcts_nwis_analytical;

--changeset drsteini:1NwisIndexes
create bitmap index pcrcts_nwis_char_name on pc_result_ct_sum_swap_nwis(characteristic_name) local parallel 4 nologging;
--rollback drop index pcrcts_nwis_char_name;

--changeset drsteini:1NwisIndexes
create bitmap index pcrcts_nwis_char_type on pc_result_ct_sum_swap_nwis(characteristic_type) local parallel 4 nologging;
--rollback drop index pcrcts_nwis_char_type;

--changeset drsteini:1NwisIndexes
create bitmap index pcrcts_nwis_country on pc_result_ct_sum_swap_nwis(country_code) local parallel 4 nologging;
--rollback drop index pcrcts_nwis_country;

--changeset drsteini:1NwisIndexes
create bitmap index pcrcts_nwis_county on pc_result_ct_sum_swap_nwis(county_code) local parallel 4 nologging;
--rollback drop index pcrcts_nwis_county;

--changeset drsteini:1NwisIndexes
create bitmap index pcrcts_nwis_huc10 on pc_result_ct_sum_swap_nwis(huc_10) local parallel 4 nologging;
--rollback drop index pcrcts_nwis_huc10;

--changeset drsteini:1NwisIndexes
create bitmap index pcrcts_nwis_huc12 on pc_result_ct_sum_swap_nwis(huc_12) local parallel 4 nologging;
--rollback drop index pcrcts_nwis_huc12;

--changeset drsteini:1NwisIndexes
create bitmap index pcrcts_nwis_huc2 on pc_result_ct_sum_swap_nwis(huc_2) local parallel 4 nologging;
--rollback drop index pcrcts_nwis_huc2;

--changeset drsteini:1NwisIndexes
create bitmap index pcrcts_nwis_huc4 on pc_result_ct_sum_swap_nwis(huc_4) local parallel 4 nologging;
--rollback drop index pcrcts_nwis_huc4;

--changeset drsteini:1NwisIndexes
create bitmap index pcrcts_nwis_huc6 on pc_result_ct_sum_swap_nwis(huc_6) local parallel 4 nologging;
--rollback drop index pcrcts_nwis_huc6;

--changeset drsteini:1NwisIndexes
create bitmap index pcrcts_nwis_huc8 on pc_result_ct_sum_swap_nwis(huc_8) local parallel 4 nologging;
--rollback drop index pcrcts_nwis_huc8;

--changeset drsteini:1NwisIndexes
create bitmap index pcrcts_nwis_organization on pc_result_ct_sum_swap_nwis(organization) local parallel 4 nologging;
--rollback drop index pcrcts_nwis_organization;

--changeset drsteini:1NwisIndexes
create bitmap index pcrcts_nwis_p_code on pc_result_ct_sum_swap_nwis(p_code) local parallel 4 nologging;
--rollback drop index pcrcts_nwis_p_code;

--changeset drsteini:1NwisIndexes
create bitmap index pcrcts_nwis_sample_media on pc_result_ct_sum_swap_nwis(sample_media) local parallel 4 nologging;
--rollback drop index pcrcts_nwis_sample_media;

--changeset drsteini:1NwisIndexes
create bitmap index pcrcts_nwis_site on pc_result_ct_sum_swap_nwis(site_id) local parallel 4 nologging;
--rollback drop index pcrcts_nwis_site;

--changeset drsteini:1NwisIndexes
create bitmap index pcrcts_nwis_site_type on pc_result_ct_sum_swap_nwis(site_type) local parallel 4 nologging;
--rollback drop index pcrcts_nwis_site_type;

--changeset drsteini:1NwisIndexes
create bitmap index pcrcts_nwis_state on pc_result_ct_sum_swap_nwis(state_code) local parallel 4 nologging;
--rollback drop index pcrcts_nwis_state;

--changeset drsteini:1NwisIndexes
create bitmap index pcrcts_nwis_station on pc_result_ct_sum_swap_nwis(station_id) local parallel 4 nologging;
--rollback drop index pcrcts_nwis_station;




--changeset drsteini:1NwisIndexes
create bitmap index pcrnrs_nwis_analytical on pc_result_nr_sum_swap_nwis(analytical_method) local parallel 4 nologging;
--rollback drop index pcrnrs_nwis_analytical;

--changeset drsteini:1NwisIndexes
create bitmap index pcrnrs_nwis_char_name on pc_result_nr_sum_swap_nwis(characteristic_name) local parallel 4 nologging;
--rollback drop index pcrnrs_nwis_char_name;

--changeset drsteini:1NwisIndexes
create bitmap index pcrnrs_nwis_char_type on pc_result_nr_sum_swap_nwis(characteristic_type) local parallel 4 nologging;
--rollback drop index pcrnrs_nwis_char_type;

--changeset drsteini:1NwisIndexes
create bitmap index pcrnrs_nwis_p_code on pc_result_nr_sum_swap_nwis(p_code) local parallel 4 nologging;
--rollback drop index pcrnrs_nwis_p_code;

--changeset drsteini:1NwisIndexes
create bitmap index pcrnrs_nwis_sample_media on pc_result_nr_sum_swap_nwis(sample_media) local parallel 4 nologging;
--rollback drop index pcrnrs_nwis_sample_media;

--changeset drsteini:1NwisIndexes
create bitmap index pcrnrs_nwis_station on pc_result_nr_sum_swap_nwis(station_id) local parallel 4 nologging;
--rollback drop index pcrnrs_nwis_station;




