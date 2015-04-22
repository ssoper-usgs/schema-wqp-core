--liquibase formatted sql

--This is for the wqp_core schema

--changeset drsteini:1NwisIndexesAA
create bitmap index s_nwis_country on station_swap_nwis(country_code) parallel 4 nologging;
--rollback drop index s_nwis_country;

--changeset drsteini:1NwisIndexesAB
create bitmap index s_nwis_county on station_swap_nwis(county_code) parallel 4 nologging;
--rollback drop index s_nwis_county;

--changeset drsteini:1NwisIndexesAC
insert into user_sdo_geom_metadata
values ('STATION_SWAP_NWIS', 'GEOM',
        mdsys.sdo_dim_array( mdsys.sdo_dim_element('X', -180, 180, 0.005), mdsys.sdo_dim_element('Y', -90, 90, 0.005)), 4269);
--rollback delete from user_sdo_geom_metadata where table_name = 'STATION_SWAP_NWIS';

--changeset drsteini:1NwisIndexesAD
create index s_nwis_geom on station_swap_nwis(geom) indextype is mdsys.spatial_index parameters ('SDO_INDX_DIMS=2 LAYER_GTYPE="POINT"');
--rollback drop index s_nwis_geom;

--changeset drsteini:1NwisIndexesAE
create bitmap index s_nwis_huc10 on station_swap_nwis(huc_10) parallel 4 nologging;
--rollback drop index s_nwis_huc10;

--changeset drsteini:1NwisIndexesAF
create bitmap index s_nwis_huc12 on station_swap_nwis(huc_12) parallel 4 nologging;
--rollback drop index s_nwis_huc12;

--changeset drsteini:1NwisIndexesAG
create bitmap index s_nwis_huc2 on station_swap_nwis(huc_2) parallel 4 nologging;
--rollback drop index s_nwis_huc2;

--changeset drsteini:1NwisIndexesAH
create bitmap index s_nwis_huc4 on station_swap_nwis(huc_4) parallel 4 nologging;
--rollback drop index s_nwis_huc4;

--changeset drsteini:1NwisIndexesAI
create bitmap index s_nwis_huc6 on station_swap_nwis(huc_6) parallel 4 nologging;
--rollback drop index s_nwis_huc6;

--changeset drsteini:1NwisIndexesAJ
create bitmap index s_nwis_huc8 on station_swap_nwis(huc_8) parallel 4 nologging;
--rollback drop index s_nwis_huc8;

--changeset drsteini:1NwisIndexesAK
create bitmap index s_nwis_organization on station_swap_nwis(organization) parallel 4 nologging;
--rollback drop index s_nwis_organization;

--changeset drsteini:1NwisIndexesAL
create bitmap index s_nwis_site on station_swap_nwis(site_id) parallel 4 nologging;
--rollback drop index s_nwis_site;

--changeset drsteini:1NwisIndexesAM
create bitmap index s_nwis_site_type on station_swap_nwis(site_type) parallel 4 nologging;
--rollback drop index s_nwis_site_type;

--changeset drsteini:1NwisIndexesAN
create bitmap index s_nwis_state on station_swap_nwis(state_code) parallel 4 nologging;
--rollback drop index s_nwis_state;

--changeset drsteini:1NwisIndexesAO
create bitmap index s_nwis_station on station_swap_nwis(station_id) parallel 4 nologging;
--rollback drop index s_nwis_station;




--changeset drsteini:1NwisIndexesAP
create bitmap index pcr_nwis_activity on pc_result_swap_nwis(activity) local parallel 4 nologging;
--rollback drop index pcr_nwis_activity;

--changeset drsteini:1NwisIndexesAQ
create bitmap index pcr_nwis_analytical on pc_result_swap_nwis(analytical_method) local parallel 4 nologging;
--rollback drop index pcr_nwis_analytical;

--changeset drsteini:1NwisIndexesAR
create bitmap index pcr_nwis_char_name on pc_result_swap_nwis(characteristic_name) local parallel 4 nologging;
--rollback drop index pcr_nwis_char_name;

--changeset drsteini:1NwisIndexesAS
create bitmap index pcr_nwis_char_type on pc_result_swap_nwis(characteristic_type) local parallel 4 nologging;
--rollback drop index pcr_nwis_char_type;

--changeset drsteini:1NwisIndexesAT
create bitmap index pcr_nwis_country on pc_result_swap_nwis(country_code) local parallel 4 nologging;
--rollback drop index pcr_nwis_country;

