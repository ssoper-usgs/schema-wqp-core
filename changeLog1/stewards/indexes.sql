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
create bitmap index r_stewards_activity on result_swap_stewards(activity) local parallel 4 nologging;
--rollback drop index r_stewards_activity;

--changeset drsteini:1StewardsIndexesAQ
create bitmap index r_stewards_analytical on result_swap_stewards(analytical_method) local parallel 4 nologging;
--rollback drop index r_stewards_analytical;

--changeset drsteini:1StewardsIndexesAR
create bitmap index r_stewards_char_name on result_swap_stewards(characteristic_name) local parallel 4 nologging;
--rollback drop index r_stewards_char_name;

--changeset drsteini:1StewardsIndexesAS
create bitmap index r_stewards_char_type on result_swap_stewards(characteristic_type) local parallel 4 nologging;
--rollback drop index r_stewards_char_type;

--changeset drsteini:1StewardsIndexesAT
create bitmap index r_stewards_country on result_swap_stewards(country_code) local parallel 4 nologging;
--rollback drop index r_stewards_country;

--changeset drsteini:1StewardsIndexesAU
create bitmap index r_stewards_county on result_swap_stewards(county_code) local parallel 4 nologging;
--rollback drop index r_stewards_county;

--changeset drsteini:1StewardsIndexesAV
create bitmap index r_stewards_event_date on result_swap_stewards(event_date) local parallel 4 nologging;
--rollback drop index r_stewards_event_date;

--changeset drsteini:1StewardsIndexesAW
create bitmap index r_stewards_huc10 on result_swap_stewards(huc_10) local parallel 4 nologging;
--rollback drop index r_stewards_huc10;

--changeset drsteini:1StewardsIndexesAX
create bitmap index r_stewards_huc12 on result_swap_stewards(huc_12) local parallel 4 nologging;
--rollback drop index r_stewards_huc12;

--changeset drsteini:1StewardsIndexesAY
create bitmap index r_stewards_huc2 on result_swap_stewards(huc_2) local parallel 4 nologging;
--rollback drop index r_stewards_huc2;

--changeset drsteini:1StewardsIndexesAZ
create bitmap index r_stewards_huc4 on result_swap_stewards(huc_4) local parallel 4 nologging;
--rollback drop index r_stewards_huc4;

--changeset drsteini:1StewardsIndexesBA
create bitmap index r_stewards_huc6 on result_swap_stewards(huc_6) local parallel 4 nologging;
--rollback drop index r_stewards_huc6;

--changeset drsteini:1StewardsIndexesBB
create bitmap index r_stewards_huc8 on result_swap_stewards(huc_8) local parallel 4 nologging;
--rollback drop index r_stewards_huc8;

--changeset drsteini:1StewardsIndexesBC
create bitmap index r_stewards_organization on result_swap_stewards(organization) local parallel 4 nologging;
--rollback drop index r_stewards_organization;

--changeset drsteini:1StewardsIndexesBD
create bitmap index r_stewards_p_code on result_swap_stewards(p_code) local parallel 4 nologging;
--rollback drop index r_stewards_p_code;

--changeset drsteini:1StewardsIndexesBE
create bitmap index r_stewards_sample_media on result_swap_stewards(sample_media) local parallel 4 nologging;
--rollback drop index r_stewards_sample_media;

--changeset drsteini:1StewardsIndexesBF
create bitmap index r_stewards_site on result_swap_stewards(site_id) local parallel 4 nologging;
--rollback drop index r_stewards_site;

--changeset drsteini:1StewardsIndexesBG
create bitmap index r_stewards_site_type on result_swap_stewards(site_type) local parallel 4 nologging;
--rollback drop index r_stewards_site_type;

--changeset drsteini:1StewardsIndexesBH
create bitmap index r_stewards_state on result_swap_stewards(state_code) local parallel 4 nologging;
--rollback drop index r_stewards_state;

--changeset drsteini:1StewardsIndexesBI
create bitmap index r_stewards_station on result_swap_stewards(station_id) local parallel 4 nologging;
--rollback drop index r_stewards_station;



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
create bitmap index rs_stewards_analytical on result_sum_swap_stewards(analytical_method) local parallel 4 nologging;
--rollback drop index rs_stewards_analytical;

