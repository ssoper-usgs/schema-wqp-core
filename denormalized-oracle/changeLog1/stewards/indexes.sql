--liquibase formatted sql

--This is for the wqp_core schema

--changeset drsteini:1StewardsIndexesAA
create bitmap index s_stewards_country on station_swap_stewards(country_code) parallel 4 nologging;
--rollback drop index s_stewards_country;

--changeset drsteini:1StewardsIndexesAB
create bitmap index s_stewards_county on station_swap_stewards(county_code) parallel 4 nologging;
--rollback drop index s_stewards_county;

--changeset drsteini:1StewardsIndexesAC
insert into user_sdo_geom_metadata
values ('STATION_SWAP_STEWARDS', 'GEOM',
        mdsys.sdo_dim_array( mdsys.sdo_dim_element('X', -180, 180, 0.005), mdsys.sdo_dim_element('Y', -90, 90, 0.005)), 4269);
--rollback delete from user_sdo_geom_metadata where table_name = 'STATION_SWAP_STEWARDS';

--changeset drsteini:1StewardsIndexesAD
create index s_stewards_geom on station_swap_stewards(geom) indextype is mdsys.spatial_index parameters ('SDO_INDX_DIMS=2 LAYER_GTYPE="POINT"');
--rollback drop index s_stewards_geom;

--changeset drsteini:1StewardsIndexesAE
create bitmap index s_stewards_huc10 on station_swap_stewards(huc_10) parallel 4 nologging;
--rollback drop index s_stewards_huc10;

--changeset drsteini:1StewardsIndexesAF
create bitmap index s_stewards_huc12 on station_swap_stewards(huc_12) parallel 4 nologging;
--rollback drop index s_stewards_huc12;

--changeset drsteini:1StewardsIndexesAG
create bitmap index s_stewards_huc2 on station_swap_stewards(huc_2) parallel 4 nologging;
--rollback drop index s_stewards_huc2;

--changeset drsteini:1StewardsIndexesAH
create bitmap index s_stewards_huc4 on station_swap_stewards(huc_4) parallel 4 nologging;
--rollback drop index s_stewards_huc4;

--changeset drsteini:1StewardsIndexesAI
create bitmap index s_stewards_huc6 on station_swap_stewards(huc_6) parallel 4 nologging;
--rollback drop index s_stewards_huc6;

--changeset drsteini:1StewardsIndexesAJ
create bitmap index s_stewards_huc8 on station_swap_stewards(huc_8) parallel 4 nologging;
--rollback drop index s_stewards_huc8;

--changeset drsteini:1StewardsIndexesAK
create bitmap index s_stewards_organization on station_swap_stewards(organization) parallel 4 nologging;
--rollback drop index s_stewards_organization;

--changeset drsteini:1StewardsIndexesAL
create bitmap index s_stewards_site on station_swap_stewards(site_id) parallel 4 nologging;
--rollback drop index s_stewards_site;

--changeset drsteini:1StewardsIndexesAM
create bitmap index s_stewards_site_type on station_swap_stewards(site_type) parallel 4 nologging;
--rollback drop index s_stewards_site_type;

--changeset drsteini:1StewardsIndexesAN
create bitmap index s_stewards_state on station_swap_stewards(state_code) parallel 4 nologging;
--rollback drop index s_stewards_state;

--changeset drsteini:1StewardsIndexesAO
create bitmap index s_stewards_station on station_swap_stewards(station_id) parallel 4 nologging;
--rollback drop index s_stewards_station;




--changeset drsteini:1StewardsIndexesAP
create bitmap index pcr_stewards_activity on pc_result_swap_stewards(activity) local parallel 4 nologging;
--rollback drop index pcr_stewards_activity;

--changeset drsteini:1StewardsIndexesAQ
create bitmap index pcr_stewards_analytical on pc_result_swap_stewards(analytical_method) local parallel 4 nologging;
--rollback drop index pcr_stewards_analytical;

--changeset drsteini:1StewardsIndexesAR
create bitmap index pcr_stewards_char_name on pc_result_swap_stewards(characteristic_name) local parallel 4 nologging;
--rollback drop index pcr_stewards_char_name;

--changeset drsteini:1StewardsIndexesAS
create bitmap index pcr_stewards_char_type on pc_result_swap_stewards(characteristic_type) local parallel 4 nologging;
--rollback drop index pcr_stewards_char_type;

