--liquibase formatted sql

--This is for the wqp_core schema
 
--changeset drsteini:1GrantsAA
grant select on char_name to wqp_user;
--rollback revoke select on char_name from wqp_user;
 
--changeset drsteini:1GrantsAB
grant select on char_type to wqp_user;
--rollback revoke select on char_type from wqp_user;
 
--changeset drsteini:1GrantsAC
grant select on country to wqp_user;
--rollback revoke select on country from wqp_user;
 
--changeset drsteini:1GrantsAD
grant select on county to wqp_user;
--rollback revoke select on county from wqp_user;
 
--changeset drsteini:1GrantsAE
grant select on data_source to wqp_user;
--rollback revoke select on data_source from wqp_user;
 
--changeset drsteini:1GrantsAG
grant select on last_etl to wqp_user;
--rollback revoke select on last_etl from wqp_user;
 
--changeset drsteini:1GrantsAH
grant select on organization to wqp_user;
--rollback revoke select on organization from wqp_user;
 
--changeset drsteini:1GrantsAI
grant select on pc_result to wqp_user;
--rollback revoke select on pc_result from wqp_user;
 
--changeset drsteini:1GrantsAJ
grant select on pc_result_ct_sum to wqp_user;
--rollback revoke select on pc_result_ct_sum from wqp_user;
 
--changeset drsteini:1GrantsAK
grant select on pc_result_nr_sum to wqp_user;
--rollback revoke select on pc_result_nr_sum from wqp_user;
 
--changeset drsteini:1GrantsAL
grant select on pc_result_sum to wqp_user;
--rollback revoke select on pc_result_sum from wqp_user;
 
--changeset drsteini:1GrantsAN
grant select on qwportal_summary to wqp_user;
--rollback revoke select on qwportal_summary from wqp_user;
 
--changeset drsteini:1GrantsAO
grant select on sample_media to wqp_user;
--rollback revoke select on sample_media from wqp_user;
 
--changeset drsteini:1GrantsAP
grant select on site_type to wqp_user;
--rollback revoke select on site_type from wqp_user;
 
--changeset drsteini:1GrantsAQ
grant select on state to wqp_user;
--rollback revoke select on state from wqp_user;
 
--changeset drsteini:1GrantsAR
grant select on station to wqp_user;
--rollback revoke select on station from wqp_user;
 
--changeset drsteini:1GrantsAS
grant select on station_sum to wqp_user;
--rollback revoke select on station_sum from wqp_user;
 
--changeset drsteini:1GrantsAT
grant execute on log_helper to wqp_user;
--rollback revoke execute on log_helper from wqp_user;
 
--changeset drsteini:1GrantsAU
grant select on project to wqp_user;
--rollback revoke select on project from wqp_user;
