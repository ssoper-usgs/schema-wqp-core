--liquibase formatted sql

--This is for the wqp_core schema

--changeset drsteini:1BiodataIndexesAA
create bitmap index s_biodata_country on station_swap_biodata(country_code) parallel 4 nologging;
--rollback drop index s_biodata_country;

--changeset drsteini:1BiodataIndexesAB
create bitmap index s_biodata_county on station_swap_biodata(county_code) parallel 4 nologging;
--rollback drop index s_biodata_county;

--changeset drsteini:1BiodataIndexesAC
insert into user_sdo_geom_metadata
values ('STATION_SWAP_BIODATA', 'GEOM',
        mdsys.sdo_dim_array( mdsys.sdo_dim_element('X', -180, 180, 0.005), mdsys.sdo_dim_element('Y', -90, 90, 0.005)), 4269);
--rollback delete from user_sdo_geom_metadata where table_name = 'STATION_SWAP_BIODATA';

--changeset drsteini:1BiodataIndexesAD
create index s_biodata_geom on station_swap_biodata(geom) indextype is mdsys.spatial_index parameters ('SDO_INDX_DIMS=2 LAYER_GTYPE="POINT"');
--rollback drop index s_biodata_geom;

--changeset drsteini:1BiodataIndexesAE
create bitmap index s_biodata_huc10 on station_swap_biodata(huc_10) parallel 4 nologging;
--rollback drop index s_biodata_huc10;

--changeset drsteini:1BiodataIndexesAF
create bitmap index s_biodata_huc12 on station_swap_biodata(huc_12) parallel 4 nologging;
--rollback drop index s_biodata_huc12;

--changeset drsteini:1BiodataIndexesAG
create bitmap index s_biodata_huc2 on station_swap_biodata(huc_2) parallel 4 nologging;
--rollback drop index s_biodata_huc2;

--changeset drsteini:1BiodataIndexesAH
create bitmap index s_biodata_huc4 on station_swap_biodata(huc_4) parallel 4 nologging;
--rollback drop index s_biodata_huc4;

--changeset drsteini:1BiodataIndexesAI
create bitmap index s_biodata_huc6 on station_swap_biodata(huc_6) parallel 4 nologging;
--rollback drop index s_biodata_huc6;

--changeset drsteini:1BiodataIndexesAJ
create bitmap index s_biodata_huc8 on station_swap_biodata(huc_8) parallel 4 nologging;
--rollback drop index s_biodata_huc8;

--changeset drsteini:1BiodataIndexesAK
create bitmap index s_biodata_organization on station_swap_biodata(organization) parallel 4 nologging;
--rollback drop index s_biodata_organization;

--changeset drsteini:1BiodataIndexesAL
create bitmap index s_biodata_site on station_swap_biodata(site_id) parallel 4 nologging;
--rollback drop index s_biodata_site;

--changeset drsteini:1BiodataIndexesAM
create bitmap index s_biodata_site_type on station_swap_biodata(site_type) parallel 4 nologging;
--rollback drop index s_biodata_site_type;

--changeset drsteini:1BiodataIndexesAN
create bitmap index s_biodata_state on station_swap_biodata(state_code) parallel 4 nologging;
--rollback drop index s_biodata_state;

--changeset drsteini:1BiodataIndexesAO
create bitmap index s_biodata_station on station_swap_biodata(station_id) parallel 4 nologging;
--rollback drop index s_biodata_station;




--changeset drsteini:1BiodataIndexesAP
create bitmap index r_biodata_activity on result_swap_biodata(activity) local parallel 4 nologging;
--rollback drop index r_biodata_activity;

--changeset drsteini:1BiodataIndexesAQ
create bitmap index r_biodata_analytical on result_swap_biodata(analytical_method) local parallel 4 nologging;
--rollback drop index r_biodata_analytical;

--changeset drsteini:1BiodataIndexesAR
create bitmap index r_biodata_char_name on result_swap_biodata(characteristic_name) local parallel 4 nologging;
--rollback drop index r_biodata_char_name;

--changeset drsteini:1BiodataIndexesAS
create bitmap index r_biodata_char_type on result_swap_biodata(characteristic_type) local parallel 4 nologging;
--rollback drop index r_biodata_char_type;

--changeset drsteini:1BiodataIndexesAT
create bitmap index r_biodata_country on result_swap_biodata(country_code) local parallel 4 nologging;
--rollback drop index r_biodata_country;

--changeset drsteini:1BiodataIndexesAU
create bitmap index r_biodata_county on result_swap_biodata(county_code) local parallel 4 nologging;
--rollback drop index r_biodata_county;

