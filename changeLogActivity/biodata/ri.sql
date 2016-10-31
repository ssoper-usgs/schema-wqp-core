--liquibase formatted sql

--This is for the wqp_core schema

--changeset drsteini:WQP-913-create-activity_pk_biodata
alter table activity_swap_biodata add constraint activity_pk_biodata
   primary key (data_source_id, activity_id)
     rely enable novalidate;
--rollback alter table activity_swap_biodata drop constraint activity_pk_biodata;

--changeset drsteini:WQP-913-create-a_station_fk_biodata
alter table activity_swap_biodata add constraint a_station_fk_biodata
   foreign key (data_source_id, station_id)
     references station_swap_biodata (data_source_id, station_id)
       rely enable novalidate;
--rollback alter table activity_swap_biodata drop constraint a_station_fk_biodata;

--changeset drsteini:WQP-913-create-am_activity_fk_biodata
alter table act_metric_swap_biodata add constraint am_activity_fk_biodata
   foreign key (data_source_id, activity_id)
     references activity_swap_biodata (data_source_id, activity_id)
       rely enable novalidate;
--rollback alter table act_metric_swap_biodata drop constraint am_activity_fk_biodata;
