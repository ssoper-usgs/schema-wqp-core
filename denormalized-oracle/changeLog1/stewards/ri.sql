--liquibase formatted sql

--This is for the wqp_core schema

--changeset drsteini:1StewardsRIAA
alter table station_swap_stewards add constraint s_stewards_pk
   primary key (data_source_id, station_id)
     rely enable novalidate;
--rollback alter table station_swap_stewards drop constraint s_stewards_pk;

--changeset drsteini:1StewardsRIAB
alter table station_sum_swap_stewards add constraint ss_stewards_pk
   primary key (data_source_id, station_id)
     rely enable novalidate;
--rollback alter table station_sum_swap_stewards drop constraint ss_stewards_pk;

--changeset drsteini:1StewardsRIAC
alter table pc_result_swap_stewards add constraint pc_result_station_fk_stewards
   foreign key (data_source_id, station_id)
     references station_swap_stewards (data_source_id, station_id)
       rely enable novalidate;
--rollback alter table pc_result_swap_stewards drop constraint pc_result_station_fk_stewards;

--changeset drsteini:1StewardsRIAD
alter table pc_result_sum_swap_stewards add constraint pcrs_station_fk_stewards
   foreign key (data_source_id, station_id)
     references station_sum_swap_stewards (data_source_id, station_id)
       rely enable novalidate;
--rollback alter table pc_result_sum_swap_stewards drop constraint pcrs_station_fk_stewards;

--changeset drsteini:1StewardsRIAE
alter table pc_result_ct_sum_swap_stewards add constraint pcrcts_station_fk_stewards
   foreign key (data_source_id, station_id)
     references station_sum_swap_stewards (data_source_id, station_id)
       rely enable novalidate;
--rollback alter table pc_result_ct_sum_swap_stewards drop constraint pcrcts_station_fk_stewards;

--changeset drsteini:1StewardsRIAF
alter table pc_result_nr_sum_swap_stewards add constraint pcrnrs_station_fk_stewards
   foreign key (data_source_id, station_id)
     references station_sum_swap_stewards (data_source_id, station_id)
       rely enable novalidate;
--rollback alter table pc_result_nr_sum_swap_stewards drop constraint pcrnrs_station_fk_stewards;
