--liquibase formatted sql

--This is for the wqp_core schema

--changeset drsteini:WQP-913-create-activity_pk_storet
alter table activity_swap_storet add constraint activity_pk_storet
   primary key (data_source_id, station_id, activity_id)
     rely enable novalidate;
--rollback alter table activity_swap_storet drop constraint activity_pk_storet;

--changeset drsteini:WQP-913-create-a_station_fk_storet
alter table activity_swap_storet add constraint a_station_fk_storet
   foreign key (data_source_id, station_id)
     references station_swap_storet (data_source_id, station_id)
       rely enable novalidate;
--rollback alter table activity_swap_storet drop constraint a_station_fk_storet;

--changeset drsteini:WQP-913-create-am_activity_fk_storet
alter table act_metric_swap_storet add constraint am_activity_fk_storet
   foreign key (data_source_id, station_id, activity_id)
     references activity_swap_storet (data_source_id, station_id, activity_id)
       rely enable novalidate;
--rollback alter table act_metric_swap_storet drop constraint am_activity_fk_storet;

