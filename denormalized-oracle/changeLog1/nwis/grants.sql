--liquibase formatted sql

--This is for the wqp_core schema
 
--changeset drsteini:1NwisGrantsAM
grant select on public_srsnames to wqp_user;
--rollback revoke select on public_srsnames from wqp_user;
 