--changeset drsteini:1StewardsIndexesAT
create bitmap index pcr_stewards_country on pc_result_swap_stewards(country_code) local parallel 4 nologging;
--rollback drop index pcr_stewards_country;

--changeset drsteini:1StewardsIndexesAU
create bitmap index pcr_stewards_county on pc_result_swap_stewards(county_code) local parallel 4 nologging;
--rollback drop index pcr_stewards_county;

--changeset drsteini:1StewardsIndexesAV
create bitmap index pcr_stewards_event_date on pc_result_swap_stewards(event_date) local parallel 4 nologging;
--rollback drop index pcr_stewards_event_date;

--changeset drsteini:1StewardsIndexesAW
create bitmap index pcr_stewards_huc10 on pc_result_swap_stewards(huc_10) local parallel 4 nologging;
--rollback drop index pcr_stewards_huc10;

--changeset drsteini:1StewardsIndexesAX
create bitmap index pcr_stewards_huc12 on pc_result_swap_stewards(huc_12) local parallel 4 nologging;
--rollback drop index pcr_stewards_huc12;

--changeset drsteini:1StewardsIndexesAY
create bitmap index pcr_stewards_huc2 on pc_result_swap_stewards(huc_2) local parallel 4 nologging;
--rollback drop index pcr_stewards_huc2;

--changeset drsteini:1StewardsIndexesAZ
create bitmap index pcr_stewards_huc4 on pc_result_swap_stewards(huc_4) local parallel 4 nologging;
--rollback drop index pcr_stewards_huc4;

--changeset drsteini:1StewardsIndexesBA
create bitmap index pcr_stewards_huc6 on pc_result_swap_stewards(huc_6) local parallel 4 nologging;
--rollback drop index pcr_stewards_huc6;

--changeset drsteini:1StewardsIndexesBB
create bitmap index pcr_stewards_huc8 on pc_result_swap_stewards(huc_8) local parallel 4 nologging;
--rollback drop index pcr_stewards_huc8;

--changeset drsteini:1StewardsIndexesBC
create bitmap index pcr_stewards_organization on pc_result_swap_stewards(organization) local parallel 4 nologging;
--rollback drop index pcr_stewards_organization;

--changeset drsteini:1StewardsIndexesBD
create bitmap index pcr_stewards_p_code on pc_result_swap_stewards(p_code) local parallel 4 nologging;
--rollback drop index pcr_stewards_p_code;

--changeset drsteini:1StewardsIndexesBE
create bitmap index pcr_stewards_sample_media on pc_result_swap_stewards(sample_media) local parallel 4 nologging;
--rollback drop index pcr_stewards_sample_media;

--changeset drsteini:1StewardsIndexesBF
create bitmap index pcr_stewards_site on pc_result_swap_stewards(site_id) local parallel 4 nologging;
--rollback drop index pcr_stewards_site;

--changeset drsteini:1StewardsIndexesBG
create bitmap index pcr_stewards_site_type on pc_result_swap_stewards(site_type) local parallel 4 nologging;
--rollback drop index pcr_stewards_site_type;

--changeset drsteini:1StewardsIndexesBH
create bitmap index pcr_stewards_state on pc_result_swap_stewards(state_code) local parallel 4 nologging;
--rollback drop index pcr_stewards_state;

--changeset drsteini:1StewardsIndexesBI
create bitmap index pcr_stewards_station on pc_result_swap_stewards(station_id) local parallel 4 nologging;
--rollback drop index pcr_stewards_station;



--changeset drsteini:1StewardsIndexesBJ
create bitmap index ss_stewards_county on station_sum_swap_stewards(county_code) parallel 4 nologging;
--rollback drop index ss_stewards_county;

--changeset drsteini:1StewardsIndexesBK
insert into user_sdo_geom_metadata
values ('STATION_SUM_SWAP_STEWARDS', 'GEOM',
        mdsys.sdo_dim_array( mdsys.sdo_dim_element('X', -180, 180, 0.005), mdsys.sdo_dim_element('Y', -90, 90, 0.005)), 4269);
--rollback delete from user_sdo_geom_metadata where table_name = 'STATION_SUM_SWAP_STEWARDS';

--changeset drsteini:1StewardsIndexesBL
create index ss_stewards_geom on station_sum_swap_stewards(geom) indextype is mdsys.spatial_index parameters ('SDO_INDX_DIMS=2 LAYER_GTYPE="POINT"');
--rollback drop index ss_stewards_geom;

--changeset drsteini:1StewardsIndexesBM
create bitmap index ss_stewards_huc10 on station_sum_swap_stewards(huc_10) parallel 4 nologging;
--rollback drop index ss_stewards_huc10;

