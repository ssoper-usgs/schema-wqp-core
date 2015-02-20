--liquibase formatted sql

--This is for the wqp_core schema

--changeset drsteini:1StoretIndexes
create bitmap index s_storet_country on station_swap_storet(country_code) parallel 4 nologging;
--rollback drop index s_storet_country;

--changeset drsteini:1StoretIndexes
create bitmap index s_storet_county on station_swap_storet(county_code) parallel 4 nologging;
--rollback drop index s_storet_county;

--changeset drsteini:1StoretIndexes
insert into user_sdo_geom_metadata
values ('STATION_SWAP_storet', 'GEOM',
        mdsys.sdo_dim_array( mdsys.sdo_dim_element('X', -180, 180, 0.005), mdsys.sdo_dim_element('Y', -90, 90, 0.005)), 8265);
--rollback delete from user_sdo_geom_metadata where table_name = 'STATION_SWAP_storet';

--changeset drsteini:1StoretIndexes
create index s_storet_geom on station_swap_storet(geom) indextype is mdsys.spatial_index parameters ('SDO_INDX_DIMS=2 LAYER_GTYPE="POINT"');
--rollback drop index s_storet_geom;

--changeset drsteini:1StoretIndexes
create bitmap index s_storet_huc10 on station_swap_storet(huc_10) parallel 4 nologging;
--rollback drop index s_storet_huc10;

--changeset drsteini:1StoretIndexes
create bitmap index s_storet_huc12 on station_swap_storet(huc_12) parallel 4 nologging;
--rollback drop index s_storet_huc12;

--changeset drsteini:1StoretIndexes
create bitmap index s_storet_huc2 on station_swap_storet(huc_2) parallel 4 nologging;
--rollback drop index s_storet_huc2;

--changeset drsteini:1StoretIndexes
create bitmap index s_storet_huc4 on station_swap_storet(huc_4) parallel 4 nologging;
--rollback drop index s_storet_huc4;

--changeset drsteini:1StoretIndexes
create bitmap index s_storet_huc6 on station_swap_storet(huc_6) parallel 4 nologging;
--rollback drop index s_storet_huc6;

--changeset drsteini:1StoretIndexes
create bitmap index s_storet_huc8 on station_swap_storet(huc_8) parallel 4 nologging;
--rollback drop index s_storet_huc8;

--changeset drsteini:1StoretIndexes
create bitmap index s_storet_organization on station_swap_storet(organization) parallel 4 nologging;
--rollback drop index s_storet_organization;

--changeset drsteini:1StoretIndexes
create bitmap index s_storet_site on station_swap_storet(site_id) parallel 4 nologging;
--rollback drop index s_storet_site;

--changeset drsteini:1StoretIndexes
create bitmap index s_storet_site_type on station_swap_storet(site_type) parallel 4 nologging;
--rollback drop index s_storet_site_type;

--changeset drsteini:1StoretIndexes
create bitmap index s_storet_state on station_swap_storet(state_code) parallel 4 nologging;
--rollback drop index s_storet_state;

--changeset drsteini:1StoretIndexes
create bitmap index s_storet_station on station_swap_storet(station_id) parallel 4 nologging;
--rollback drop index s_storet_station;






--changeset drsteini:1StoretIndexes
create bitmap index pcr_storet_activity on pc_result_swap_storet(activity) local parallel 4 nologging;
--rollback drop index pcr_storet_activity;

--changeset drsteini:1StoretIndexes
create bitmap index pcr_storet_analytical on pc_result_swap_storet(analytical_method) local parallel 4 nologging;
--rollback drop index pcr_storet_analyticalod;

--changeset drsteini:1StoretIndexes
create bitmap index pcr_storet_char_name on pc_result_swap_storet(characteristic_name) local parallel 4 nologging;
--rollback drop index pcr_storet_char_name;

--changeset drsteini:1StoretIndexes
create bitmap index pcr_storet_char_type on pc_result_swap_storet(characteristic_type) local parallel 4 nologging;
--rollback drop index pcr_storet_char_type;

