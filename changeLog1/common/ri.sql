--liquibase formatted sql

--This is for the wqp_core schema

--changeset drsteini:1CommonRIAA
alter table station add constraint station_pk
   primary key (data_source_id, station_id)
     rely enable novalidate;
--rollback alter table station drop constraint station_pk;

--changeset drsteini:1CommonRIAB
alter table station_sum add constraint station_sum_pk
   primary key (data_source_id, station_id)
     rely enable novalidate;
--rollback alter table station_sum drop constraint station_sum_pk;

--changeset drsteini:1CommonRIAC
alter table result add constraint result_station_fk
   foreign key (data_source_id, station_id)
     references station (data_source_id, station_id)
       rely enable novalidate;
--rollback alter table result drop constraint result_station_fk;

--changeset drsteini:1CommonRIAD
alter table result_sum add constraint result_sum_station_fk
   foreign key (data_source_id, station_id)
     references station_sum (data_source_id, station_id)
       rely enable novalidate;
--rollback alter table result_sum drop constraint result_sum_station_fk;

--changeset drsteini:1CommonRIAE
alter table result_ct_sum add constraint result_ct_sum_station_fk
   foreign key (data_source_id, station_id)
     references station_sum (data_source_id, station_id)
       rely enable novalidate;
--rollback alter table result_ct_sum drop constraint result_ct_sum_station_fk;

--changeset drsteini:1CommonRIAF
alter table result_nr_sum add constraint result_nr_sum_station_fk
   foreign key (data_source_id, station_id)
     references station_sum (data_source_id, station_id)
       rely enable novalidate;
--rollback alter table result_nr_sum drop constraint result_nr_sum_station_fk;