--changeset drsteini:1StewardsIndexesBN
create bitmap index ss_stewards_huc12 on station_sum_swap_stewards(huc_12) parallel 4 nologging;
--rollback drop index ss_stewards_huc12;

--changeset drsteini:1StewardsIndexesBO
create bitmap index ss_stewards_huc2 on station_sum_swap_stewards(huc_2) parallel 4 nologging;
--rollback drop index ss_stewards_huc2;

--changeset drsteini:1StewardsIndexesBP
create bitmap index ss_stewards_huc4 on station_sum_swap_stewards(huc_4) parallel 4 nologging;
--rollback drop index ss_stewards_huc4;

--changeset drsteini:1StewardsIndexesBQ
create bitmap index ss_stewards_huc6 on station_sum_swap_stewards(huc_6) parallel 4 nologging;
--rollback drop index ss_stewards_huc6;

--changeset drsteini:1StewardsIndexesBR
create bitmap index ss_stewards_huc8 on station_sum_swap_stewards(huc_8) parallel 4 nologging;
--rollback drop index ss_stewards_huc8;

--changeset drsteini:1StewardsIndexesBS
create bitmap index ss_stewards_organization on station_sum_swap_stewards(organization) parallel 4 nologging;
--rollback drop index ss_stewards_organization;

--changeset drsteini:1StewardsIndexesBT
create bitmap index ss_stewards_site on station_sum_swap_stewards(site_id) parallel 4 nologging;
--rollback drop index ss_stewards_site;

--changeset drsteini:1StewardsIndexesBU
create bitmap index ss_stewards_site_type on station_sum_swap_stewards(site_type) parallel 4 nologging;
--rollback drop index ss_stewards_site_type;

--changeset drsteini:1StewardsIndexesBV
create bitmap index ss_stewards_state on station_sum_swap_stewards(state_code) parallel 4 nologging;
--rollback drop index ss_stewards_state;

--changeset drsteini:1StewardsIndexesBW
create bitmap index ss_stewards_station on station_sum_swap_stewards(station_id) parallel 4 nologging;
--rollback drop index ss_stewards_station;




--changeset drsteini:1StewardsIndexesBX
create bitmap index pcrs_stewards_analytical on pc_result_sum_swap_stewards(analytical_method) local parallel 4 nologging;
--rollback drop index pcrs_stewards_analytical;

--changeset drsteini:1StewardsIndexesBY
create bitmap index pcrs_stewards_char_name on pc_result_sum_swap_stewards(characteristic_name) local parallel 4 nologging;
--rollback drop index pcrs_stewards_char_name;

--changeset drsteini:1StewardsIndexesBZ
create bitmap index pcrs_stewards_char_type on pc_result_sum_swap_stewards(characteristic_type) local parallel 4 nologging;
--rollback drop index pcrs_stewards_char_type;

--changeset drsteini:1StewardsIndexesCA
create bitmap index pcrs_stewards_country on pc_result_sum_swap_stewards(country_code) local parallel 4 nologging;
--rollback drop index pcrs_stewards_country;

--changeset drsteini:1StewardsIndexesCB
create bitmap index pcrs_stewards_county on pc_result_sum_swap_stewards(county_code) local parallel 4 nologging;
--rollback drop index pcrs_stewards_county;

--changeset drsteini:1StewardsIndexesCC
create bitmap index pcrs_stewards_event_date on pc_result_sum_swap_stewards(event_date) local parallel 4 nologging;
--rollback drop index pcrs_stewards_event_date;

--changeset drsteini:1StewardsIndexesCD
create bitmap index pcrs_stewards_huc10 on pc_result_sum_swap_stewards(huc_10) local parallel 4 nologging;
--rollback drop index pcrs_stewards_huc10;

--changeset drsteini:1StewardsIndexesCE
create bitmap index pcrs_stewards_huc12 on pc_result_sum_swap_stewards(huc_12) local parallel 4 nologging;
--rollback drop index pcrs_stewards_huc12;

--changeset drsteini:1StewardsIndexesCF
create bitmap index pcrs_stewards_huc2 on pc_result_sum_swap_stewards(huc_2) local parallel 4 nologging;
--rollback drop index pcrs_stewards_huc2;

--changeset drsteini:1StewardsIndexesCG
create bitmap index pcrs_stewards_huc4 on pc_result_sum_swap_stewards(huc_4) local parallel 4 nologging;
--rollback drop index pcrs_stewards_huc4;