--changeset drsteini:1StoretIndexes
create bitmap index pcr_storet_country on pc_result_swap_storet(country_code) local parallel 4 nologging;
--rollback drop index pcr_storet_country;

--changeset drsteini:1StoretIndexes
create bitmap index pcr_storet_county on pc_result_swap_storet(county_code) local parallel 4 nologging;
--rollback drop index pcr_storet_county;

--changeset drsteini:1StoretIndexes
create bitmap index pcr_storet_event_date on pc_result_swap_storet(event_date) local parallel 4 nologging;
--rollback drop index pcr_storet_event_date;

--changeset drsteini:1StoretIndexes
create bitmap index pcr_storet_huc10 on pc_result_swap_storet(huc_10) local parallel 4 nologging;
--rollback drop index pcr_storet_huc10;

--changeset drsteini:1StoretIndexes
create bitmap index pcr_storet_huc12 on pc_result_swap_storet(huc_12) local parallel 4 nologging;
--rollback drop index pcr_storet_huc12;

--changeset drsteini:1StoretIndexes
create bitmap index pcr_storet_huc2 on pc_result_swap_storet(huc_2) local parallel 4 nologging;
--rollback drop index pcr_storet_huc2;

--changeset drsteini:1StoretIndexes
create bitmap index pcr_storet_huc4 on pc_result_swap_storet(huc_4) local parallel 4 nologging;
--rollback drop index pcr_storet_huc4;

--changeset drsteini:1StoretIndexes
create bitmap index pcr_storet_huc6 on pc_result_swap_storet(huc_6) local parallel 4 nologging;
--rollback drop index pcr_storet_huc6;

--changeset drsteini:1StoretIndexes
create bitmap index pcr_storet_huc8 on pc_result_swap_storet(huc_8) local parallel 4 nologging;
--rollback drop index pcr_storet_huc8;

--changeset drsteini:1StoretIndexes
create bitmap index pcr_storet_organization on pc_result_swap_storet(organization) local parallel 4 nologging;
--rollback drop index pcr_storet_organization;

--changeset drsteini:1StoretIndexes
create bitmap index pcr_storet_p_code on pc_result_swap_storet(p_code) local parallel 4 nologging;
--rollback drop index pcr_storet_p_code;

--changeset drsteini:1StoretIndexes
create bitmap index pcr_storet_sample_media on pc_result_swap_storet(sample_media) local parallel 4 nologging;
--rollback drop index pcr_storet_sample_media;

--changeset drsteini:1StoretIndexes
create bitmap index pcr_storet_site on pc_result_swap_storet(site_id) local parallel 4 nologging;
--rollback drop index pcr_storet_site;

--changeset drsteini:1StoretIndexes
create bitmap index pcr_storet_site_type on pc_result_swap_storet(site_type) local parallel 4 nologging;
--rollback drop index pcr_storet_site_type;

--changeset drsteini:1StoretIndexes
create bitmap index pcr_storet_state on pc_result_swap_storet(state_code) local parallel 4 nologging;
--rollback drop index pcr_storet_state;

--changeset drsteini:1StoretIndexes
create bitmap index pcr_storet_station on pc_result_swap_storet(station_id) local parallel 4 nologging;
--rollback drop index pcr_storet_station;







--changeset drsteini:1StoretIndexes
create bitmap index ss_storet_county on station_sum_swap_storet(county_code) parallel 4 nologging;
--rollback drop index ss_storet_county;

--changeset drsteini:1StoretIndexes
insert into user_sdo_geom_metadata
values ('STATION_SUM_SWAP_storet', 'GEOM',
        mdsys.sdo_dim_array( mdsys.sdo_dim_element('X', -180, 180, 0.005), mdsys.sdo_dim_element('Y', -90, 90, 0.005)), 8265);
--rollback delete from user_sdo_geom_metadata where table_name = 'STATION_SUM_SWAP_storet';

