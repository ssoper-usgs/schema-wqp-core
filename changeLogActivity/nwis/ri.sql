--liquibase formatted sql

--This is for the wqp_core schema

--changeset drsteini:WQP-913-create-activity_pk_nwis
alter table activity_swap_nwis add constraint activity_pk_nwis
   primary key (data_source_id, station_id, activity_id)
     rely enable novalidate;
--rollback alter table activity_swap_nwis drop constraint activity_pk_nwis;

--changeset drsteini:WQP-913-create-a_station_fk_nwis
alter table activity_swap_nwis add constraint a_station_fk_nwis
   foreign key (data_source_id, station_id)
     references station_swap_nwis (data_source_id, station_id)
       rely enable novalidate;
--rollback alter table activity_swap_nwis drop constraint a_station_fk_nwis;

--changeset drsteini:WQP-913-create-am_activity_fk_nwis
alter table act_metric_swap_nwis add constraint am_activity_fk_nwis
   foreign key (data_source_id, station_id, activity_id)
     references activity_swap_nwis (data_source_id, station_id, activity_id)
       rely enable novalidate;
--rollback alter table act_metric_swap_nwis drop constraint am_activity_fk_nwis;