--changeset drsteini:1NwisIndexesAU
create bitmap index pcr_nwis_county on pc_result_swap_nwis(county_code) local parallel 4 nologging;
--rollback drop index pcr_nwis_county;

--changeset drsteini:1NwisIndexesAV
create bitmap index pcr_nwis_event_date on pc_result_swap_nwis(event_date) local parallel 4 nologging;
--rollback drop index pcr_nwis_event_date;

--changeset drsteini:1NwisIndexesAW
create bitmap index pcr_nwis_huc10 on pc_result_swap_nwis(huc_10) local parallel 4 nologging;
--rollback drop index pcr_nwis_huc10;

--changeset drsteini:1NwisIndexesAX
create bitmap index pcr_nwis_huc12 on pc_result_swap_nwis(huc_12) local parallel 4 nologging;
--rollback drop index pcr_nwis_huc12;

--changeset drsteini:1NwisIndexesAY
create bitmap index pcr_nwis_huc2 on pc_result_swap_nwis(huc_2) local parallel 4 nologging;
--rollback drop index pcr_nwis_huc2;

--changeset drsteini:1NwisIndexesAZ
create bitmap index pcr_nwis_huc4 on pc_result_swap_nwis(huc_4) local parallel 4 nologging;
--rollback drop index pcr_nwis_huc4;

--changeset drsteini:1NwisIndexesBA
create bitmap index pcr_nwis_huc6 on pc_result_swap_nwis(huc_6) local parallel 4 nologging;
--rollback drop index pcr_nwis_huc6;

--changeset drsteini:1NwisIndexesBB
create bitmap index pcr_nwis_huc8 on pc_result_swap_nwis(huc_8) local parallel 4 nologging;
--rollback drop index pcr_nwis_huc8;

--changeset drsteini:1NwisIndexesBC
create bitmap index pcr_nwis_organization on pc_result_swap_nwis(organization) local parallel 4 nologging;
--rollback drop index pcr_nwis_organization;

--changeset drsteini:1NwisIndexesBD
create bitmap index pcr_nwis_p_code on pc_result_swap_nwis(p_code) local parallel 4 nologging;
--rollback drop index pcr_nwis_p_code;

--changeset drsteini:1NwisIndexesBE
create bitmap index pcr_nwis_sample_media on pc_result_swap_nwis(sample_media) local parallel 4 nologging;
--rollback drop index pcr_nwis_sample_media;

--changeset drsteini:1NwisIndexesBF
create bitmap index pcr_nwis_site on pc_result_swap_nwis(site_id) local parallel 4 nologging;
--rollback drop index pcr_nwis_site;

--changeset drsteini:1NwisIndexesBG
create bitmap index pcr_nwis_site_type on pc_result_swap_nwis(site_type) local parallel 4 nologging;
--rollback drop index pcr_nwis_site_type;

--changeset drsteini:1NwisIndexesBH
create bitmap index pcr_nwis_state on pc_result_swap_nwis(state_code) local parallel 4 nologging;
--rollback drop index pcr_nwis_state;

--changeset drsteini:1NwisIndexesBI
create bitmap index pcr_nwis_station on pc_result_swap_nwis(station_id) local parallel 4 nologging;
--rollback drop index pcr_nwis_station;




--changeset drsteini:1NwisIndexesBJ
create bitmap index ss_nwis_county on station_sum_swap_nwis(county_code) parallel 4 nologging;
--rollback drop index ss_nwis_county;

--changeset drsteini:1NwisIndexesBK
insert into user_sdo_geom_metadata
values ('STATION_SUM_SWAP_NWIS', 'GEOM',
        mdsys.sdo_dim_array( mdsys.sdo_dim_element('X', -180, 180, 0.005), mdsys.sdo_dim_element('Y', -90, 90, 0.005)), 4269);
--rollback delete from user_sdo_geom_metadata where table_name = 'STATION_SUM_SWAP_NWIS';

--changeset drsteini:1NwisIndexesBL
create index ss_nwis_geom on station_sum_swap_nwis(geom) indextype is mdsys.spatial_index parameters ('SDO_INDX_DIMS=2 LAYER_GTYPE="POINT"');
--rollback drop index ss_nwis_geom;

--changeset drsteini:1NwisIndexesBM
create bitmap index ss_nwis_huc10 on station_sum_swap_nwis(huc_10) parallel 4 nologging;
--rollback drop index ss_nwis_huc10;

