--liquibase formatted sql

--This is for the wqp_core schema
 
--changeset drsteini:1SchemaGrantsAA
grant select on wqp_nemi_nwis_crosswalk to nwis_ws_star;
--rollback revoke select on wqp_nemi_nwis_crosswalk from nwis_ws_star;

--changeset drsteini:1SchemaGrantsAB
grant select on nwis_method_codes to wqp_user;
--rollback revoke select on nwis_method_codes from wqp_user;
