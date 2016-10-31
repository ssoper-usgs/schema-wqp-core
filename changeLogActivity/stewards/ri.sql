--liquibase formatted sql

--This is for the wqp_core schema

--changeset drsteini:WQP-913-create-activity_pk_stewards
alter table activity_swap_stewards add constraint activity_pk_stewards
   primary key (data_source_id, activity_id)
     rely enable novalidate;
--rollback alter table activity_swap_stewards drop constraint activity_pk_stewards;

--changeset drsteini:WQP-913-create-a_station_fk_stewards
alter table activity_swap_stewards add constraint a_station_fk_stewards
   foreign key (data_source_id, station_id)
     references station_swap_stewards (data_source_id, station_id)
       rely enable novalidate;
--rollback alter table activity_swap_stewards drop constraint a_station_fk_stewards;

--changeset drsteini:WQP-913-create-am_activity_fk_stewards
alter table act_metric_swap_stewards add constraint am_activity_fk_stewards
   foreign key (data_source_id, activity_id)
     references activity_swap_stewards (data_source_id, activity_id)
       rely enable novalidate;
--rollback alter table act_metric_swap_stewards drop constraint am_activity_fk_stewards;
