--liquibase formatted sql

--This is for the wqp_core schema
 
--changeset drsteini:1SchemaDbLinksAA
create database link nemi.er.usgs.gov connect to nemi_data identified by ${nemiDataPwd} using '${nemiDataDB}';
--rollback drop database link nemi.er.usgs.gov;

--changeset drsteini:1SchemaDbLinksAB
create database link nwq_stg.er.usgs.gov connect to nwq_stg identified by ${nwqStgPwd} using '${nwqStgDB}';
--rollback drop database link nwq_stg.er.usgs.gov;
