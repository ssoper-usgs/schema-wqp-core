--liquibase formatted sql

--This is for the wqp_core schema

--changeset drsteini:1RIAA
alter table wqp_results_d add constraint results_station_fk_d foreign key (station_id) references stations_d (station_id);
--rollback alter table wqp_results_d drop constraint results_station_fk_d;
