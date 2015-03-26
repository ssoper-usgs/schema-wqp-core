--liquibase formatted sql

--This is for the wqp_core schema

--changeset drsteini:1NwisRIAA
alter table station_swap_nwis add constraint s_nwis_pk
   primary key (data_source_id, station_id)
     rely enable novalidate;
--rollback alter table station_swap_nwis drop constraint s_nwis_pk;

--changeset drsteini:1NwisRIAB
alter table station_sum_swap_nwis add constraint ss_nwis_pk
   primary key (data_source_id, station_id)
     rely enable novalidate;
--rollback alter table station_sum_swap_nwis drop constraint ss_nwis_pk;

--changeset drsteini:1NwisRIAC
alter table pc_result_swap_nwis add constraint pc_result_station_fk_nwis
   foreign key (data_source_id, station_id)
     references station_swap_nwis (data_source_id, station_id)
       rely enable novalidate;
--rollback alter table pc_result_swap_nwis drop constraint pc_result_station_fk_nwis;

--changeset drsteini:1NwisRIAD
alter table pc_result_sum_swap_nwis add constraint pcrs_station_fk_nwis
   foreign key (data_source_id, station_id)
     references station_sum_swap_nwis (data_source_id, station_id)
       rely enable novalidate;
--rollback alter table pc_result_sum_swap_nwis drop constraint pcrs_station_fk_nwis;

--changeset drsteini:1NwisRIAE
alter table pc_result_ct_sum_swap_nwis add constraint pcrcts_station_fk_nwis
   foreign key (data_source_id, station_id)
     references station_sum_swap_nwis (data_source_id, station_id)
       rely enable novalidate;
--rollback alter table pc_result_sum_swap_nwis drop constraint pcrcts_station_fk_nwis;

--changeset drsteini:1NwisRIAF
alter table pc_result_nr_sum_swap_nwis add constraint pcrnrs_station_fk_nwis
   foreign key (data_source_id, station_id)
     references station_sum_swap_nwis (data_source_id, station_id)
       rely enable novalidate;
--rollback alter table pc_result_sum_swap_nwis drop constraint pcrnrs_station_fk_nwis;