--changeset drsteini:1BiodataIndexesAV
create bitmap index r_biodata_event_date on result_swap_biodata(event_date) local parallel 4 nologging;
--rollback drop index r_biodata_event_date;

--changeset drsteini:1BiodataIndexesAW
create bitmap index r_biodata_huc10 on result_swap_biodata(huc_10) local parallel 4 nologging;
--rollback drop index r_biodata_huc10;

--changeset drsteini:1BiodataIndexesAX
create bitmap index r_biodata_huc12 on result_swap_biodata(huc_12) local parallel 4 nologging;
--rollback drop index r_biodata_huc12;

--changeset drsteini:1BiodataIndexesAY
create bitmap index r_biodata_huc2 on result_swap_biodata(huc_2) local parallel 4 nologging;
--rollback drop index r_biodata_huc2;

--changeset drsteini:1BiodataIndexesAZ
create bitmap index r_biodata_huc4 on result_swap_biodata(huc_4) local parallel 4 nologging;
--rollback drop index r_biodata_huc4;

--changeset drsteini:1BiodataIndexesBA
create bitmap index r_biodata_huc6 on result_swap_biodata(huc_6) local parallel 4 nologging;
--rollback drop index r_biodata_huc6;

--changeset drsteini:1BiodataIndexesBB
create bitmap index r_biodata_huc8 on result_swap_biodata(huc_8) local parallel 4 nologging;
--rollback drop index r_biodata_huc8;

--changeset drsteini:1BiodataIndexesBC
create bitmap index r_biodata_organization on result_swap_biodata(organization) local parallel 4 nologging;
--rollback drop index r_biodata_organization;

--changeset drsteini:1BiodataIndexesBD
create bitmap index r_biodata_p_code on result_swap_biodata(p_code) local parallel 4 nologging;
--rollback drop index r_biodata_p_code;

--changeset drsteini:1BiodataIndexesBE
create bitmap index r_biodata_sample_media on result_swap_biodata(sample_media) local parallel 4 nologging;
--rollback drop index r_biodata_sample_media;

--changeset drsteini:1BiodataIndexesBF
create bitmap index r_biodata_site on result_swap_biodata(site_id) local parallel 4 nologging;
--rollback drop index r_biodata_site;

--changeset drsteini:1BiodataIndexesBG
create bitmap index r_biodata_site_type on result_swap_biodata(site_type) local parallel 4 nologging;
--rollback drop index r_biodata_site_type;

--changeset drsteini:1BiodataIndexesBH
create bitmap index r_biodata_state on result_swap_biodata(state_code) local parallel 4 nologging;
--rollback drop index r_biodata_state;

--changeset drsteini:1BiodataIndexesBI
create bitmap index r_biodata_station on result_swap_biodata(station_id) local parallel 4 nologging;
--rollback drop index r_biodata_station;




--changeset drsteini:1BiodataIndexesBJ
create bitmap index ss_biodata_county on station_sum_swap_biodata(county_code) parallel 4 nologging;
--rollback drop index ss_biodata_county;

--changeset drsteini:1BiodataIndexesBK
insert into user_sdo_geom_metadata
values ('STATION_SUM_SWAP_BIODATA', 'GEOM',
        mdsys.sdo_dim_array( mdsys.sdo_dim_element('X', -180, 180, 0.005), mdsys.sdo_dim_element('Y', -90, 90, 0.005)), 4269);
--rollback delete from user_sdo_geom_metadata where table_name = 'STATION_SUM_SWAP_BIODATA';

--changeset drsteini:1BiodataIndexesBL
create index ss_biodata_geom on station_sum_swap_biodata(geom) indextype is mdsys.spatial_index parameters ('SDO_INDX_DIMS=2 LAYER_GTYPE="POINT"');
--rollback drop index ss_biodata_geom;

--changeset drsteini:1BiodataIndexesBM
create bitmap index ss_biodata_huc10 on station_sum_swap_biodata(huc_10) parallel 4 nologging;
--rollback drop index ss_biodata_huc10;

--changeset drsteini:1BiodataIndexesBN
create bitmap index ss_biodata_huc12 on station_sum_swap_biodata(huc_12) parallel 4 nologging;
--rollback drop index ss_biodata_huc12;

--changeset drsteini:1BiodataIndexesBO
create bitmap index ss_biodata_huc2 on station_sum_swap_biodata(huc_2) parallel 4 nologging;
--rollback drop index ss_biodata_huc2;

--changeset drsteini:1BiodataIndexesBP
create bitmap index ss_biodata_huc4 on station_sum_swap_biodata(huc_4) parallel 4 nologging;
--rollback drop index ss_biodata_huc4;

