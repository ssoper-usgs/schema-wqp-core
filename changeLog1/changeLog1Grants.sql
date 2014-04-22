--liquibase formatted sql

--This is for the wqp_core schema
 
--changeset drsteini:1SchemaGrantsAA
grant select on wqp_nemi_nwis_crosswalk to nwis_ws_star;
--rollback revoke select on wqp_nemi_nwis_crosswalk from nwis_ws_star;

--changeset drsteini:1SchemaGrantsAB
grant select on nwis_method_codes to wqp_user;
--rollback revoke select on nwis_method_codes from wqp_user;

--changeset drsteini:1SchemaGrantsAC
grant select, insert on web_service_log to wqp_user;
--rollback revoke select, insert on web_service_log from wqp_user;

--changeset drsteini:1SchemaGrantsAD
grant execute on typ_vctbl to nwis_ws_user;
--rollback revoke execute on typ_vctbl from nwis_ws_user;

--changeset drsteini:1SchemaGrantsAE
grant execute on typ_vctbl to ars_stewards_user;
--rollback revoke execute on typ_vctbl from ars_stewards_user;

--changeset drsteini:1SchemaGrantsAF
grant execute on typ_vctbl to storetuser;
--rollback revoke execute on typ_vctbl from storetuser;

--changeset drsteini:1SchemaGrantsAG
grant execute on pkg_dynamic_list to nwis_ws_user;
--rollback revoke execute on pkg_dynamic_list from nwis_ws_user;

--changeset drsteini:1SchemaGrantsAH
grant execute on pkg_dynamic_list to ars_stewards_user;
--rollback revoke execute on pkg_dynamic_list from ars_stewards_user;

--changeset drsteini:1SchemaGrantsAI
grant execute on pkg_dynamic_list to storetuser;
--rollback revoke execute on pkg_dynamic_list from storetuser;
