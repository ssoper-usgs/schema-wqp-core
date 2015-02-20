--liquibase formatted sql

--This is for the wqp_core schema

--changeset drsteini:1StoretRI
alter table station_swap_storet add constraint station_pk_storet
   primary key (data_source_id, station_id)
     rely enable novalidate;
--rollback alter table station_swap_storet drop constraint station_pk_storet;

--changeset drsteini:1StoretRI
alter table station_sum_swap_storet add constraint station_sum_pk_storet
   primary key (data_source_id, station_id)
     rely enable novalidate;
--rollback alter table station_sum_swap_storet drop constraint station_sum_pk_storet;

--changeset drsteini:1StoretRI
alter table pc_result_swap_storet add constraint pc_result_station_fk_storet
   foreign key (data_source_id, station_id)
     references station_swap_storet (data_source_id, station_id)
       rely enable novalidate;
--rollback alter table pc_result_swap_storet drop constraint pc_result_station_fk_storet;

--changeset drsteini:1StoretRI
alter table pc_result_sum_swap_storet add constraint pcrs_station_fk_storet
   foreign key (data_source_id, station_id)
     references station_sum_swap_storet (data_source_id, station_id)
       rely enable novalidate;
--rollback alter table pc_result_sum_swap_storet drop constraint pcrs_station_fk_storet;

--changeset drsteini:1StoretRI
alter table pc_result_ct_sum_swap_storet add constraint pcrcts_station_fk_storet
   foreign key (data_source_id, station_id)
     references station_sum_swap_storet (data_source_id, station_id)
       rely enable novalidate;
--rollback alter table pc_result_sum_swap_storet drop constraint pcrcts_station_fk_storet;

--changeset drsteini:1StoretRI
alter table pc_result_nr_sum_swap_storet add constraint pcrnrs_station_fk_storet
   foreign key (data_source_id, station_id)
     references station_sum_swap_storet (data_source_id, station_id)
       rely enable novalidate;
--rollback alter table pc_result_sum_swap_storet drop constraint pcrnrs_station_fk_storet;
