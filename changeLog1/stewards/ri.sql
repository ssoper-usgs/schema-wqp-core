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
alter table result_swap_stewards add constraint result_station_fk_stewards
   foreign key (data_source_id, station_id)
     references station_swap_stewards (data_source_id, station_id)
       rely enable novalidate;
--rollback alter table result_swap_stewards drop constraint result_station_fk_stewards;

--changeset drsteini:1StewardsRIAD
alter table result_sum_swap_stewards add constraint rs_station_fk_stewards
   foreign key (data_source_id, station_id)
     references station_sum_swap_stewards (data_source_id, station_id)
       rely enable novalidate;
--rollback alter table result_sum_swap_stewards drop constraint rs_station_fk_stewards;

--changeset drsteini:1StewardsRIAE
alter table result_ct_sum_swap_stewards add constraint rcts_station_fk_stewards
   foreign key (data_source_id, station_id)
     references station_sum_swap_stewards (data_source_id, station_id)
       rely enable novalidate;
--rollback alter table result_ct_sum_swap_stewards drop constraint rcts_station_fk_stewards;

--changeset drsteini:1StewardsRIAF
alter table result_nr_sum_swap_stewards add constraint rnrs_station_fk_stewards
   foreign key (data_source_id, station_id)
     references station_sum_swap_stewards (data_source_id, station_id)
       rely enable novalidate;
--rollback alter table result_nr_sum_swap_stewards drop constraint rnrs_station_fk_stewards;
