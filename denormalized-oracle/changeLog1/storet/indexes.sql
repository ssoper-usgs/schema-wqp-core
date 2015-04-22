--liquibase formatted sql

--This is for the wqp_core schema

--changeset drsteini:1StoretIndexesAA
create bitmap index s_storet_country on station_swap_storet(country_code) parallel 4 nologging;
--rollback drop index s_storet_country;

--changeset drsteini:1StoretIndexesAB
create bitmap index s_storet_county on station_swap_storet(county_code) parallel 4 nologging;
--rollback drop index s_storet_county;

--changeset drsteini:1StoretIndexesAC
insert into user_sdo_geom_metadata
values ('STATION_SWAP_STORET', 'GEOM',
        mdsys.sdo_dim_array( mdsys.sdo_dim_element('X', -180, 180, 0.005), mdsys.sdo_dim_element('Y', -90, 90, 0.005)), 4269);
--rollback delete from user_sdo_geom_metadata where table_name = 'STATION_SWAP_STORET';

--changeset drsteini:1StoretIndexesAD
create index s_storet_geom on station_swap_storet(geom) indextype is mdsys.spatial_index parameters ('SDO_INDX_DIMS=2 LAYER_GTYPE="POINT"');
--rollback drop index s_storet_geom;

--changeset drsteini:1StoretIndexesAE
create bitmap index s_storet_huc10 on station_swap_storet(huc_10) parallel 4 nologging;
--rollback drop index s_storet_huc10;

--changeset drsteini:1StoretIndexesAF
create bitmap index s_storet_huc12 on station_swap_storet(huc_12) parallel 4 nologging;
--rollback drop index s_storet_huc12;

--changeset drsteini:1StoretIndexesAG
create bitmap index s_storet_huc2 on station_swap_storet(huc_2) parallel 4 nologging;
--rollback drop index s_storet_huc2;

--changeset drsteini:1StoretIndexesAH
create bitmap index s_storet_huc4 on station_swap_storet(huc_4) parallel 4 nologging;
--rollback drop index s_storet_huc4;

--changeset drsteini:1StoretIndexesAI
create bitmap index s_storet_huc6 on station_swap_storet(huc_6) parallel 4 nologging;
--rollback drop index s_storet_huc6;

--changeset drsteini:1StoretIndexesAJ
create bitmap index s_storet_huc8 on station_swap_storet(huc_8) parallel 4 nologging;
--rollback drop index s_storet_huc8;

--changeset drsteini:1StoretIndexesAK
create bitmap index s_storet_organization on station_swap_storet(organization) parallel 4 nologging;
--rollback drop index s_storet_organization;

--changeset drsteini:1StoretIndexesAL
create bitmap index s_storet_site on station_swap_storet(site_id) parallel 4 nologging;
--rollback drop index s_storet_site;

--changeset drsteini:1StoretIndexesAM
create bitmap index s_storet_site_type on station_swap_storet(site_type) parallel 4 nologging;
--rollback drop index s_storet_site_type;

--changeset drsteini:1StoretIndexesAN
create bitmap index s_storet_state on station_swap_storet(state_code) parallel 4 nologging;
--rollback drop index s_storet_state;

--changeset drsteini:1StoretIndexesAO
create bitmap index s_storet_station on station_swap_storet(station_id) parallel 4 nologging;
--rollback drop index s_storet_station;




--changeset drsteini:1StoretIndexesAP
create bitmap index pcr_storet_activity on pc_result_swap_storet(activity) local parallel 4 nologging;
--rollback drop index pcr_storet_activity;

--changeset drsteini:1StoretIndexesAQ
create bitmap index pcr_storet_analytical on pc_result_swap_storet(analytical_method) local parallel 4 nologging;
--rollback drop index pcr_storet_analytical;

--changeset drsteini:1StoretIndexesAR
create bitmap index pcr_storet_char_name on pc_result_swap_storet(characteristic_name) local parallel 4 nologging;
--rollback drop index pcr_storet_char_name;

--changeset drsteini:1StoretIndexesAS
create bitmap index pcr_storet_char_type on pc_result_swap_storet(characteristic_type) local parallel 4 nologging;
--rollback drop index pcr_storet_char_type;

