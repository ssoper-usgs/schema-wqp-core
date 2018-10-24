create table ml_grouping
(data_source_id                 number
,data_source                    varchar2(8 char)
,station_id                     number
,the_year                       varchar2(4 char)
,years_window                   number
,characteristic_type            varchar2(4000 char)
,characteristic_name            varchar2(4000 char)
,total_activities               number
,total_results                  number
,last_result_date               date
,grouping_id                    number
) parallel 4 compress pctfree 0 nologging cache
partition by range (data_source_id)
(partition ml_grouping_garbage values less than (maxvalue)
);
