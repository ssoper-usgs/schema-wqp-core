--liquibase formatted sql

--This is for the wqp_core schema

--changeset drsteini:1StewardsRI
alter table station_swap_stewards add constraint station_pk_stewards
   primary key (data_source_id, station_id)
     rely enable novalidate;
--rollback alter table station_swap_stewards drop constraint station_pk_stewards;

--changeset drsteini:1StewardsRI
alter table station_sum_swap_stewards add constraint station_sum_pk_stewards
   primary key (data_source_id, station_id)
     rely enable novalidate;
--rollback alter table station_sum_swap_stewards drop constraint station_sum_pk_stewards;

--changeset drsteini:1StewardsRI
alter table pc_result_swap_stewards add constraint pc_result_station_fk_stewards
   foreign key (data_source_id, station_id)
     references station_swap_stewards (data_source_id, station_id)
       rely enable novalidate;
--rollback alter table pc_result_swap_stewards drop constraint pc_result_station_fk_stewards;

--changeset drsteini:1StewardsRI
alter table pc_result_sum_swap_stewards add constraint pcrs_station_fk_stewards
   foreign key (data_source_id, station_id)
     references station_sum_swap_stewards (data_source_id, station_id)
       rely enable novalidate;
--rollback alter table pc_result_sum_swap_stewards drop constraint pcrs_station_fk_stewards;

--changeset drsteini:1StewardsRI
alter table pc_result_ct_sum_swap_stewards add constraint pcrcts_station_fk_stewards
   foreign key (data_source_id, station_id)
     references station_sum_swap_stewards (data_source_id, station_id)
       rely enable novalidate;
--rollback alter table pc_result_sum_swap_stewards drop constraint pcrcts_station_fk_stewards;

--changeset drsteini:1StewardsRI
alter table pc_result_nr_sum_swap_stewards add constraint pcrnrs_station_fk_stewards
   foreign key (data_source_id, station_id)
     references station_sum_swap_stewards (data_source_id, station_id)
       rely enable novalidate;
--rollback alter table pc_result_sum_swap_stewards drop constraint pcrnrs_station_fk_stewards;
