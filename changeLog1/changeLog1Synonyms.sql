--liquibase formatted sql

--This is for the wqp_core schema
 
--changeset drsteini:1SchemaSynonymsAA
create or replace synonym wqp_nemi_nwis_crosswalk for wqp_nemi_nwis_crosswalk@nemi.er.usgs.gov;
--rollback drop synonym wqp_nemi_nwis_crosswalk;

--changeset drsteini:1SchemaSynonymsAB
create or replace synonym wqp_nemi_epa_crosswalk for wqp_nemi_epa_crosswalk@nemi.er.usgs.gov;
--rollback drop synonym wqp_nemi_epa_crosswalk;
