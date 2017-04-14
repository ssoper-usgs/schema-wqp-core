create table project_dim_swap_storet
(data_source_id                 number
,code_value                     varchar2(500 char)
,project_dim_value              varchar2(4000 char)
) parallel 4 compress pctfree 0 nologging cache;
