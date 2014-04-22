--liquibase formatted sql

--This is for the wqp_core schema
 
--changeset drsteini:1SchemaTypesAA
create or replace type typ_vctbl as table of varchar2(256);
--rollback drop type typ_vctbl;