--changeset drsteini:1StoretIndexesAT
create bitmap index pcr_storet_country on pc_result_swap_storet(country_code) local parallel 4 nologging;
--rollback drop index pcr_storet_country;

--changeset drsteini:1StoretIndexesAU
create bitmap index pcr_storet_county on pc_result_swap_storet(county_code) local parallel 4 nologging;
--rollback drop index pcr_storet_county;

--changeset drsteini:1StoretIndexesAV
create bitmap index pcr_storet_event_date on pc_result_swap_storet(event_date) local parallel 4 nologging;
--rollback drop index pcr_storet_event_date;

--changeset drsteini:1StoretIndexesAW
create bitmap index pcr_storet_huc10 on pc_result_swap_storet(huc_10) local parallel 4 nologging;
--rollback drop index pcr_storet_huc10;

--changeset drsteini:1StoretIndexesAX
create bitmap index pcr_storet_huc12 on pc_result_swap_storet(huc_12) local parallel 4 nologging;
--rollback drop index pcr_storet_huc12;

--changeset drsteini:1StoretIndexesAY
create bitmap index pcr_storet_huc2 on pc_result_swap_storet(huc_2) local parallel 4 nologging;
--rollback drop index pcr_storet_huc2;

--changeset drsteini:1StoretIndexesAZ
create bitmap index pcr_storet_huc4 on pc_result_swap_storet(huc_4) local parallel 4 nologging;
--rollback drop index pcr_storet_huc4;

--changeset drsteini:1StoretIndexesBA
create bitmap index pcr_storet_huc6 on pc_result_swap_storet(huc_6) local parallel 4 nologging;
--rollback drop index pcr_storet_huc6;

--changeset drsteini:1StoretIndexesBB
create bitmap index pcr_storet_huc8 on pc_result_swap_storet(huc_8) local parallel 4 nologging;
--rollback drop index pcr_storet_huc8;

--changeset drsteini:1StoretIndexesBC
create bitmap index pcr_storet_organization on pc_result_swap_storet(organization) local parallel 4 nologging;
--rollback drop index pcr_storet_organization;

--changeset drsteini:1StoretIndexesBD
create bitmap index pcr_storet_p_code on pc_result_swap_storet(p_code) local parallel 4 nologging;
--rollback drop index pcr_storet_p_code;

--changeset drsteini:1StoretIndexesBE
create bitmap index pcr_storet_sample_media on pc_result_swap_storet(sample_media) local parallel 4 nologging;
--rollback drop index pcr_storet_sample_media;

--changeset drsteini:1StoretIndexesBF
create bitmap index pcr_storet_site on pc_result_swap_storet(site_id) local parallel 4 nologging;
--rollback drop index pcr_storet_site;

--changeset drsteini:1StoretIndexesBG
create bitmap index pcr_storet_site_type on pc_result_swap_storet(site_type) local parallel 4 nologging;
--rollback drop index pcr_storet_site_type;

--changeset drsteini:1StoretIndexesBH
create bitmap index pcr_storet_state on pc_result_swap_storet(state_code) local parallel 4 nologging;
--rollback drop index pcr_storet_state;

--changeset drsteini:1StoretIndexesBI
create bitmap index pcr_storet_station on pc_result_swap_storet(station_id) local parallel 4 nologging;
--rollback drop index pcr_storet_station;




--changeset drsteini:1StoretIndexesBJ
create bitmap index ss_storet_county on station_sum_swap_storet(county_code) parallel 4 nologging;
--rollback drop index ss_storet_county;

--changeset drsteini:1StoretIndexesBK
insert into user_sdo_geom_metadata
values ('STATION_SUM_SWAP_STORET', 'GEOM',
        mdsys.sdo_dim_array( mdsys.sdo_dim_element('X', -180, 180, 0.005), mdsys.sdo_dim_element('Y', -90, 90, 0.005)), 4269);
--rollback delete from user_sdo_geom_metadata where table_name = 'STATION_SUM_SWAP_STORET';

--changeset drsteini:1StoretIndexesBL
create index ss_storet_geom on station_sum_swap_storet(geom) indextype is mdsys.spatial_index parameters ('SDO_INDX_DIMS=2 LAYER_GTYPE="POINT"');
--rollback drop index ss_storet_geom;

--changeset drsteini:1StoretIndexesBM
create bitmap index ss_storet_huc10 on station_sum_swap_storet(huc_10) parallel 4 nologging;
--rollback drop index ss_storet_huc10;

