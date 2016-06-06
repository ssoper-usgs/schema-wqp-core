--liquibase formatted sql

--changeset drsteini:WQP-807_create_typ_vctbl
create or replace type typ_vctbl as table of varchar2(256);
--rollback drop type typ_vctbl;
