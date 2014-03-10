--liquibase formatted sql

--This is for the wqp_core schema
 
--changeset drsteini:1SchemaViewsAA
create view wqp_nemi_nwis_crosswalk as select * from wqp_nemi_nwis_crosswalk@nemi.er.usgs.gov;
--rollback drop view wqp_nemi_nwis_crosswalk;
 
--changeset drsteini:1SchemaViewsAB
create view wqp_nemi_epa_crosswalk as select * from wqp_nemi_epa_crosswalk@nemi.er.usgs.gov;
--rollback drop view wqp_nemi_epa_crosswalk;
