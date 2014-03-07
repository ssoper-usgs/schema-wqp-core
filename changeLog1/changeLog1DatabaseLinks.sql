--liquibase formatted sql

--This is for the wqp_core schema
 
--changeset drsteini:1SchemaDbLinksAA
create database link nemi.er.usgs.gov connect to nemi_data identified by ${nemiDataPwd} using '${nemiDataDB}';
--rollback drop database link nemi.er.usgs.gov;

