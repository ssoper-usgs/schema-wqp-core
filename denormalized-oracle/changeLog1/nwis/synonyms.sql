--liquibase formatted sql

--This is for the wqp_core schema

----changeset drsteini:1NwisSynonymsAA
create or replace synonym public_srsnames for public_srsnames_00000;
--rollback drop synonym public_srsnames;