--changeset drsteini:1StewardsIndexesBY
create bitmap index rs_stewards_char_name on result_sum_swap_stewards(characteristic_name) local parallel 4 nologging;
--rollback drop index rs_stewards_char_name;

--changeset drsteini:1StewardsIndexesBZ
create bitmap index rs_stewards_char_type on result_sum_swap_stewards(characteristic_type) local parallel 4 nologging;
--rollback drop index rs_stewards_char_type;

--changeset drsteini:1StewardsIndexesCA
create bitmap index rs_stewards_country on result_sum_swap_stewards(country_code) local parallel 4 nologging;
--rollback drop index rs_stewards_country;

--changeset drsteini:1StewardsIndexesCB
create bitmap index rs_stewards_county on result_sum_swap_stewards(county_code) local parallel 4 nologging;
--rollback drop index rs_stewards_county;

--changeset drsteini:1StewardsIndexesCC
create bitmap index rs_stewards_event_date on result_sum_swap_stewards(event_date) local parallel 4 nologging;
--rollback drop index rs_stewards_event_date;

--changeset drsteini:1StewardsIndexesCD
create bitmap index rs_stewards_huc10 on result_sum_swap_stewards(huc_10) local parallel 4 nologging;
--rollback drop index rs_stewards_huc10;

--changeset drsteini:1StewardsIndexesCE
create bitmap index rs_stewards_huc12 on result_sum_swap_stewards(huc_12) local parallel 4 nologging;
--rollback drop index rs_stewards_huc12;

--changeset drsteini:1StewardsIndexesCF
create bitmap index rs_stewards_huc2 on result_sum_swap_stewards(huc_2) local parallel 4 nologging;
--rollback drop index rs_stewards_huc2;

--changeset drsteini:1StewardsIndexesCG
create bitmap index rs_stewards_huc4 on result_sum_swap_stewards(huc_4) local parallel 4 nologging;
--rollback drop index rs_stewards_huc4;

--changeset drsteini:1StewardsIndexesCH
create bitmap index rs_stewards_huc6 on result_sum_swap_stewards(huc_6) local parallel 4 nologging;
--rollback drop index rs_stewards_huc6;

--changeset drsteini:1StewardsIndexesCI
create bitmap index rs_stewards_huc8 on result_sum_swap_stewards(huc_8) local parallel 4 nologging;
--rollback drop index rs_stewards_huc8;

--changeset drsteini:1StewardsIndexesCJ
create bitmap index rs_stewards_organization on result_sum_swap_stewards(organization) local parallel 4 nologging;
--rollback drop index rs_stewards_organization;

--changeset drsteini:1StewardsIndexesCK
create bitmap index rs_stewards_p_code on result_sum_swap_stewards(p_code) local parallel 4 nologging;
--rollback drop index rs_stewards_p_code;

--changeset drsteini:1StewardsIndexesCL
create bitmap index rs_stewards_sample_media on result_sum_swap_stewards(sample_media) local parallel 4 nologging;
--rollback drop index rs_stewards_sample_media;

--changeset drsteini:1StewardsIndexesCM
create bitmap index rs_stewards_site on result_sum_swap_stewards(site_id) local parallel 4 nologging;
--rollback drop index rs_stewards_site;

--changeset drsteini:1StewardsIndexesCN
create bitmap index rs_stewards_site_type on result_sum_swap_stewards(site_type) local parallel 4 nologging;
--rollback drop index rs_stewards_site_type;

--changeset drsteini:1StewardsIndexesCO
create bitmap index rs_stewards_state on result_sum_swap_stewards(state_code) local parallel 4 nologging;
--rollback drop index rs_stewards_state;

--changeset drsteini:1StewardsIndexesCP
create bitmap index rs_stewards_station on result_sum_swap_stewards(station_id) local parallel 4 nologging;
--rollback drop index rs_stewards_station;




