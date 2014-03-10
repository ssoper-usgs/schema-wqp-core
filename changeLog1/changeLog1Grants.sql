--liquibase formatted sql

--This is for the wqp_core schema
 
--changeset drsteini:1SchemaGrantsAA
grant select on wqp_nemi_nwis_crosswalk to nwis_ws_star;
--rollback revoke select on wqp_nemi_nwis_crosswalk from nwis_ws_star;