--changeset drsteini:1BiodataIndexesBQ
create bitmap index ss_biodata_huc6 on station_sum_swap_biodata(huc_6) parallel 4 nologging;
--rollback drop index ss_biodata_huc6;

--changeset drsteini:1BiodataIndexesBR
create bitmap index ss_biodata_huc8 on station_sum_swap_biodata(huc_8) parallel 4 nologging;
--rollback drop index ss_biodata_huc8;

--changeset drsteini:1BiodataIndexesBS
create bitmap index ss_biodata_organization on station_sum_swap_biodata(organization) parallel 4 nologging;
--rollback drop index ss_biodata_organization;

--changeset drsteini:1BiodataIndexesBT
create bitmap index ss_biodata_site on station_sum_swap_biodata(site_id) parallel 4 nologging;
--rollback drop index ss_biodata_site;

--changeset drsteini:1BiodataIndexesBU
create bitmap index ss_biodata_site_type on station_sum_swap_biodata(site_type) parallel 4 nologging;
--rollback drop index ss_biodata_site_type;

--changeset drsteini:1BiodataIndexesBV
create bitmap index ss_biodata_state on station_sum_swap_biodata(state_code) parallel 4 nologging;
--rollback drop index ss_biodata_state;

--changeset drsteini:1BiodataIndexesBW
create bitmap index ss_biodata_station on station_sum_swap_biodata(station_id) parallel 4 nologging;
--rollback drop index ss_biodata_station;




--changeset drsteini:1BiodataIndexesBX
create bitmap index rs_biodata_analytical on result_sum_swap_biodata(analytical_method) local parallel 4 nologging;
--rollback drop index rs_biodata_analytical;

--changeset drsteini:1BiodataIndexesBY
create bitmap index rs_biodata_char_name on result_sum_swap_biodata(characteristic_name) local parallel 4 nologging;
--rollback drop index rs_biodata_char_name;

--changeset drsteini:1BiodataIndexesBZ
create bitmap index rs_biodata_char_type on result_sum_swap_biodata(characteristic_type) local parallel 4 nologging;
--rollback drop index rs_biodata_char_type;

--changeset drsteini:1BiodataIndexesCA
create bitmap index rs_biodata_country on result_sum_swap_biodata(country_code) local parallel 4 nologging;
--rollback drop index rs_biodata_country;

--changeset drsteini:1BiodataIndexesCB
create bitmap index rs_biodata_county on result_sum_swap_biodata(county_code) local parallel 4 nologging;
--rollback drop index rs_biodata_county;

--changeset drsteini:1BiodataIndexesCC
create bitmap index rs_biodata_event_date on result_sum_swap_biodata(event_date) local parallel 4 nologging;
--rollback drop index rs_biodata_event_date;

--changeset drsteini:1BiodataIndexesCD
create bitmap index rs_biodata_huc10 on result_sum_swap_biodata(huc_10) local parallel 4 nologging;
--rollback drop index rs_biodata_huc10;

--changeset drsteini:1BiodataIndexesCE
create bitmap index rs_biodata_huc12 on result_sum_swap_biodata(huc_12) local parallel 4 nologging;
--rollback drop index rs_biodata_huc12;

--changeset drsteini:1BiodataIndexesCF
create bitmap index rs_biodata_huc2 on result_sum_swap_biodata(huc_2) local parallel 4 nologging;
--rollback drop index rs_biodata_huc2;

--changeset drsteini:1BiodataIndexesCG
create bitmap index rs_biodata_huc4 on result_sum_swap_biodata(huc_4) local parallel 4 nologging;
--rollback drop index rs_biodata_huc4;

--changeset drsteini:1BiodataIndexesCH
create bitmap index rs_biodata_huc6 on result_sum_swap_biodata(huc_6) local parallel 4 nologging;
--rollback drop index rs_biodata_huc6;

--changeset drsteini:1BiodataIndexesCI
create bitmap index rs_biodata_huc8 on result_sum_swap_biodata(huc_8) local parallel 4 nologging;
--rollback drop index rs_biodata_huc8;

--changeset drsteini:1BiodataIndexesCJ
create bitmap index rs_biodata_organization on result_sum_swap_biodata(organization) local parallel 4 nologging;
--rollback drop index rs_biodata_organization;

--changeset drsteini:1BiodataIndexesCK
create bitmap index rs_biodata_p_code on result_sum_swap_biodata(p_code) local parallel 4 nologging;
--rollback drop index rs_biodata_p_code;

