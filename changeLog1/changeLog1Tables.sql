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

--changeset drsteini:1SchemaTablesAB
create table web_service_log
(request_timestamp              timestamp(3)        constraint web_service_log_timestamp_nn not null    default systimestamp
,origin                         varchar2(100 char)  constraint web_service_log_origin_nn not null
,call_type                      varchar2(100 char)  constraint web_service_log_call_type_nn not null
,endpoint                       varchar2(100 char)  constraint web_service_log_endpoint_nn not null
,query_string                   varchar2(1000 char) constraint web_service_log_query_str_nn not null
,total_rows_expected            number
,data_store_counts              clob
);
--rollback drop table web_service_log cascade constraints purge;