--changeset drsteini:1StoretIndexes
create index ss_storet_geom on station_sum_swap_storet(geom) indextype is mdsys.spatial_index parameters ('SDO_INDX_DIMS=2 LAYER_GTYPE="POINT"');
--rollback drop index ss_storet_geom;

--changeset drsteini:1StoretIndexes
create bitmap index ss_storet_huc10 on station_sum_swap_storet(huc_10) parallel 4 nologging;
--rollback drop index ss_storet_huc10;

--changeset drsteini:1StoretIndexes
create bitmap index ss_storet_huc12 on station_sum_swap_storet(huc_12) parallel 4 nologging;
--rollback drop index ss_storet_huc12;

--changeset drsteini:1StoretIndexes
create bitmap index ss_storet_huc2 on station_sum_swap_storet(huc_2) parallel 4 nologging;
--rollback drop index ss_storet_huc2;

--changeset drsteini:1StoretIndexes
create bitmap index ss_storet_huc4 on station_sum_swap_storet(huc_4) parallel 4 nologging;
--rollback drop index ss_storet_huc4;

--changeset drsteini:1StoretIndexes
create bitmap index ss_storet_huc6 on station_sum_swap_storet(huc_6) parallel 4 nologging;
--rollback drop index ss_storet_huc6;

--changeset drsteini:1StoretIndexes
create bitmap index ss_storet_huc8 on station_sum_swap_storet(huc_8) parallel 4 nologging;
--rollback drop index ss_storet_huc8;

--changeset drsteini:1StoretIndexes
create bitmap index ss_storet_organization on station_sum_swap_storet(organization) parallel 4 nologging;
--rollback drop index ss_storet_organization;

--changeset drsteini:1StoretIndexes
create bitmap index ss_storet_site on station_sum_swap_storet(site_id) parallel 4 nologging;
--rollback drop index ss_storet_s_site;

--changeset drsteini:1StoretIndexes
create bitmap index ss_storet_site_type on station_sum_swap_storet(site_type) parallel 4 nologging;
--rollback drop index ss_storet_site_type;

--changeset drsteini:1StoretIndexes
create bitmap index ss_storet_state on station_sum_swap_storet(state_code) parallel 4 nologging;
--rollback drop index ss_storet_state;

--changeset drsteini:1StoretIndexes
create bitmap index ss_storet_station on station_sum_swap_storet(station_id) parallel 4 nologging;
--rollback drop index ss_storet_s_station;




--changeset drsteini:1StoretIndexes
create bitmap index pcrs_storet_analytical on pc_result_sum_swap_storet(analytical_method) local parallel 4 nologging;
--rollback drop index pcrs_storet_analytical;

--changeset drsteini:1StoretIndexes
create bitmap index pcrs_storet_char_name on pc_result_sum_swap_storet(characteristic_name) local parallel 4 nologging;
--rollback drop index pcrs_storet_char_name;

--changeset drsteini:1StoretIndexes
create bitmap index pcrs_storet_char_type on pc_result_sum_swap_storet(characteristic_type) local parallel 4 nologging;
--rollback drop index pcrs_storet_char_type;

--changeset drsteini:1StoretIndexes
create bitmap index pcrs_storet_country on pc_result_sum_swap_storet(country_code) local parallel 4 nologging;
--rollback drop index pcrs_storet_country;

--changeset drsteini:1StoretIndexes
create bitmap index pcrs_storet_county on pc_result_sum_swap_storet(county_code) local parallel 4 nologging;
--rollback drop index pcrs_storet_county;

--changeset drsteini:1StoretIndexes
create bitmap index pcrs_storet_event_date on pc_result_sum_swap_storet(event_date) local parallel 4 nologging;
--rollback drop index pcrs_storet_event_date;

--changeset drsteini:1StoretIndexes
create bitmap index pcrs_storet_huc10 on pc_result_sum_swap_storet(huc_10) local parallel 4 nologging;
--rollback drop index pcrs_storet_huc10;

--changeset drsteini:1StoretIndexes
create bitmap index pcrs_storet_huc12 on pc_result_sum_swap_storet(huc_12) local parallel 4 nologging;
--rollback drop index pcrs_storet_huc12;

