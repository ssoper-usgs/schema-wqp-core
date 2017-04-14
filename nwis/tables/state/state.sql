create table state_swap_nwis
(data_source_id                 number
,code_value                     varchar2(500 char)
,description_with_country       varchar2(57 char)
,description_with_out_country   varchar2(53 char)
,country_code                   generated always as (regexp_substr(code_value, '[^:]+'))
) parallel 4 compress pctfree 0 nologging cache;