--changeset drsteini:1StoretIndexesBN
create bitmap index ss_storet_huc12 on station_sum_swap_storet(huc_12) parallel 4 nologging;
--rollback drop index ss_storet_huc12;

--changeset drsteini:1StoretIndexesBO
create bitmap index ss_storet_huc2 on station_sum_swap_storet(huc_2) parallel 4 nologging;
--rollback drop index ss_storet_huc2;

--changeset drsteini:1StoretIndexesBP
create bitmap index ss_storet_huc4 on station_sum_swap_storet(huc_4) parallel 4 nologging;
--rollback drop index ss_storet_huc4;

--changeset drsteini:1StoretIndexesBQ
create bitmap index ss_storet_huc6 on station_sum_swap_storet(huc_6) parallel 4 nologging;
--rollback drop index ss_storet_huc6;

--changeset drsteini:1StoretIndexesBR
create bitmap index ss_storet_huc8 on station_sum_swap_storet(huc_8) parallel 4 nologging;
--rollback drop index ss_storet_huc8;

--changeset drsteini:1StoretIndexesBS
create bitmap index ss_storet_organization on station_sum_swap_storet(organization) parallel 4 nologging;
--rollback drop index ss_storet_organization;

--changeset drsteini:1StoretIndexesBT
create bitmap index ss_storet_site on station_sum_swap_storet(site_id) parallel 4 nologging;
--rollback drop index ss_storet_site;

--changeset drsteini:1StoretIndexesBU
create bitmap index ss_storet_site_type on station_sum_swap_storet(site_type) parallel 4 nologging;
--rollback drop index ss_storet_site_type;

--changeset drsteini:1StoretIndexesBV
create bitmap index ss_storet_state on station_sum_swap_storet(state_code) parallel 4 nologging;
--rollback drop index ss_storet_state;

--changeset drsteini:1StoretIndexesBW
create bitmap index ss_storet_station on station_sum_swap_storet(station_id) parallel 4 nologging;
--rollback drop index ss_storet_station;




--changeset drsteini:1StoretIndexesBX
create bitmap index pcrs_storet_analytical on pc_result_sum_swap_storet(analytical_method) local parallel 4 nologging;
--rollback drop index pcrs_storet_analytical;

--changeset drsteini:1StoretIndexesBY
create bitmap index pcrs_storet_char_name on pc_result_sum_swap_storet(characteristic_name) local parallel 4 nologging;
--rollback drop index pcrs_storet_char_name;

--changeset drsteini:1StoretIndexesBZ
create bitmap index pcrs_storet_char_type on pc_result_sum_swap_storet(characteristic_type) local parallel 4 nologging;
--rollback drop index pcrs_storet_char_type;

--changeset drsteini:1StoretIndexesCA
create bitmap index pcrs_storet_country on pc_result_sum_swap_storet(country_code) local parallel 4 nologging;
--rollback drop index pcrs_storet_country;

--changeset drsteini:1StoretIndexesCB
create bitmap index pcrs_storet_county on pc_result_sum_swap_storet(county_code) local parallel 4 nologging;
--rollback drop index pcrs_storet_county;

--changeset drsteini:1StoretIndexesCC
create bitmap index pcrs_storet_event_date on pc_result_sum_swap_storet(event_date) local parallel 4 nologging;
--rollback drop index pcrs_storet_event_date;

--changeset drsteini:1StoretIndexesCD
create bitmap index pcrs_storet_huc10 on pc_result_sum_swap_storet(huc_10) local parallel 4 nologging;
--rollback drop index pcrs_storet_huc10;

--changeset drsteini:1StoretIndexesCE
create bitmap index pcrs_storet_huc12 on pc_result_sum_swap_storet(huc_12) local parallel 4 nologging;
--rollback drop index pcrs_storet_huc12;

--changeset drsteini:1StoretIndexesCF
create bitmap index pcrs_storet_huc2 on pc_result_sum_swap_storet(huc_2) local parallel 4 nologging;
--rollback drop index pcrs_storet_huc2;

--changeset drsteini:1StoretIndexesCG
create bitmap index pcrs_storet_huc4 on pc_result_sum_swap_storet(huc_4) local parallel 4 nologging;
--rollback drop index pcrs_storet_huc4;

