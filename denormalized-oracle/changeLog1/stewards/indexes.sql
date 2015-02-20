--liquibase formatted sql

--This is for the wqp_core schema

--changeset drsteini:1StewardsIndexes
create bitmap index s_stewards_country on station_swap_stewards(country_code) parallel 4 nologging;
--rollback drop index s_stewards_country;

--changeset drsteini:1StewardsIndexes
create index s_stewards_county on station_swap_stewards(county_code) parallel 4 nologging;
--rollback drop index s_stewards_county;

--changeset drsteini:1StewardsIndexes
insert into user_sdo_geom_metadata
values ('STATION_SWAP_stewards', 'GEOM',
        mdsys.sdo_dim_array( mdsys.sdo_dim_element('X', -180, 180, 0.005), mdsys.sdo_dim_element('Y', -90, 90, 0.005)), 8265);
--rollback delete from user_sdo_geom_metadata where table_name = 'STATION_SWAP_stewards';

--changeset drsteini:1StewardsIndexes
create index s_stewards_geom on station_swap_stewards(geom) indextype is mdsys.spatial_index parameters ('SDO_INDX_DIMS=2 LAYER_GTYPE="POINT"');
--rollback drop index s_stewards_geom;

--changeset drsteini:1StewardsIndexes
create bitmap index s_stewards_huc10 on station_swap_stewards(huc_10) parallel 4 nologging;
--rollback drop index s_stewards_huc10;

--changeset drsteini:1StewardsIndexes
create bitmap index s_stewards_huc12 on station_swap_stewards(huc_12) parallel 4 nologging;
--rollback drop index s_stewards_huc12;

--changeset drsteini:1StewardsIndexes
create bitmap index s_stewards_huc2 on station_swap_stewards(huc_2) parallel 4 nologging;
--rollback drop index s_stewards_huc2;

--changeset drsteini:1StewardsIndexes
create bitmap index s_stewards_huc4 on station_swap_stewards(huc_4) parallel 4 nologging;
--rollback drop index s_stewards_huc4;

--changeset drsteini:1StewardsIndexes
create bitmap index s_stewards_huc6 on station_swap_stewards(huc_6) parallel 4 nologging;
--rollback drop index s_stewards_huc6;

--changeset drsteini:1StewardsIndexes
create bitmap index s_stewards_huc8 on station_swap_stewards(huc_8) parallel 4 nologging;
--rollback drop index s_stewards_huc8;

--changeset drsteini:1StewardsIndexes
create bitmap index s_stewards_organization on station_swap_stewards(organization) parallel 4 nologging;
--rollback drop index s_stewards_organization;

--changeset drsteini:1StewardsIndexes
create bitmap index s_stewards_site on station_swap_stewards(site_id) parallel 4 nologging;
--rollback drop index s_stewards_site;

--changeset drsteini:1StewardsIndexes
create bitmap index s_stewards_site_type on station_swap_stewards(site_type) parallel 4 nologging;
--rollback drop index s_stewards_site_type;

--changeset drsteini:1StewardsIndexes
create index s_stewards_state on station_swap_stewards(state_code) parallel 4 nologging;
--rollback drop index s_stewards_state;

--changeset drsteini:1StewardsIndexes
create bitmap index s_stewards_station on station_swap_stewards(station_id) parallel 4 nologging;
--rollback drop index s_stewards_station;






--changeset drsteini:1StewardsIndexes
create bitmap index pcr_stewards_activity on pc_result_swap_stewards(activity) local parallel 4 nologging;
--rollback drop index pcr_stewards_activity;

--changeset drsteini:1StewardsIndexes
create bitmap index pcr_stewards_analytical on pc_result_swap_stewards(analytical_method) local parallel 4 nologging;
--rollback drop index pcr_stewards_analyticalod;

--changeset drsteini:1StewardsIndexes
create bitmap index pcr_stewards_char_name on pc_result_swap_stewards(characteristic_name) local parallel 4 nologging;
--rollback drop index pcr_stewards_char_name;

--changeset drsteini:1StewardsIndexes
create bitmap index pcr_stewards_char_type on pc_result_swap_stewards(characteristic_type) local parallel 4 nologging;
--rollback drop index pcr_stewards_char_type;

