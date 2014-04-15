--liquibase formatted sql

--This is for the wqp_core schema
 
--changeset drsteini:1SchemaViewsAA
create view wqp_nemi_nwis_crosswalk as select * from wqp_nemi_nwis_crosswalk@nemi.er.usgs.gov;
--rollback drop view wqp_nemi_nwis_crosswalk;
 
--changeset drsteini:1SchemaViewsAB
create view wqp_nemi_epa_crosswalk as select * from wqp_nemi_epa_crosswalk@nemi.er.usgs.gov;
--rollback drop view wqp_nemi_epa_crosswalk;

--changeset drsteini:1SchemaViewsAC
create or replace view wqp_nemi_nwis_crosswalk as 
select analytical_procedure_source, analytical_procedure_id, citation_method_num, method_id, wqp_source, method_type
  from (select wqp_nemi_nwis_crosswalk.*,
               count(*) over (partition by analytical_procedure_source, analytical_procedure_id) cnt
          from wqp_nemi_nwis_crosswalk@nemi.er.usgs.gov)
 where cnt = 1;
--rollback create or replace view wqp_nemi_nwis_crosswalk as select * from wqp_nemi_nwis_crosswalk@nemi.er.usgs.gov;

--changeset drsteini:1SchemaViewsAD
create or replace view wqp_nemi_epa_crosswalk as 
select wqp_source, analytical_procedure_source, analytical_procedure_id, source_method_identifier, method_id, method_source, method_type
  from (select wqp_nemi_epa_crosswalk.*,
               count(*) over (partition by analytical_procedure_source, analytical_procedure_id) cnt
          from wqp_nemi_epa_crosswalk@nemi.er.usgs.gov)
 where cnt = 1;
--rollback create or replace view wqp_nemi_epa_crosswalk as select * from wqp_nemi_epa_crosswalk@nemi.er.usgs.gov;