--changeset drsteini:1StewardsIndexesCQ
create bitmap index rcts_stewards_analytical on result_ct_sum_swap_stewards(analytical_method) local parallel 4 nologging;
--rollback drop index rcts_stewards_analytical;

--changeset drsteini:1StewardsIndexesCR
create bitmap index rcts_stewards_char_name on result_ct_sum_swap_stewards(characteristic_name) local parallel 4 nologging;
--rollback drop index rcts_stewards_char_name;

--changeset drsteini:1StewardsIndexesCS
create bitmap index rcts_stewards_char_type on result_ct_sum_swap_stewards(characteristic_type) local parallel 4 nologging;
--rollback drop index rcts_stewards_char_type;

--changeset drsteini:1StewardsIndexesCT
create bitmap index rcts_stewards_country on result_ct_sum_swap_stewards(country_code) local parallel 4 nologging;
--rollback drop index rcts_stewards_country;

--changeset drsteini:1StewardsIndexesCU
create bitmap index rcts_stewards_county on result_ct_sum_swap_stewards(county_code) local parallel 4 nologging;
--rollback drop index rcts_stewards_county;

--changeset drsteini:1StewardsIndexesCV
create bitmap index rcts_stewards_huc10 on result_ct_sum_swap_stewards(huc_10) local parallel 4 nologging;
--rollback drop index rcts_stewards_huc10;

--changeset drsteini:1StewardsIndexesCW
create bitmap index rcts_stewards_huc12 on result_ct_sum_swap_stewards(huc_12) local parallel 4 nologging;
--rollback drop index rcts_stewards_huc12;

--changeset drsteini:1StewardsIndexesCX
create bitmap index rcts_stewards_huc2 on result_ct_sum_swap_stewards(huc_2) local parallel 4 nologging;
--rollback drop index rcts_stewards_huc2;

--changeset drsteini:1StewardsIndexesCY
create bitmap index rcts_stewards_huc4 on result_ct_sum_swap_stewards(huc_4) local parallel 4 nologging;
--rollback drop index rcts_stewards_huc4;

--changeset drsteini:1StewardsIndexesCZ
create bitmap index rcts_stewards_huc6 on result_ct_sum_swap_stewards(huc_6) local parallel 4 nologging;
--rollback drop index rcts_stewards_huc6;

--changeset drsteini:1StewardsIndexesDA
create bitmap index rcts_stewards_huc8 on result_ct_sum_swap_stewards(huc_8) local parallel 4 nologging;
--rollback drop index rcts_stewards_huc8;

--changeset drsteini:1StewardsIndexesDB
create bitmap index rcts_stewards_organization on result_ct_sum_swap_stewards(organization) local parallel 4 nologging;
--rollback drop index rcts_stewards_organization;

--changeset drsteini:1StewardsIndexesDC
create bitmap index rcts_stewards_p_code on result_ct_sum_swap_stewards(p_code) local parallel 4 nologging;
--rollback drop index rcts_stewards_p_code;

--changeset drsteini:1StewardsIndexesDD
create bitmap index rcts_stewards_sample_media on result_ct_sum_swap_stewards(sample_media) local parallel 4 nologging;
--rollback drop index rcts_stewards_sample_media;

--changeset drsteini:1StewardsIndexesDE
create bitmap index rcts_stewards_site on result_ct_sum_swap_stewards(site_id) local parallel 4 nologging;
--rollback drop index rcts_stewards_site;

--changeset drsteini:1StewardsIndexesDF
create bitmap index rcts_stewards_site_type on result_ct_sum_swap_stewards(site_type) local parallel 4 nologging;
--rollback drop index rcts_stewards_site_type;

--changeset drsteini:1StewardsIndexesDG
create bitmap index rcts_stewards_state on result_ct_sum_swap_stewards(state_code) local parallel 4 nologging;
--rollback drop index rcts_stewards_state;

--changeset drsteini:1StewardsIndexesDH
create bitmap index rcts_stewards_station on result_ct_sum_swap_stewards(station_id) local parallel 4 nologging;
--rollback drop index rcts_stewards_station;




