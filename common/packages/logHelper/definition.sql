create or replace package log_helper as

    function add_log(p_origin        in web_service_log.origin%type,
                     p_call_type     in web_service_log.call_type%type,
                     p_endpoint      in web_service_log.endpoint%type,
                     p_query_string  in web_service_log.query_string%type,
                     p_post_data     in web_service_log.post_data%type)
        return number;

    procedure log_head_complete(p_web_service_log_id  in web_service_log.web_service_log_id%type,
                                p_total_rows_expected in web_service_log.total_rows_expected%type,
                                p_data_store_counts   in web_service_log.data_store_counts%type);

    procedure log_first_row(p_web_service_log_id in web_service_log.web_service_log_id%type);

    procedure log_request_complete(p_web_service_log_id in web_service_log.web_service_log_id%type,
                                   p_http_status_code   in web_service_log.http_status_code%type);

end log_helper;
