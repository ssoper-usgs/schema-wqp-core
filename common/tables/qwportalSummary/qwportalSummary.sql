create table qwportal_summary
(data_source_id                 number
,fips_state_code                varchar2(2 char)
,fips_county_code               varchar2(3 char)
,fips_state_and_county          varchar2(5 char)
,site_type                      varchar2(30 char)
,huc8                           varchar2(8 char)
,min_date                       date
,max_date                       date
,samples_past_12_months         number
,samples_past_60_months         number
,samples_all_time               number
,results_past_12_months         number
,results_past_60_months         number
,results_all_time               number
,nwis_or_epa                    generated always as (case data_source_id when 2 then 'N' when 3 then 'E' else null end)
) parallel 4 compress pctfree 0 nologging cache
partition by range (data_source_id)
(partition summary_garbage values less than (maxvalue)
);
