create table project_dim
(data_source_id                 number
,code_value                     varchar2(500 char)
,project_dim_value              varchar2(4000 char)
) parallel 4 compress pctfree 0 nologging cache
partition by range (data_source_id)
(partition project_dim_garbage values less than (maxvalue)
);
