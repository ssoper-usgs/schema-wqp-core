create table activity_object_swap_stewards
(data_source_id                 number
,object_id                      number
,data_source                    varchar2(8 char)
,activity_id                    number
,organization                   varchar2(4000 char)
,activity                       varchar2(4000 char)
,object_name                    varchar2(4000 char)
,object_type                    varchar2(4000 char)
,object_content                 blob
) parallel 4 compress pctfree 0 nologging cache;