--changeset drsteini:1StewardsIndexesDI
create bitmap index rnrs_stewards_analytical on result_nr_sum_swap_stewards(analytical_method) local parallel 4 nologging;
--rollback drop index rnrs_stewards_analytical;

--changeset drsteini:1StewardsIndexesDJ
create bitmap index rnrs_stewards_char_name on result_nr_sum_swap_stewards(characteristic_name) local parallel 4 nologging;
--rollback drop index rnrs_stewards_char_name;

--changeset drsteini:1StewardsIndexesDK
create bitmap index rnrs_stewards_char_type on result_nr_sum_swap_stewards(characteristic_type) local parallel 4 nologging;
--rollback drop index rnrs_stewards_char_type;

--changeset drsteini:1StewardsIndexesDL
create bitmap index rnrs_stewards_p_code on result_nr_sum_swap_stewards(p_code) local parallel 4 nologging;
--rollback drop index rnrs_stewards_p_code;

--changeset drsteini:1StewardsIndexesDM
create bitmap index rnrs_stewards_sample_media on result_nr_sum_swap_stewards(sample_media) local parallel 4 nologging;
--rollback drop index rnrs_stewards_sample_media;

--changeset drsteini:1StewardsIndexesDN
create bitmap index rnrs_stewards_station on result_nr_sum_swap_stewards(station_id) local parallel 4 nologging;
--rollback drop index rnrs_stewards_station;


--changeset drsteini:1StewardsIndexesDO
create bitmap index r_stewards_project on result_swap_stewards(project_id) local parallel 4 nologging;
--rollback drop index r_stewards_project;

--changeset drsteini:1StewardsIndexesDP
create bitmap index rs_stewards_project on result_sum_swap_stewards(project_id) local parallel 4 nologging;
--rollback drop index rs_stewards_project;

--changeset drsteini:1StewardsIndexesDQ
create bitmap index rcts_stewards_project on result_ct_sum_swap_stewards(project_id) local parallel 4 nologging;
--rollback drop index rcts_stewards_project;

--changeset drsteini:1StewardsIndexesDR
create bitmap index rnrs_stewards_project on result_nr_sum_swap_stewards(project_id) local parallel 4 nologging;
--rollback drop index rnrs_stewards_project;


--changeset drsteini:1StewardsIndexesDS
create bitmap index r_stewards_assemblage on result_swap_stewards(assemblage_sampled_name) local parallel 4 nologging;
--rollback drop index r_stewards_assemblage;

--changeset drsteini:1StewardsIndexesDT
create bitmap index rs_stewards_assemblage on result_sum_swap_stewards(assemblage_sampled_name) local parallel 4 nologging;
--rollback drop index rs_stewards_assemblage;

--changeset drsteini:1StewardsIndexesDU
create bitmap index rcts_stewards_assemblage on result_ct_sum_swap_stewards(assemblage_sampled_name) local parallel 4 nologging;
--rollback drop index rcts_stewards_assemblage;

--changeset drsteini:1StewardsIndexesDV
create bitmap index rnrs_stewards_assemblage on result_nr_sum_swap_stewards(assemblage_sampled_name) local parallel 4 nologging;
--rollback drop index rnrs_stewards_assemblage;

--changeset drsteini:1StewardsIndexesDW
create bitmap index r_stewards_taxa_name on result_swap_stewards(sample_tissue_taxonomic_name) local parallel 4 nologging;
--rollback drop index r_stewards_taxa_name;

--changeset drsteini:1StewardsIndexesDX
create bitmap index rs_stewards_taxa_name on result_sum_swap_stewards(taxonomic_name) local parallel 4 nologging;
--rollback drop index rs_stewards_taxa_name;

--changeset drsteini:1StewardsIndexesDY
create bitmap index rcts_stewards_taxa_name on result_ct_sum_swap_stewards(taxonomic_name) local parallel 4 nologging;
--rollback drop index rcts_stewards_taxa_name;

--changeset drsteini:1StewardsIndexesDZ
create bitmap index rnrs_stewards_taxa_name on result_nr_sum_swap_stewards(taxonomic_name) local parallel 4 nologging;
--rollback drop index rnrs_stewards_taxa_name;
