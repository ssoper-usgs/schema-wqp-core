create table project_object
(data_source_id                 number
,object_id                      number
,data_source                    varchar2(8 char)
,organization                   varchar2(4000 char)
,project_identifier             varchar2(4000 char)
,object_name                    varchar2(4000 char)
,object_type                    varchar2(4000 char)
,object_content                 blob
) parallel 4 compress pctfree 0 nologging cache
partition by range (data_source_id)
(partition project_object_garbage values less than (maxvalue)
);