--changeset drsteini:1StoretIndexesCH
create bitmap index pcrs_storet_huc6 on pc_result_sum_swap_storet(huc_6) local parallel 4 nologging;
--rollback drop index pcrs_storet_huc6;

--changeset drsteini:1StoretIndexesCI
create bitmap index pcrs_storet_huc8 on pc_result_sum_swap_storet(huc_8) local parallel 4 nologging;
--rollback drop index pcrs_storet_huc8;

--changeset drsteini:1StoretIndexesCJ
create bitmap index pcrs_storet_organization on pc_result_sum_swap_storet(organization) local parallel 4 nologging;
--rollback drop index pcrs_storet_organization;

--changeset drsteini:1StoretIndexesCK
create bitmap index pcrs_storet_p_code on pc_result_sum_swap_storet(p_code) local parallel 4 nologging;
--rollback drop index pcrs_storet_p_code;

--changeset drsteini:1StoretIndexesCL
create bitmap index pcrs_storet_sample_media on pc_result_sum_swap_storet(sample_media) local parallel 4 nologging;
--rollback drop index pcrs_storet_sample_media;

--changeset drsteini:1StoretIndexesCM
create bitmap index pcrs_storet_site on pc_result_sum_swap_storet(site_id) local parallel 4 nologging;
--rollback drop index pcrs_storet_site;

--changeset drsteini:1StoretIndexesCN
create bitmap index pcrs_storet_site_type on pc_result_sum_swap_storet(site_type) local parallel 4 nologging;
--rollback drop index pcrs_storet_site_type;

--changeset drsteini:1StoretIndexesCO
create bitmap index pcrs_storet_state on pc_result_sum_swap_storet(state_code) local parallel 4 nologging;
--rollback drop index pcrs_storet_state;

--changeset drsteini:1StoretIndexesCP
create bitmap index pcrs_storet_station on pc_result_sum_swap_storet(station_id) local parallel 4 nologging;
--rollback drop index pcrs_storet_station;




--changeset drsteini:1StoretIndexesCQ
create bitmap index pcrcts_storet_analytical on pc_result_ct_sum_swap_storet(analytical_method) local parallel 4 nologging;
--rollback drop index pcrcts_storet_analytical;

--changeset drsteini:1StoretIndexesCR
create bitmap index pcrcts_storet_char_name on pc_result_ct_sum_swap_storet(characteristic_name) local parallel 4 nologging;
--rollback drop index pcrcts_storet_char_name;

--changeset drsteini:1StoretIndexesCS
create bitmap index pcrcts_storet_char_type on pc_result_ct_sum_swap_storet(characteristic_type) local parallel 4 nologging;
--rollback drop index pcrcts_storet_char_type;

--changeset drsteini:1StoretIndexesCT
create bitmap index pcrcts_storet_country on pc_result_ct_sum_swap_storet(country_code) local parallel 4 nologging;
--rollback drop index pcrcts_storet_country;

--changeset drsteini:1StoretIndexesCU
create bitmap index pcrcts_storet_county on pc_result_ct_sum_swap_storet(county_code) local parallel 4 nologging;
--rollback drop index pcrcts_storet_county;

--changeset drsteini:1StoretIndexesCV
create bitmap index pcrcts_storet_huc10 on pc_result_ct_sum_swap_storet(huc_10) local parallel 4 nologging;
--rollback drop index pcrcts_storet_huc10;

--changeset drsteini:1StoretIndexesCW
create bitmap index pcrcts_storet_huc12 on pc_result_ct_sum_swap_storet(huc_12) local parallel 4 nologging;
--rollback drop index pcrcts_storet_huc12;

--changeset drsteini:1StoretIndexesCX
create bitmap index pcrcts_storet_huc2 on pc_result_ct_sum_swap_storet(huc_2) local parallel 4 nologging;
--rollback drop index pcrcts_storet_huc2;

--changeset drsteini:1StoretIndexesCY
create bitmap index pcrcts_storet_huc4 on pc_result_ct_sum_swap_storet(huc_4) local parallel 4 nologging;
--rollback drop index pcrcts_storet_huc4;

--changeset drsteini:1StoretIndexesCZ
create bitmap index pcrcts_storet_huc6 on pc_result_ct_sum_swap_storet(huc_6) local parallel 4 nologging;
--rollback drop index pcrcts_storet_huc6;