--changeset drsteini:1StoretIndexes
create bitmap index pcrs_storet_huc2 on pc_result_sum_swap_storet(huc_2) local parallel 4 nologging;
--rollback drop index pcrs_storet_huc2;

--changeset drsteini:1StoretIndexes
create bitmap index pcrs_storet_huc4 on pc_result_sum_swap_storet(huc_4) local parallel 4 nologging;
--rollback drop index pcrs_storet_huc4;

--changeset drsteini:1StoretIndexes
create bitmap index pcrs_storet_huc6 on pc_result_sum_swap_storet(huc_6) local parallel 4 nologging;
--rollback drop index pcrs_storet_huc6;

--changeset drsteini:1StoretIndexes
create bitmap index pcrs_storet_huc8 on pc_result_sum_swap_storet(huc_8) local parallel 4 nologging;
--rollback drop index pcrs_storet_huc8;

--changeset drsteini:1StoretIndexes
create bitmap index pcrs_storet_organization on pc_result_sum_swap_storet(organization) local parallel 4 nologging;
--rollback drop index pcrs_storet_organization;

--changeset drsteini:1StoretIndexes
create bitmap index pcrs_storet_p_code on pc_result_sum_swap_storet(p_code) local parallel 4 nologging;
--rollback drop index pcrs_storet_p_code;

--changeset drsteini:1StoretIndexes
create bitmap index pcrs_storet_sample_media on pc_result_sum_swap_storet(sample_media) local parallel 4 nologging;
--rollback drop index pcrs_storet_sample_media;

--changeset drsteini:1StoretIndexes
create bitmap index pcrs_storet_site on pc_result_sum_swap_storet(site_id) local parallel 4 nologging;
--rollback drop index pcrs_storet_site;

--changeset drsteini:1StoretIndexes
create bitmap index pcrs_storet_site_type on pc_result_sum_swap_storet(site_type) local parallel 4 nologging;
--rollback drop index pcrs_storet_site_type;

--changeset drsteini:1StoretIndexes
create bitmap index pcrs_storet_state on pc_result_sum_swap_storet(state_code) local parallel 4 nologging;
--rollback drop index pcrs_storet_state;

--changeset drsteini:1StoretIndexes
create bitmap index pcrs_storet_station on pc_result_sum_swap_storet(station_id) local parallel 4 nologging;
--rollback drop index pcrs_storet_station;








--changeset drsteini:1StoretIndexes
create bitmap index pcrcts_storet_analytical on pc_result_ct_sum_swap_storet(analytical_method) local parallel 4 nologging;
--rollback drop index pcrcts_storet_analytical;

--changeset drsteini:1StoretIndexes
create bitmap index pcrcts_storet_char_name on pc_result_ct_sum_swap_storet(characteristic_name) local parallel 4 nologging;
--rollback drop index pcrcts_storet_char_name;

--changeset drsteini:1StoretIndexes
create bitmap index pcrcts_storet_char_type on pc_result_ct_sum_swap_storet(characteristic_type) local parallel 4 nologging;
--rollback drop index pcrcts_storet_char_type;

--changeset drsteini:1StoretIndexes
create bitmap index pcrcts_storet_country on pc_result_ct_sum_swap_storet(country_code) local parallel 4 nologging;
--rollback drop index pcrcts_storet_country;

--changeset drsteini:1StoretIndexes
create bitmap index pcrcts_storet_county on pc_result_ct_sum_swap_storet(county_code) local parallel 4 nologging;
--rollback drop index pcrcts_storet_county;

--changeset drsteini:1StoretIndexes
create bitmap index pcrcts_storet_huc10 on pc_result_ct_sum_swap_storet(huc_10) local parallel 4 nologging;
--rollback drop index pcrcts_storet_huc10;

--changeset drsteini:1StoretIndexes
create bitmap index pcrcts_storet_huc12 on pc_result_ct_sum_swap_storet(huc_12) local parallel 4 nologging;
--rollback drop index pcrcts_storet_huc12;

