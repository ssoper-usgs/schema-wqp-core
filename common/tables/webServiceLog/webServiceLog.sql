create table web_service_log
(web_service_log_id             number              generated as identity
,request_timestamp_utc          timestamp(3)        default sys_extract_utc(systimestamp) constraint web_service_log_timestamp_nn not null
,head_sent_utc                  timestamp(3)
,first_row_sent_utc             timestamp(3)
,request_completed_utc          timestamp(3)
,origin                         varchar2(100 char)  constraint web_service_log_origin_nn not null
,call_type                      varchar2(100 char)  constraint web_service_log_call_type_nn not null
,endpoint                       varchar2(100 char)  constraint web_service_log_endpoint_nn not null
,query_string                   varchar2(4000 char) constraint web_service_log_query_str_nn not null
,total_rows_expected            number
,data_store_counts              varchar2(1000 char)
,http_status_code               varchar2(100 char)
,post_data                      clob
);
