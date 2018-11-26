create table etl_threshold
(data_source_id                 number
,table_name                     varchar2(30 char)
,min_rows                       number
,max_diff                       number
);