--changeset drsteini:1StewardsIndexesCH
create bitmap index pcrs_stewards_huc6 on pc_result_sum_swap_stewards(huc_6) local parallel 4 nologging;
--rollback drop index pcrs_stewards_huc6;

--changeset drsteini:1StewardsIndexesCI
create bitmap index pcrs_stewards_huc8 on pc_result_sum_swap_stewards(huc_8) local parallel 4 nologging;
--rollback drop index pcrs_stewards_huc8;

--changeset drsteini:1StewardsIndexesCJ
create bitmap index pcrs_stewards_organization on pc_result_sum_swap_stewards(organization) local parallel 4 nologging;
--rollback drop index pcrs_stewards_organization;

--changeset drsteini:1StewardsIndexesCK
create bitmap index pcrs_stewards_p_code on pc_result_sum_swap_stewards(p_code) local parallel 4 nologging;
--rollback drop index pcrs_stewards_p_code;

--changeset drsteini:1StewardsIndexesCL
create bitmap index pcrs_stewards_sample_media on pc_result_sum_swap_stewards(sample_media) local parallel 4 nologging;
--rollback drop index pcrs_stewards_sample_media;

--changeset drsteini:1StewardsIndexesCM
create bitmap index pcrs_stewards_site on pc_result_sum_swap_stewards(site_id) local parallel 4 nologging;
--rollback drop index pcrs_stewards_site;

--changeset drsteini:1StewardsIndexesCN
create bitmap index pcrs_stewards_site_type on pc_result_sum_swap_stewards(site_type) local parallel 4 nologging;
--rollback drop index pcrs_stewards_site_type;

--changeset drsteini:1StewardsIndexesCO
create bitmap index pcrs_stewards_state on pc_result_sum_swap_stewards(state_code) local parallel 4 nologging;
--rollback drop index pcrs_stewards_state;

--changeset drsteini:1StewardsIndexesCP
create bitmap index pcrs_stewards_station on pc_result_sum_swap_stewards(station_id) local parallel 4 nologging;
--rollback drop index pcrs_stewards_station;




--changeset drsteini:1StewardsIndexesCQ
create bitmap index pcrcts_stewards_analytical on pc_result_ct_sum_swap_stewards(analytical_method) local parallel 4 nologging;
--rollback drop index pcrcts_stewards_analytical;

--changeset drsteini:1StewardsIndexesCR
create bitmap index pcrcts_stewards_char_name on pc_result_ct_sum_swap_stewards(characteristic_name) local parallel 4 nologging;
--rollback drop index pcrcts_stewards_char_name;

--changeset drsteini:1StewardsIndexesCS
create bitmap index pcrcts_stewards_char_type on pc_result_ct_sum_swap_stewards(characteristic_type) local parallel 4 nologging;
--rollback drop index pcrcts_stewards_char_type;

--changeset drsteini:1StewardsIndexesCT
create bitmap index pcrcts_stewards_country on pc_result_ct_sum_swap_stewards(country_code) local parallel 4 nologging;
--rollback drop index pcrcts_stewards_country;

--changeset drsteini:1StewardsIndexesCU
create bitmap index pcrcts_stewards_county on pc_result_ct_sum_swap_stewards(county_code) local parallel 4 nologging;
--rollback drop index pcrcts_stewards_county;

--changeset drsteini:1StewardsIndexesCV
create bitmap index pcrcts_stewards_huc10 on pc_result_ct_sum_swap_stewards(huc_10) local parallel 4 nologging;
--rollback drop index pcrcts_stewards_huc10;

--changeset drsteini:1StewardsIndexesCW
create bitmap index pcrcts_stewards_huc12 on pc_result_ct_sum_swap_stewards(huc_12) local parallel 4 nologging;
--rollback drop index pcrcts_stewards_huc12;

--changeset drsteini:1StewardsIndexesCX
create bitmap index pcrcts_stewards_huc2 on pc_result_ct_sum_swap_stewards(huc_2) local parallel 4 nologging;
--rollback drop index pcrcts_stewards_huc2;

--changeset drsteini:1StewardsIndexesCY
create bitmap index pcrcts_stewards_huc4 on pc_result_ct_sum_swap_stewards(huc_4) local parallel 4 nologging;
--rollback drop index pcrcts_stewards_huc4;

