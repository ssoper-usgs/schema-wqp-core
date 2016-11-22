--liquibase formatted sql

--This is for the wqp_core schema

--changeset drsteini:WQP-913-create-activity_pk
alter table activity add constraint activity_pk
   primary key (data_source_id, station_id, activity_id)
     rely enable novalidate;
--rollback alter table activity drop constraint activity_pk;

--changeset drsteini:WQP-913-create-activity_station_fk
alter table activity add constraint activity_station_fk
   foreign key (data_source_id, station_id)
     references station (data_source_id, station_id)
       rely enable novalidate;
--rollback alter table activity drop constraint activity_station_fk;

--changeset drsteini:WQP-913-create-act_metric_activity_fk
alter table act_metric add constraint act_metric_activity_fk
   foreign key (data_source_id, station_id, activity_id)
     references activity (data_source_id, station_id, activity_id)
       rely enable novalidate;
--rollback alter table act_metric drop constraint act_metric_activity_fk;
