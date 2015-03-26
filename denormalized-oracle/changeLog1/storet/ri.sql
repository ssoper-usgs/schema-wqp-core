--liquibase formatted sql

--This is for the wqp_core schema

--changeset drsteini:1StoretRIAA
alter table station_swap_storet add constraint s_storet_pk
   primary key (data_source_id, station_id)
     rely enable novalidate;
--rollback alter table station_swap_storet drop constraint s_storet_pk;

--changeset drsteini:1StoretRIAB
alter table station_sum_swap_storet add constraint ss_storet_pk
   primary key (data_source_id, station_id)
     rely enable novalidate;
--rollback alter table station_sum_swap_storet drop constraint ss_storet_pk;

--changeset drsteini:1StoretRIAC
alter table pc_result_swap_storet add constraint pc_result_station_fk_storet
   foreign key (data_source_id, station_id)
     references station_swap_storet (data_source_id, station_id)
       rely enable novalidate;
--rollback alter table pc_result_swap_storet drop constraint pc_result_station_fk_storet;

--changeset drsteini:1StoretRIAD
alter table pc_result_sum_swap_storet add constraint pcrs_station_fk_storet
   foreign key (data_source_id, station_id)
     references station_sum_swap_storet (data_source_id, station_id)
       rely enable novalidate;
--rollback alter table pc_result_sum_swap_storet drop constraint pcrs_station_fk_storet;

--changeset drsteini:1StoretRIAE
alter table pc_result_ct_sum_swap_storet add constraint pcrcts_station_fk_storet
   foreign key (data_source_id, station_id)
     references station_sum_swap_storet (data_source_id, station_id)
       rely enable novalidate;
--rollback alter table pc_result_sum_swap_storet drop constraint pcrcts_station_fk_storet;

--changeset drsteini:1StoretRIAF
alter table pc_result_nr_sum_swap_storet add constraint pcrnrs_station_fk_storet
   foreign key (data_source_id, station_id)
     references station_sum_swap_storet (data_source_id, station_id)
       rely enable novalidate;
--rollback alter table pc_result_sum_swap_storet drop constraint pcrnrs_station_fk_storet;