--changeset drsteini:1StewardsIndexes
create bitmap index pcr_stewards_country on pc_result_swap_stewards(country_code) local parallel 4 nologging;
--rollback drop index pcr_stewards_country;

--changeset drsteini:1StewardsIndexes
create bitmap index pcr_stewards_county on pc_result_swap_stewards(county_code) local parallel 4 nologging;
--rollback drop index pcr_stewards_county;

--changeset drsteini:1StewardsIndexes
create bitmap index pcr_stewards_event_date on pc_result_swap_stewards(event_date) local parallel 4 nologging;
--rollback drop index pcr_stewards_event_date;

--changeset drsteini:1StewardsIndexes
create bitmap index pcr_stewards_huc10 on pc_result_swap_stewards(huc_10) local parallel 4 nologging;
--rollback drop index pcr_stewards_huc10;

--changeset drsteini:1StewardsIndexes
create bitmap index pcr_stewards_huc12 on pc_result_swap_stewards(huc_12) local parallel 4 nologging;
--rollback drop index pcr_stewards_huc12;

--changeset drsteini:1StewardsIndexes
create bitmap index pcr_stewards_huc2 on pc_result_swap_stewards(huc_2) local parallel 4 nologging;
--rollback drop index pcr_stewards_huc2;

--changeset drsteini:1StewardsIndexes
create bitmap index pcr_stewards_huc4 on pc_result_swap_stewards(huc_4) local parallel 4 nologging;
--rollback drop index pcr_stewards_huc4;

--changeset drsteini:1StewardsIndexes
create bitmap index pcr_stewards_huc6 on pc_result_swap_stewards(huc_6) local parallel 4 nologging;
--rollback drop index pcr_stewards_huc6;

--changeset drsteini:1StewardsIndexes
create bitmap index pcr_stewards_huc8 on pc_result_swap_stewards(huc_8) local parallel 4 nologging;
--rollback drop index pcr_stewards_huc8;

--changeset drsteini:1StewardsIndexes
create bitmap index pcr_stewards_organization on pc_result_swap_stewards(organization) local parallel 4 nologging;
--rollback drop index pcr_stewards_organization;

--changeset drsteini:1StewardsIndexes
create bitmap index pcr_stewards_p_code on pc_result_swap_stewards(p_code) local parallel 4 nologging;
--rollback drop index pcr_stewards_p_code;

--changeset drsteini:1StewardsIndexes
create bitmap index pcr_stewards_sample_media on pc_result_swap_stewards(sample_media) local parallel 4 nologging;
--rollback drop index pcr_stewards_sample_media;

--changeset drsteini:1StewardsIndexes
create bitmap index pcr_stewards_site on pc_result_swap_stewards(site_id) local parallel 4 nologging;
--rollback drop index pcr_stewards_site;

--changeset drsteini:1StewardsIndexes
create bitmap index pcr_stewards_site_type on pc_result_swap_stewards(site_type) local parallel 4 nologging;
--rollback drop index pcr_stewards_site_type;

--changeset drsteini:1StewardsIndexes
create bitmap index pcr_stewards_state on pc_result_swap_stewards(state_code) local parallel 4 nologging;
--rollback drop index pcr_stewards_state;

--changeset drsteini:1StewardsIndexes
create bitmap index pcr_stewards_station on pc_result_swap_stewards(station_id) local parallel 4 nologging;
--rollback drop index pcr_stewards_station;







--changeset drsteini:1StewardsIndexes
create bitmap index ss_stewards_county on station_sum_swap_stewards(county_code) parallel 4 nologging;
--rollback drop index ss_stewards_county;

--changeset drsteini:1StewardsIndexes
insert into user_sdo_geom_metadata
values ('STATION_SUM_SWAP_stewards', 'GEOM',
        mdsys.sdo_dim_array( mdsys.sdo_dim_element('X', -180, 180, 0.005), mdsys.sdo_dim_element('Y', -90, 90, 0.005)), 8265);
--rollback delete from user_sdo_geom_metadata where table_name = 'STATION_SUM_SWAP_stewards';

