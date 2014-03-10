--liquibase formatted sql

--This is for the wqp_core schema
 
--changeset drsteini:1SchemaSynonymsAA
create or replace synonym lu_cit for lu_cit@nwq_stg.er.usgs.gov;
--rollback drop synonym lu_cit;

--changeset drsteini:1SchemaSynonymsAB
create or replace synonym lu_cit_meth for lu_cit_meth@nwq_stg.er.usgs.gov;
--rollback drop synonym lu_cit_meth;

--changeset drsteini:1SchemaSynonymsAC
create or replace synonym lu_meth for lu_meth@nwq_stg.er.usgs.gov;
--rollback drop synonym lu_meth;

--changeset drsteini:1SchemaSynonymsAD
create or replace synonym lu_parm for lu_parm@nwq_stg.er.usgs.gov;
--rollback drop synonym lu_parm;

--changeset drsteini:1SchemaSynonymsAE
create or replace synonym lu_parm_alias for lu_parm_alias@nwq_stg.er.usgs.gov;
--rollback drop synonym lu_parm_alias;

--changeset drsteini:1SchemaSynonymsAF
create or replace synonym lu_parm_meth for lu_parm_meth@nwq_stg.er.usgs.gov;
--rollback drop synonym lu_parm_meth;