--changeset drsteini:1BiodataIndexesCL
create bitmap index rs_biodata_sample_media on result_sum_swap_biodata(sample_media) local parallel 4 nologging;
--rollback drop index rs_biodata_sample_media;

--changeset drsteini:1BiodataIndexesCM
create bitmap index rs_biodata_site on result_sum_swap_biodata(site_id) local parallel 4 nologging;
--rollback drop index rs_biodata_site;

--changeset drsteini:1BiodataIndexesCN
create bitmap index rs_biodata_site_type on result_sum_swap_biodata(site_type) local parallel 4 nologging;
--rollback drop index rs_biodata_site_type;

--changeset drsteini:1BiodataIndexesCO
create bitmap index rs_biodata_state on result_sum_swap_biodata(state_code) local parallel 4 nologging;
--rollback drop index rs_biodata_state;

--changeset drsteini:1BiodataIndexesCP
create bitmap index rs_biodata_station on result_sum_swap_biodata(station_id) local parallel 4 nologging;
--rollback drop index rs_biodata_station;




--changeset drsteini:1BiodataIndexesCQ
create bitmap index rcts_biodata_analytical on result_ct_sum_swap_biodata(analytical_method) local parallel 4 nologging;
--rollback drop index rcts_biodata_analytical;

--changeset drsteini:1BiodataIndexesCR
create bitmap index rcts_biodata_char_name on result_ct_sum_swap_biodata(characteristic_name) local parallel 4 nologging;
--rollback drop index rcts_biodata_char_name;

--changeset drsteini:1BiodataIndexesCS
create bitmap index rcts_biodata_char_type on result_ct_sum_swap_biodata(characteristic_type) local parallel 4 nologging;
--rollback drop index rcts_biodata_char_type;

--changeset drsteini:1BiodataIndexesCT
create bitmap index rcts_biodata_country on result_ct_sum_swap_biodata(country_code) local parallel 4 nologging;
--rollback drop index rcts_biodata_country;

--changeset drsteini:1BiodataIndexesCU
create bitmap index rcts_biodata_county on result_ct_sum_swap_biodata(county_code) local parallel 4 nologging;
--rollback drop index rcts_biodata_county;

--changeset drsteini:1BiodataIndexesCV
create bitmap index rcts_biodata_huc10 on result_ct_sum_swap_biodata(huc_10) local parallel 4 nologging;
--rollback drop index rcts_biodata_huc10;

--changeset drsteini:1BiodataIndexesCW
create bitmap index rcts_biodata_huc12 on result_ct_sum_swap_biodata(huc_12) local parallel 4 nologging;
--rollback drop index rcts_biodata_huc12;

--changeset drsteini:1BiodataIndexesCX
create bitmap index rcts_biodata_huc2 on result_ct_sum_swap_biodata(huc_2) local parallel 4 nologging;
--rollback drop index rcts_biodata_huc2;

--changeset drsteini:1BiodataIndexesCY
create bitmap index rcts_biodata_huc4 on result_ct_sum_swap_biodata(huc_4) local parallel 4 nologging;
--rollback drop index rcts_biodata_huc4;

--changeset drsteini:1BiodataIndexesCZ
create bitmap index rcts_biodata_huc6 on result_ct_sum_swap_biodata(huc_6) local parallel 4 nologging;
--rollback drop index rcts_biodata_huc6;

--changeset drsteini:1BiodataIndexesDA
create bitmap index rcts_biodata_huc8 on result_ct_sum_swap_biodata(huc_8) local parallel 4 nologging;
--rollback drop index rcts_biodata_huc8;

--changeset drsteini:1BiodataIndexesDB
create bitmap index rcts_biodata_organization on result_ct_sum_swap_biodata(organization) local parallel 4 nologging;
--rollback drop index rcts_biodata_organization;

--changeset drsteini:1BiodataIndexesDC
create bitmap index rcts_biodata_p_code on result_ct_sum_swap_biodata(p_code) local parallel 4 nologging;
--rollback drop index rcts_biodata_p_code;

--changeset drsteini:1BiodataIndexesDD
create bitmap index rcts_biodata_sample_media on result_ct_sum_swap_biodata(sample_media) local parallel 4 nologging;
--rollback drop index rcts_biodata_sample_media;

--changeset drsteini:1BiodataIndexesDE
create bitmap index rcts_biodata_site on result_ct_sum_swap_biodata(site_id) local parallel 4 nologging;
--rollback drop index rcts_biodata_site;

--changeset drsteini:1BiodataIndexesDF
create bitmap index rcts_biodata_site_type on result_ct_sum_swap_biodata(site_type) local parallel 4 nologging;
--rollback drop index rcts_biodata_site_type;