--changeset drsteini:1NwisIndexesBN
create bitmap index ss_nwis_huc12 on station_sum_swap_nwis(huc_12) parallel 4 nologging;
--rollback drop index ss_nwis_huc12;

--changeset drsteini:1NwisIndexesBO
create bitmap index ss_nwis_huc2 on station_sum_swap_nwis(huc_2) parallel 4 nologging;
--rollback drop index ss_nwis_huc2;

--changeset drsteini:1NwisIndexesBP
create bitmap index ss_nwis_huc4 on station_sum_swap_nwis(huc_4) parallel 4 nologging;
--rollback drop index ss_nwis_huc4;

--changeset drsteini:1NwisIndexesBQ
create bitmap index ss_nwis_huc6 on station_sum_swap_nwis(huc_6) parallel 4 nologging;
--rollback drop index ss_nwis_huc6;

--changeset drsteini:1NwisIndexesBR
create bitmap index ss_nwis_huc8 on station_sum_swap_nwis(huc_8) parallel 4 nologging;
--rollback drop index ss_nwis_huc8;

--changeset drsteini:1NwisIndexesBS
create bitmap index ss_nwis_organization on station_sum_swap_nwis(organization) parallel 4 nologging;
--rollback drop index ss_nwis_organization;

--changeset drsteini:1NwisIndexesBT
create bitmap index ss_nwis_site on station_sum_swap_nwis(site_id) parallel 4 nologging;
--rollback drop index ss_nwis_site;

--changeset drsteini:1NwisIndexesBU
create bitmap index ss_nwis_site_type on station_sum_swap_nwis(site_type) parallel 4 nologging;
--rollback drop index ss_nwis_site_type;

--changeset drsteini:1NwisIndexesBV
create bitmap index ss_nwis_state on station_sum_swap_nwis(state_code) parallel 4 nologging;
--rollback drop index ss_nwis_state;

--changeset drsteini:1NwisIndexesBW
create bitmap index ss_nwis_station on station_sum_swap_nwis(station_id) parallel 4 nologging;
--rollback drop index ss_nwis_station;




--changeset drsteini:1NwisIndexesBX
create bitmap index pcrs_nwis_analytical on pc_result_sum_swap_nwis(analytical_method) local parallel 4 nologging;
--rollback drop index pcrs_nwis_analytical;

--changeset drsteini:1NwisIndexesBY
create bitmap index pcrs_nwis_char_name on pc_result_sum_swap_nwis(characteristic_name) local parallel 4 nologging;
--rollback drop index pcrs_nwis_char_name;

--changeset drsteini:1NwisIndexesBZ
create bitmap index pcrs_nwis_char_type on pc_result_sum_swap_nwis(characteristic_type) local parallel 4 nologging;
--rollback drop index pcrs_nwis_char_type;

--changeset drsteini:1NwisIndexesCA
create bitmap index pcrs_nwis_country on pc_result_sum_swap_nwis(country_code) local parallel 4 nologging;
--rollback drop index pcrs_nwis_country;

--changeset drsteini:1NwisIndexesCB
create bitmap index pcrs_nwis_county on pc_result_sum_swap_nwis(county_code) local parallel 4 nologging;
--rollback drop index pcrs_nwis_county;

--changeset drsteini:1NwisIndexesCC
create bitmap index pcrs_nwis_event_date on pc_result_sum_swap_nwis(event_date) local parallel 4 nologging;
--rollback drop index pcrs_nwis_event_date;

--changeset drsteini:1NwisIndexesCD
create bitmap index pcrs_nwis_huc10 on pc_result_sum_swap_nwis(huc_10) local parallel 4 nologging;
--rollback drop index pcrs_nwis_huc10;

--changeset drsteini:1NwisIndexesCE
create bitmap index pcrs_nwis_huc12 on pc_result_sum_swap_nwis(huc_12) local parallel 4 nologging;
--rollback drop index pcrs_nwis_huc12;

--changeset drsteini:1NwisIndexesCF
create bitmap index pcrs_nwis_huc2 on pc_result_sum_swap_nwis(huc_2) local parallel 4 nologging;
--rollback drop index pcrs_nwis_huc2;

--changeset drsteini:1NwisIndexesCG
create bitmap index pcrs_nwis_huc4 on pc_result_sum_swap_nwis(huc_4) local parallel 4 nologging;
--rollback drop index pcrs_nwis_huc4;