--changeset drsteini:1StewardsIndexes
create index ss_stewards_geom on station_sum_swap_stewards(geom) indextype is mdsys.spatial_index parameters ('SDO_INDX_DIMS=2 LAYER_GTYPE="POINT"');
--rollback drop index ss_stewards_geom;

--changeset drsteini:1StewardsIndexes
create bitmap index ss_stewards_huc10 on station_sum_swap_stewards(huc_10) parallel 4 nologging;
--rollback drop index ss_stewards_huc10;

--changeset drsteini:1StewardsIndexes
create bitmap index ss_stewards_huc12 on station_sum_swap_stewards(huc_12) parallel 4 nologging;
--rollback drop index ss_stewards_huc12;

--changeset drsteini:1StewardsIndexes
create bitmap index ss_stewards_huc2 on station_sum_swap_stewards(huc_2) parallel 4 nologging;
--rollback drop index ss_stewards_huc2;

--changeset drsteini:1StewardsIndexes
create bitmap index ss_stewards_huc4 on station_sum_swap_stewards(huc_4) parallel 4 nologging;
--rollback drop index ss_stewards_huc4;

--changeset drsteini:1StewardsIndexes
create bitmap index ss_stewards_huc6 on station_sum_swap_stewards(huc_6) parallel 4 nologging;
--rollback drop index ss_stewards_huc6;

--changeset drsteini:1StewardsIndexes
create bitmap index ss_stewards_huc8 on station_sum_swap_stewards(huc_8) parallel 4 nologging;
--rollback drop index ss_stewards_huc8;

--changeset drsteini:1StewardsIndexes
create bitmap index ss_stewards_organization on station_sum_swap_stewards(organization) parallel 4 nologging;
--rollback drop index ss_stewards_organization;

--changeset drsteini:1StewardsIndexes
create bitmap index ss_stewards_site on station_sum_swap_stewards(site_id) parallel 4 nologging;
--rollback drop index ss_stewards_s_site;

--changeset drsteini:1StewardsIndexes
create bitmap index ss_stewards_site_type on station_sum_swap_stewards(site_type) parallel 4 nologging;
--rollback drop index ss_stewards_site_type;

--changeset drsteini:1StewardsIndexes
create bitmap index ss_stewards_state on station_sum_swap_stewards(state_code) parallel 4 nologging;
--rollback drop index ss_stewards_state;

--changeset drsteini:1StewardsIndexes
create bitmap index ss_stewards_station on station_sum_swap_stewards(station_id) parallel 4 nologging;
--rollback drop index ss_stewards_s_station;




--changeset drsteini:1StewardsIndexes
create bitmap index pcrs_stewards_analytical on pc_result_sum_swap_stewards(analytical_method) local parallel 4 nologging;
--rollback drop index pcrs_stewards_analytical;

--changeset drsteini:1StewardsIndexes
create bitmap index pcrs_stewards_char_name on pc_result_sum_swap_stewards(characteristic_name) local parallel 4 nologging;
--rollback drop index pcrs_stewards_char_name;

--changeset drsteini:1StewardsIndexes
create bitmap index pcrs_stewards_char_type on pc_result_sum_swap_stewards(characteristic_type) local parallel 4 nologging;
--rollback drop index pcrs_stewards_char_type;

--changeset drsteini:1StewardsIndexes
create bitmap index pcrs_stewards_country on pc_result_sum_swap_stewards(country_code) local parallel 4 nologging;
--rollback drop index pcrs_stewards_country;

--changeset drsteini:1StewardsIndexes
create bitmap index pcrs_stewards_county on pc_result_sum_swap_stewards(county_code) local parallel 4 nologging;
--rollback drop index pcrs_stewards_county;

--changeset drsteini:1StewardsIndexes
create bitmap index pcrs_stewards_event_date on pc_result_sum_swap_stewards(event_date) local parallel 4 nologging;
--rollback drop index pcrs_stewards_event_date;

--changeset drsteini:1StewardsIndexes
create bitmap index pcrs_stewards_huc10 on pc_result_sum_swap_stewards(huc_10) local parallel 4 nologging;
--rollback drop index pcrs_stewards_huc10;

--changeset drsteini:1StewardsIndexes
create bitmap index pcrs_stewards_huc12 on pc_result_sum_swap_stewards(huc_12) local parallel 4 nologging;
--rollback drop index pcrs_stewards_huc12;