--changeset drsteini:1BiodataIndexesDG
create bitmap index rcts_biodata_state on result_ct_sum_swap_biodata(state_code) local parallel 4 nologging;
--rollback drop index rcts_biodata_state;

--changeset drsteini:1BiodataIndexesDH
create bitmap index rcts_biodata_station on result_ct_sum_swap_biodata(station_id) local parallel 4 nologging;
--rollback drop index rcts_biodata_station;




--changeset drsteini:1BiodataIndexesDI
create bitmap index rnrs_biodata_analytical on result_nr_sum_swap_biodata(analytical_method) local parallel 4 nologging;
--rollback drop index rnrs_biodata_analytical;

--changeset drsteini:1BiodataIndexesDJ
create bitmap index rnrs_biodata_char_name on result_nr_sum_swap_biodata(characteristic_name) local parallel 4 nologging;
--rollback drop index rnrs_biodata_char_name;

--changeset drsteini:1BiodataIndexesDK
create bitmap index rnrs_biodata_char_type on result_nr_sum_swap_biodata(characteristic_type) local parallel 4 nologging;
--rollback drop index rnrs_biodata_char_type;

--changeset drsteini:1BiodataIndexesDL
create bitmap index rnrs_biodata_p_code on result_nr_sum_swap_biodata(p_code) local parallel 4 nologging;
--rollback drop index rnrs_biodata_p_code;

--changeset drsteini:1BiodataIndexesDM
create bitmap index rnrs_biodata_sample_media on result_nr_sum_swap_biodata(sample_media) local parallel 4 nologging;
--rollback drop index rnrs_biodata_sample_media;

--changeset drsteini:1BiodataIndexesDN
create bitmap index rnrs_biodata_station on result_nr_sum_swap_biodata(station_id) local parallel 4 nologging;
--rollback drop index rnrs_biodata_station;



--changeset drsteini:1BiodataIndexesDO
create bitmap index r_biodata_project on result_swap_biodata(project_id) local parallel 4 nologging;
--rollback drop index r_biodata_project;

--changeset drsteini:1BiodataIndexesDP
create bitmap index rs_biodata_project on result_sum_swap_biodata(project_id) local parallel 4 nologging;
--rollback drop index rs_biodata_project;

--changeset drsteini:1BiodataIndexesDQ
create bitmap index rcts_biodata_project on result_ct_sum_swap_biodata(project_id) local parallel 4 nologging;
--rollback drop index rcts_biodata_project;

--changeset drsteini:1BiodataIndexesDR
create bitmap index rnrs_biodata_project on result_nr_sum_swap_biodata(project_id) local parallel 4 nologging;
--rollback drop index rnrs_biodata_project;


--changeset drsteini:1BiodataIndexesDS
create bitmap index r_biodata_assemblage on result_swap_biodata(assemblage_sampled_name) local parallel 4 nologging;
--rollback drop index r_biodata_assemblage;

--changeset drsteini:1BiodataIndexesDT
create bitmap index rs_biodata_assemblage on result_sum_swap_biodata(assemblage_sampled_name) local parallel 4 nologging;
--rollback drop index rs_biodata_assemblage;

--changeset drsteini:1BiodataIndexesDU
create bitmap index rcts_biodata_assemblage on result_ct_sum_swap_biodata(assemblage_sampled_name) local parallel 4 nologging;
--rollback drop index rcts_biodata_assemblage;

--changeset drsteini:1BiodataIndexesDV
create bitmap index rnrs_biodata_assemblage on result_nr_sum_swap_biodata(assemblage_sampled_name) local parallel 4 nologging;
--rollback drop index rnrs_biodata_assemblage;

--changeset drsteini:1BiodataIndexesDW
create bitmap index r_biodata_taxa_name on result_swap_biodata(sample_tissue_taxonomic_name) local parallel 4 nologging;
--rollback drop index r_biodata_taxa_name;

--changeset drsteini:1BiodataIndexesDX
create bitmap index rs_biodata_taxa_name on result_sum_swap_biodata(taxonomic_name) local parallel 4 nologging;
--rollback drop index rs_biodata_taxa_name;

--changeset drsteini:1BiodataIndexesDY
create bitmap index rcts_biodata_taxa_name on result_ct_sum_swap_biodata(taxonomic_name) local parallel 4 nologging;
--rollback drop index rcts_biodata_taxa_name;

--changeset drsteini:1BiodataIndexesDZ
create bitmap index rnrs_biodata_taxa_name on result_nr_sum_swap_biodata(taxonomic_name) local parallel 4 nologging;
--rollback drop index rnrs_biodata_taxa_name;
