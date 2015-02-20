--liquibase formatted sql

--This is for the wqp_core schema

--changeset drsteini:1CommonRI
alter table station add constraint station_pk
   primary key (data_source_id, station_id)
     rely enable novalidate;
--rollback alter table station drop constraint station_pk;

--changeset drsteini:1CommonRI
alter table station_sum add constraint station_sum_pk
   primary key (data_source_id, station_id)
     rely enable novalidate;
--rollback alter table station_sum drop constraint station_sum_pk;

--changeset drsteini:1CommonRI
alter table pc_result add constraint pc_result_station_fk
   foreign key (data_source_id, station_id)
     references station (data_source_id, station_id)
       rely enable novalidate;
--rollback alter table pc_result drop constraint pc_result_station_fk;

--changeset drsteini:1CommonRI
alter table pc_result_sum add constraint pc_result_sum_station_fk
   foreign key (data_source_id, station_id)
     references station_sum (data_source_id, station_id)
       rely enable novalidate;
--rollback alter table pc_result_sum drop constraint pc_result_sum_station_fk;

--changeset drsteini:1CommonRI
alter table pc_result_ct_sum add constraint pc_result_ct_sum_station_fk
   foreign key (data_source_id, station_id)
     references station_sum (data_source_id, station_id)
       rely enable novalidate;
--rollback alter table pc_result_sum drop constraint pc_result_sum_station_fk;

--changeset drsteini:1CommonRI
alter table pc_result_nr_sum add constraint pc_result_nr_sum_station_fk
   foreign key (data_source_id, station_id)
     references station_sum (data_source_id, station_id)
       rely enable novalidate;
--rollback alter table pc_result_sum drop constraint pc_result_sum_station_fk;