--changeset drsteini:1StewardsIndexes
create bitmap index pcrs_stewards_huc2 on pc_result_sum_swap_stewards(huc_2) local parallel 4 nologging;
--rollback drop index pcrs_stewards_huc2;

--changeset drsteini:1StewardsIndexes
create bitmap index pcrs_stewards_huc4 on pc_result_sum_swap_stewards(huc_4) local parallel 4 nologging;
--rollback drop index pcrs_stewards_huc4;

--changeset drsteini:1StewardsIndexes
create bitmap index pcrs_stewards_huc6 on pc_result_sum_swap_stewards(huc_6) local parallel 4 nologging;
--rollback drop index pcrs_stewards_huc6;

--changeset drsteini:1StewardsIndexes
create bitmap index pcrs_stewards_huc8 on pc_result_sum_swap_stewards(huc_8) local parallel 4 nologging;
--rollback drop index pcrs_stewards_huc8;

--changeset drsteini:1StewardsIndexes
create bitmap index pcrs_stewards_organization on pc_result_sum_swap_stewards(organization) local parallel 4 nologging;
--rollback drop index pcrs_stewards_organization;

--changeset drsteini:1StewardsIndexes
create bitmap index pcrs_stewards_p_code on pc_result_sum_swap_stewards(p_code) local parallel 4 nologging;
--rollback drop index pcrs_stewards_p_code;

--changeset drsteini:1StewardsIndexes
create bitmap index pcrs_stewards_sample_media on pc_result_sum_swap_stewards(sample_media) local parallel 4 nologging;
--rollback drop index pcrs_stewards_sample_media;

--changeset drsteini:1StewardsIndexes
create bitmap index pcrs_stewards_site on pc_result_sum_swap_stewards(site_id) local parallel 4 nologging;
--rollback drop index pcrs_stewards_site;

--changeset drsteini:1StewardsIndexes
create bitmap index pcrs_stewards_site_type on pc_result_sum_swap_stewards(site_type) local parallel 4 nologging;
--rollback drop index pcrs_stewards_site_type;

--changeset drsteini:1StewardsIndexes
create bitmap index pcrs_stewards_state on pc_result_sum_swap_stewards(state_code) local parallel 4 nologging;
--rollback drop index pcrs_stewards_state;

--changeset drsteini:1StewardsIndexes
create bitmap index pcrs_stewards_station on pc_result_sum_swap_stewards(station_id) local parallel 4 nologging;
--rollback drop index pcrs_stewards_station;








--changeset drsteini:1StewardsIndexes
create bitmap index pcrcts_stewards_analytical on pc_result_ct_sum_swap_stewards(analytical_method) local parallel 4 nologging;
--rollback drop index pcrcts_stewards_analytical;

--changeset drsteini:1StewardsIndexes
create bitmap index pcrcts_stewards_char_name on pc_result_ct_sum_swap_stewards(characteristic_name) local parallel 4 nologging;
--rollback drop index pcrcts_stewards_char_name;

--changeset drsteini:1StewardsIndexes
create bitmap index pcrcts_stewards_char_type on pc_result_ct_sum_swap_stewards(characteristic_type) local parallel 4 nologging;
--rollback drop index pcrcts_stewards_char_type;

--changeset drsteini:1StewardsIndexes
create bitmap index pcrcts_stewards_country on pc_result_ct_sum_swap_stewards(country_code) local parallel 4 nologging;
--rollback drop index pcrcts_stewards_country;

--changeset drsteini:1StewardsIndexes
create bitmap index pcrcts_stewards_county on pc_result_ct_sum_swap_stewards(county_code) local parallel 4 nologging;
--rollback drop index pcrcts_stewards_county;

--changeset drsteini:1StewardsIndexes
create bitmap index pcrcts_stewards_huc10 on pc_result_ct_sum_swap_stewards(huc_10) local parallel 4 nologging;
--rollback drop index pcrcts_stewards_huc10;

--changeset drsteini:1StewardsIndexes
create bitmap index pcrcts_stewards_huc12 on pc_result_ct_sum_swap_stewards(huc_12) local parallel 4 nologging;
--rollback drop index pcrcts_stewards_huc12;

