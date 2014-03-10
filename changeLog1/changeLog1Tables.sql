--liquibase formatted sql

--This is for the wqp_core schema
 
--changeset drsteini:1SchemaTablesAA
create table nwis_method_codes
(parameter_code                 varchar2(5 char)    constraint nwis_method_codes_parameter_nn not null
,method_code                    varchar2(5 char)    constraint nwis_method_codes_method_cd_nn not null
,method_description             varchar2(256 char)
,method_source_code             varchar2(8 char)
,citation_method_number         varchar2(32 char)
,citation_name                  varchar2(50 char)
);
--rollback drop table nwis_method_codes cascade constraints purge;
