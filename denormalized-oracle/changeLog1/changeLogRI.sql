--liquibase formatted sql

--This is for the wqp_core schema

--changeset drsteini:1RIAA
alter table wqp_results add constraint results_station_fk foreign key (station_id) references stations (station_id);
--rollback alter table wqp_results drop contraint results_station_fk;