--changeset drsteini:1StewardsIndexes
create bitmap index pcrcts_stewards_huc2 on pc_result_ct_sum_swap_stewards(huc_2) local parallel 4 nologging;
--rollback drop index pcrcts_stewards_huc2;

--changeset drsteini:1StewardsIndexes
create bitmap index pcrcts_stewards_huc4 on pc_result_ct_sum_swap_stewards(huc_4) local parallel 4 nologging;
--rollback drop index pcrcts_stewards_huc4;

--changeset drsteini:1StewardsIndexes
create bitmap index pcrcts_stewards_huc6 on pc_result_ct_sum_swap_stewards(huc_6) local parallel 4 nologging;
--rollback drop index pcrcts_stewards_huc6;

--changeset drsteini:1StewardsIndexes
create bitmap index pcrcts_stewards_huc8 on pc_result_ct_sum_swap_stewards(huc_8) local parallel 4 nologging;
--rollback drop index pcrcts_stewards_huc8;

--changeset drsteini:1StewardsIndexes
create bitmap index pcrcts_stewards_organization on pc_result_ct_sum_swap_stewards(organization) local parallel 4 nologging;
--rollback drop index pcrcts_stewards_organization;

--changeset drsteini:1StewardsIndexes
create bitmap index pcrcts_stewards_p_code on pc_result_ct_sum_swap_stewards(p_code) local parallel 4 nologging;
--rollback drop index pcrcts_stewards_p_code;

--changeset drsteini:1StewardsIndexes
create bitmap index pcrcts_stewards_sample_media on pc_result_ct_sum_swap_stewards(sample_media) local parallel 4 nologging;
--rollback drop index pcrcts_stewards_sample_media;

--changeset drsteini:1StewardsIndexes
create bitmap index pcrcts_stewards_site on pc_result_ct_sum_swap_stewards(site_id) local parallel 4 nologging;
--rollback drop index pcrcts_stewards_site;

--changeset drsteini:1StewardsIndexes
create bitmap index pcrcts_stewards_site_type on pc_result_ct_sum_swap_stewards(site_type) local parallel 4 nologging;
--rollback drop index pcrcts_stewards_site_type;

--changeset drsteini:1StewardsIndexes
create bitmap index pcrcts_stewards_state on pc_result_ct_sum_swap_stewards(state_code) local parallel 4 nologging;
--rollback drop index pcrcts_stewards_state;

--changeset drsteini:1StewardsIndexes
create bitmap index pcrcts_stewards_station on pc_result_ct_sum_swap_stewards(station_id) local parallel 4 nologging;
--rollback drop index pcrcts_stewards_station;




--changeset drsteini:1StewardsIndexes
create bitmap index pcrnrs_stewards_analytical on pc_result_nr_sum_swap_stewards(analytical_method) local parallel 4 nologging;
--rollback drop index pcrnrs_stewards_analytical;

--changeset drsteini:1StewardsIndexes
create bitmap index pcrnrs_stewards_char_name on pc_result_nr_sum_swap_stewards(characteristic_name) local parallel 4 nologging;
--rollback drop index pcrnrs_stewards_char_name;

--changeset drsteini:1StewardsIndexes
create bitmap index pcrnrs_stewards_char_type on pc_result_nr_sum_swap_stewards(characteristic_type) local parallel 4 nologging;
--rollback drop index pcrnrs_stewards_char_type;

--changeset drsteini:1StewardsIndexes
create bitmap index pcrnrs_stewards_p_code on pc_result_nr_sum_swap_stewards(p_code) local parallel 4 nologging;
--rollback drop index pcrnrs_stewards_p_code;

--changeset drsteini:1StewardsIndexes
create bitmap index pcrnrs_stewards_sample_media on pc_result_nr_sum_swap_stewards(sample_media) local parallel 4 nologging;
--rollback drop index pcrnrs_stewards_sample_media;

--changeset drsteini:1StewardsIndexes
create bitmap index pcrnrs_stewards_station on pc_result_nr_sum_swap_stewards(station_id) local parallel 4 nologging;
--rollback drop index pcrnrs_stewards_station;