--changeset drsteini:1NwisIndexesCH
create bitmap index pcrs_nwis_huc6 on pc_result_sum_swap_nwis(huc_6) local parallel 4 nologging;
--rollback drop index pcrs_nwis_huc6;

--changeset drsteini:1NwisIndexesCI
create bitmap index pcrs_nwis_huc8 on pc_result_sum_swap_nwis(huc_8) local parallel 4 nologging;
--rollback drop index pcrs_nwis_huc8;

--changeset drsteini:1NwisIndexesCJ
create bitmap index pcrs_nwis_organization on pc_result_sum_swap_nwis(organization) local parallel 4 nologging;
--rollback drop index pcrs_nwis_organization;

--changeset drsteini:1NwisIndexesCK
create bitmap index pcrs_nwis_p_code on pc_result_sum_swap_nwis(p_code) local parallel 4 nologging;
--rollback drop index pcrs_nwis_p_code;

--changeset drsteini:1NwisIndexesCL
create bitmap index pcrs_nwis_sample_media on pc_result_sum_swap_nwis(sample_media) local parallel 4 nologging;
--rollback drop index pcrs_nwis_sample_media;

--changeset drsteini:1NwisIndexesCM
create bitmap index pcrs_nwis_site on pc_result_sum_swap_nwis(site_id) local parallel 4 nologging;
--rollback drop index pcrs_nwis_site;

--changeset drsteini:1NwisIndexesCN
create bitmap index pcrs_nwis_site_type on pc_result_sum_swap_nwis(site_type) local parallel 4 nologging;
--rollback drop index pcrs_nwis_site_type;

--changeset drsteini:1NwisIndexesCO
create bitmap index pcrs_nwis_state on pc_result_sum_swap_nwis(state_code) local parallel 4 nologging;
--rollback drop index pcrs_nwis_state;

--changeset drsteini:1NwisIndexesCP
create bitmap index pcrs_nwis_station on pc_result_sum_swap_nwis(station_id) local parallel 4 nologging;
--rollback drop index pcrs_nwis_station;




--changeset drsteini:1NwisIndexesCQ
create bitmap index pcrcts_nwis_analytical on pc_result_ct_sum_swap_nwis(analytical_method) local parallel 4 nologging;
--rollback drop index pcrcts_nwis_analytical;

--changeset drsteini:1NwisIndexesCR
create bitmap index pcrcts_nwis_char_name on pc_result_ct_sum_swap_nwis(characteristic_name) local parallel 4 nologging;
--rollback drop index pcrcts_nwis_char_name;

--changeset drsteini:1NwisIndexesCS
create bitmap index pcrcts_nwis_char_type on pc_result_ct_sum_swap_nwis(characteristic_type) local parallel 4 nologging;
--rollback drop index pcrcts_nwis_char_type;

--changeset drsteini:1NwisIndexesCT
create bitmap index pcrcts_nwis_country on pc_result_ct_sum_swap_nwis(country_code) local parallel 4 nologging;
--rollback drop index pcrcts_nwis_country;

--changeset drsteini:1NwisIndexesCU
create bitmap index pcrcts_nwis_county on pc_result_ct_sum_swap_nwis(county_code) local parallel 4 nologging;
--rollback drop index pcrcts_nwis_county;

--changeset drsteini:1NwisIndexesCV
create bitmap index pcrcts_nwis_huc10 on pc_result_ct_sum_swap_nwis(huc_10) local parallel 4 nologging;
--rollback drop index pcrcts_nwis_huc10;

--changeset drsteini:1NwisIndexesCW
create bitmap index pcrcts_nwis_huc12 on pc_result_ct_sum_swap_nwis(huc_12) local parallel 4 nologging;
--rollback drop index pcrcts_nwis_huc12;

--changeset drsteini:1NwisIndexesCX
create bitmap index pcrcts_nwis_huc2 on pc_result_ct_sum_swap_nwis(huc_2) local parallel 4 nologging;
--rollback drop index pcrcts_nwis_huc2;

--changeset drsteini:1NwisIndexesCY
create bitmap index pcrcts_nwis_huc4 on pc_result_ct_sum_swap_nwis(huc_4) local parallel 4 nologging;
--rollback drop index pcrcts_nwis_huc4;

--changeset drsteini:1NwisIndexesCZ
create bitmap index pcrcts_nwis_huc6 on pc_result_ct_sum_swap_nwis(huc_6) local parallel 4 nologging;
--rollback drop index pcrcts_nwis_huc6;

