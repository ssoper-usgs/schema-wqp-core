create table organization_sum_swap_nwis
(data_source_id                 number
,data_source                    varchar2(8 char)
,organization_id                number
,organization                   varchar2(4000 char)
,organization_name              varchar2(4000 char)
,organization_url               varchar2(4000 char)
,all_time_last_result           date
,all_time_site_count            number
,all_time_activity_count        number
,five_year_last_result          date
,five_year_site_count           number
,five_year_activity_count       number
,current_year_last_result       date
,current_year_site_count        number
,current_year_activity_count    number
,all_time_summary               clob
,five_year_summary              clob
,current_year_summary           clob
) parallel 4 compress pctfree 0 nologging cache;
