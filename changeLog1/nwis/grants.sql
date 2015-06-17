--liquibase formatted sql

--This is for the wqp_core schema
 
--changeset drsteini:1NwisGrantsAM
grant select on public_srsnames_00000 to wqp_user;
--rollback revoke select on public_srsnames_00000 from wqp_user;
 