--changeset drsteini:1NwisIndexesDA
create bitmap index pcrcts_nwis_huc8 on pc_result_ct_sum_swap_nwis(huc_8) local parallel 4 nologging;
--rollback drop index pcrcts_nwis_huc8;

--changeset drsteini:1NwisIndexesDB
create bitmap index pcrcts_nwis_organization on pc_result_ct_sum_swap_nwis(organization) local parallel 4 nologging;
--rollback drop index pcrcts_nwis_organization;

--changeset drsteini:1NwisIndexesDC
create bitmap index pcrcts_nwis_p_code on pc_result_ct_sum_swap_nwis(p_code) local parallel 4 nologging;
--rollback drop index pcrcts_nwis_p_code;

--changeset drsteini:1NwisIndexesDD
create bitmap index pcrcts_nwis_sample_media on pc_result_ct_sum_swap_nwis(sample_media) local parallel 4 nologging;
--rollback drop index pcrcts_nwis_sample_media;

--changeset drsteini:1NwisIndexesDE
create bitmap index pcrcts_nwis_site on pc_result_ct_sum_swap_nwis(site_id) local parallel 4 nologging;
--rollback drop index pcrcts_nwis_site;

--changeset drsteini:1NwisIndexesDF
create bitmap index pcrcts_nwis_site_type on pc_result_ct_sum_swap_nwis(site_type) local parallel 4 nologging;
--rollback drop index pcrcts_nwis_site_type;

--changeset drsteini:1NwisIndexesDG
create bitmap index pcrcts_nwis_state on pc_result_ct_sum_swap_nwis(state_code) local parallel 4 nologging;
--rollback drop index pcrcts_nwis_state;

--changeset drsteini:1NwisIndexesDH
create bitmap index pcrcts_nwis_station on pc_result_ct_sum_swap_nwis(station_id) local parallel 4 nologging;
--rollback drop index pcrcts_nwis_station;




--changeset drsteini:1NwisIndexesDI
create bitmap index pcrnrs_nwis_analytical on pc_result_nr_sum_swap_nwis(analytical_method) local parallel 4 nologging;
--rollback drop index pcrnrs_nwis_analytical;

--changeset drsteini:1NwisIndexesDJ
create bitmap index pcrnrs_nwis_char_name on pc_result_nr_sum_swap_nwis(characteristic_name) local parallel 4 nologging;
--rollback drop index pcrnrs_nwis_char_name;

--changeset drsteini:1NwisIndexesDK
create bitmap index pcrnrs_nwis_char_type on pc_result_nr_sum_swap_nwis(characteristic_type) local parallel 4 nologging;
--rollback drop index pcrnrs_nwis_char_type;

--changeset drsteini:1NwisIndexesDL
create bitmap index pcrnrs_nwis_p_code on pc_result_nr_sum_swap_nwis(p_code) local parallel 4 nologging;
--rollback drop index pcrnrs_nwis_p_code;

--changeset drsteini:1NwisIndexesDM
create bitmap index pcrnrs_nwis_sample_media on pc_result_nr_sum_swap_nwis(sample_media) local parallel 4 nologging;
--rollback drop index pcrnrs_nwis_sample_media;

--changeset drsteini:1NwisIndexesDN
create bitmap index pcrnrs_nwis_station on pc_result_nr_sum_swap_nwis(station_id) local parallel 4 nologging;
--rollback drop index pcrnrs_nwis_station;



--changeset drsteini:1NwisIndexesDO
create bitmap index pcr_nwis_project on pc_result_swap_nwis(project_id) local parallel 4 nologging;
--rollback drop index pcr_nwis_project;

--changeset drsteini:1NwisIndexesDP
create bitmap index pcrs_nwis_project on pc_result_sum_swap_nwis(project_id) local parallel 4 nologging;
--rollback drop index pcrs_nwis_project;

--changeset drsteini:1NwisIndexesDQ
create bitmap index pcrcts_nwis_project on pc_result_ct_sum_swap_nwis(project_id) local parallel 4 nologging;
--rollback drop index pcrcts_nwis_project;

--changeset drsteini:1NwisIndexesDR
create bitmap index pcrnrs_nwis_project on pc_result_nr_sum_swap_nwis(project_id) local parallel 4 nologging;
--rollback drop index pcrnrs_nwis_project;