--changeset drsteini:1StoretIndexesDA
create bitmap index pcrcts_storet_huc8 on pc_result_ct_sum_swap_storet(huc_8) local parallel 4 nologging;
--rollback drop index pcrcts_storet_huc8;

--changeset drsteini:1StoretIndexesDB
create bitmap index pcrcts_storet_organization on pc_result_ct_sum_swap_storet(organization) local parallel 4 nologging;
--rollback drop index pcrcts_storet_organization;

--changeset drsteini:1StoretIndexesDC
create bitmap index pcrcts_storet_p_code on pc_result_ct_sum_swap_storet(p_code) local parallel 4 nologging;
--rollback drop index pcrcts_storet_p_code;

--changeset drsteini:1StoretIndexesDD
create bitmap index pcrcts_storet_sample_media on pc_result_ct_sum_swap_storet(sample_media) local parallel 4 nologging;
--rollback drop index pcrcts_storet_sample_media;

--changeset drsteini:1StoretIndexesDE
create bitmap index pcrcts_storet_site on pc_result_ct_sum_swap_storet(site_id) local parallel 4 nologging;
--rollback drop index pcrcts_storet_site;

--changeset drsteini:1StoretIndexesDF
create bitmap index pcrcts_storet_site_type on pc_result_ct_sum_swap_storet(site_type) local parallel 4 nologging;
--rollback drop index pcrcts_storet_site_type;

--changeset drsteini:1StoretIndexesDG
create bitmap index pcrcts_storet_state on pc_result_ct_sum_swap_storet(state_code) local parallel 4 nologging;
--rollback drop index pcrcts_storet_state;

--changeset drsteini:1StoretIndexesDH
create bitmap index pcrcts_storet_station on pc_result_ct_sum_swap_storet(station_id) local parallel 4 nologging;
--rollback drop index pcrcts_storet_station;




--changeset drsteini:1StoretIndexesDI
create bitmap index pcrnrs_storet_analytical on pc_result_nr_sum_swap_storet(analytical_method) local parallel 4 nologging;
--rollback drop index pcrnrs_storet_analytical;

--changeset drsteini:1StoretIndexesDJ
create bitmap index pcrnrs_storet_char_name on pc_result_nr_sum_swap_storet(characteristic_name) local parallel 4 nologging;
--rollback drop index pcrnrs_storet_char_name;

--changeset drsteini:1StoretIndexesDK
create bitmap index pcrnrs_storet_char_type on pc_result_nr_sum_swap_storet(characteristic_type) local parallel 4 nologging;
--rollback drop index pcrnrs_storet_char_type;

--changeset drsteini:1StoretIndexesDL
create bitmap index pcrnrs_storet_p_code on pc_result_nr_sum_swap_storet(p_code) local parallel 4 nologging;
--rollback drop index pcrnrs_storet_p_code;

--changeset drsteini:1StoretIndexesDM
create bitmap index pcrnrs_storet_sample_media on pc_result_nr_sum_swap_storet(sample_media) local parallel 4 nologging;
--rollback drop index pcrnrs_storet_sample_media;

--changeset drsteini:1StoretIndexesDN
create bitmap index pcrnrs_storet_station on pc_result_nr_sum_swap_storet(station_id) local parallel 4 nologging;
--rollback drop index pcrnrs_storet_station;


--changeset drsteini:1StoretIndexesDO
create bitmap index pcr_storet_project on pc_result_swap_storet(project_id) local parallel 4 nologging;
--rollback drop index pcr_storet_project;

--changeset drsteini:1StoretIndexesDP
create bitmap index pcrs_storet_project on pc_result_sum_swap_storet(project_id) local parallel 4 nologging;
--rollback drop index pcrs_storet_project;

--changeset drsteini:1StoretIndexesDQ
create bitmap index pcrcts_storet_project on pc_result_ct_sum_swap_storet(project_id) local parallel 4 nologging;
--rollback drop index pcrcts_storet_project;

--changeset drsteini:1StoretIndexesDR
create bitmap index pcrnrs_storet_project on pc_result_nr_sum_swap_storet(project_id) local parallel 4 nologging;
--rollback drop index pcrnrs_storet_project;