--changeset drsteini:1StewardsIndexesCZ
create bitmap index pcrcts_stewards_huc6 on pc_result_ct_sum_swap_stewards(huc_6) local parallel 4 nologging;
--rollback drop index pcrcts_stewards_huc6;

--changeset drsteini:1StewardsIndexesDA
create bitmap index pcrcts_stewards_huc8 on pc_result_ct_sum_swap_stewards(huc_8) local parallel 4 nologging;
--rollback drop index pcrcts_stewards_huc8;

--changeset drsteini:1StewardsIndexesDB
create bitmap index pcrcts_stewards_organization on pc_result_ct_sum_swap_stewards(organization) local parallel 4 nologging;
--rollback drop index pcrcts_stewards_organization;

--changeset drsteini:1StewardsIndexesDC
create bitmap index pcrcts_stewards_p_code on pc_result_ct_sum_swap_stewards(p_code) local parallel 4 nologging;
--rollback drop index pcrcts_stewards_p_code;

--changeset drsteini:1StewardsIndexesDD
create bitmap index pcrcts_stewards_sample_media on pc_result_ct_sum_swap_stewards(sample_media) local parallel 4 nologging;
--rollback drop index pcrcts_stewards_sample_media;

--changeset drsteini:1StewardsIndexesDE
create bitmap index pcrcts_stewards_site on pc_result_ct_sum_swap_stewards(site_id) local parallel 4 nologging;
--rollback drop index pcrcts_stewards_site;

--changeset drsteini:1StewardsIndexesDF
create bitmap index pcrcts_stewards_site_type on pc_result_ct_sum_swap_stewards(site_type) local parallel 4 nologging;
--rollback drop index pcrcts_stewards_site_type;

--changeset drsteini:1StewardsIndexesDG
create bitmap index pcrcts_stewards_state on pc_result_ct_sum_swap_stewards(state_code) local parallel 4 nologging;
--rollback drop index pcrcts_stewards_state;

--changeset drsteini:1StewardsIndexesDH
create bitmap index pcrcts_stewards_station on pc_result_ct_sum_swap_stewards(station_id) local parallel 4 nologging;
--rollback drop index pcrcts_stewards_station;




--changeset drsteini:1StewardsIndexesDI
create bitmap index pcrnrs_stewards_analytical on pc_result_nr_sum_swap_stewards(analytical_method) local parallel 4 nologging;
--rollback drop index pcrnrs_stewards_analytical;

--changeset drsteini:1StewardsIndexesDJ
create bitmap index pcrnrs_stewards_char_name on pc_result_nr_sum_swap_stewards(characteristic_name) local parallel 4 nologging;
--rollback drop index pcrnrs_stewards_char_name;

--changeset drsteini:1StewardsIndexesDK
create bitmap index pcrnrs_stewards_char_type on pc_result_nr_sum_swap_stewards(characteristic_type) local parallel 4 nologging;
--rollback drop index pcrnrs_stewards_char_type;

--changeset drsteini:1StewardsIndexesDL
create bitmap index pcrnrs_stewards_p_code on pc_result_nr_sum_swap_stewards(p_code) local parallel 4 nologging;
--rollback drop index pcrnrs_stewards_p_code;

--changeset drsteini:1StewardsIndexesDM
create bitmap index pcrnrs_stewards_sample_media on pc_result_nr_sum_swap_stewards(sample_media) local parallel 4 nologging;
--rollback drop index pcrnrs_stewards_sample_media;

--changeset drsteini:1StewardsIndexesDN
create bitmap index pcrnrs_stewards_station on pc_result_nr_sum_swap_stewards(station_id) local parallel 4 nologging;
--rollback drop index pcrnrs_stewards_station;


--changeset drsteini:1StewardsIndexesDO
create bitmap index pcr_stewards_project on pc_result_swap_stewards(project_id) local parallel 4 nologging;
--rollback drop index pcr_stewards_project;

--changeset drsteini:1StewardsIndexesDP
create bitmap index pcrs_stewards_project on pc_result_sum_swap_stewards(project_id) local parallel 4 nologging;
--rollback drop index pcrs_stewards_project;

--changeset drsteini:1StewardsIndexesDQ
create bitmap index pcrcts_stewards_project on pc_result_ct_sum_swap_stewards(project_id) local parallel 4 nologging;
--rollback drop index pcrcts_stewards_project;

--changeset drsteini:1StewardsIndexesDR
create bitmap index pcrnrs_stewards_project on pc_result_nr_sum_swap_stewards(project_id) local parallel 4 nologging;
--rollback drop index pcrnrs_stewards_project;
