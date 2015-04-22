--liquibase formatted sql

--This is for the wqp_core schema

--changeset drsteini:1StoretSynonymsAA
create or replace synonym fa_station_no_source for station_no_source_00000;
--rollback drop synonym fa_station_no_source;

--changeset drsteini:1StoretSynonymsAB
create or replace synonym fa_result_no_source for result_no_source_00000;
--rollback drop synonym fa_result_no_source;