--changeset drsteini:1StoretIndexes
create bitmap index pcrcts_storet_huc2 on pc_result_ct_sum_swap_storet(huc_2) local parallel 4 nologging;
--rollback drop index pcrcts_storet_huc2;

--changeset drsteini:1StoretIndexes
create bitmap index pcrcts_storet_huc4 on pc_result_ct_sum_swap_storet(huc_4) local parallel 4 nologging;
--rollback drop index pcrcts_storet_huc4;

--changeset drsteini:1StoretIndexes
create bitmap index pcrcts_storet_huc6 on pc_result_ct_sum_swap_storet(huc_6) local parallel 4 nologging;
--rollback drop index pcrcts_storet_huc6;

--changeset drsteini:1StoretIndexes
create bitmap index pcrcts_storet_huc8 on pc_result_ct_sum_swap_storet(huc_8) local parallel 4 nologging;
--rollback drop index pcrcts_storet_huc8;

--changeset drsteini:1StoretIndexes
create bitmap index pcrcts_storet_organization on pc_result_ct_sum_swap_storet(organization) local parallel 4 nologging;
--rollback drop index pcrcts_storet_organization;

--changeset drsteini:1StoretIndexes
create bitmap index pcrcts_storet_p_code on pc_result_ct_sum_swap_storet(p_code) local parallel 4 nologging;
--rollback drop index pcrcts_storet_p_code;

--changeset drsteini:1StoretIndexes
create bitmap index pcrcts_storet_sample_media on pc_result_ct_sum_swap_storet(sample_media) local parallel 4 nologging;
--rollback drop index pcrcts_storet_sample_media;

--changeset drsteini:1StoretIndexes
create bitmap index pcrcts_storet_site on pc_result_ct_sum_swap_storet(site_id) local parallel 4 nologging;
--rollback drop index pcrcts_storet_site;

--changeset drsteini:1StoretIndexes
create bitmap index pcrcts_storet_site_type on pc_result_ct_sum_swap_storet(site_type) local parallel 4 nologging;
--rollback drop index pcrcts_storet_site_type;

--changeset drsteini:1StoretIndexes
create bitmap index pcrcts_storet_state on pc_result_ct_sum_swap_storet(state_code) local parallel 4 nologging;
--rollback drop index pcrcts_storet_state;

--changeset drsteini:1StoretIndexes
create bitmap index pcrcts_storet_station on pc_result_ct_sum_swap_storet(station_id) local parallel 4 nologging;
--rollback drop index pcrcts_storet_station;




--changeset drsteini:1StoretIndexes
create bitmap index pcrnrs_storet_analytical on pc_result_nr_sum_swap_storet(analytical_method) local parallel 4 nologging;
--rollback drop index pcrnrs_storet_analytical;

--changeset drsteini:1StoretIndexes
create bitmap index pcrnrs_storet_char_name on pc_result_nr_sum_swap_storet(characteristic_name) local parallel 4 nologging;
--rollback drop index pcrnrs_storet_char_name;

--changeset drsteini:1StoretIndexes
create bitmap index pcrnrs_storet_char_type on pc_result_nr_sum_swap_storet(characteristic_type) local parallel 4 nologging;
--rollback drop index pcrnrs_storet_char_type;

--changeset drsteini:1StoretIndexes
create bitmap index pcrnrs_storet_p_code on pc_result_nr_sum_swap_storet(p_code) local parallel 4 nologging;
--rollback drop index pcrnrs_storet_p_code;

--changeset drsteini:1StoretIndexes
create bitmap index pcrnrs_storet_sample_media on pc_result_nr_sum_swap_storet(sample_media) local parallel 4 nologging;
--rollback drop index pcrnrs_storet_sample_media;

--changeset drsteini:1StoretIndexes
create bitmap index pcrnrs_storet_station on pc_result_nr_sum_swap_storet(station_id) local parallel 4 nologging;
--rollback drop index pcrnrs_storet_station;




