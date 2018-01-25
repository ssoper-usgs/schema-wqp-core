create table station_object
(data_source_id                 number
,object_id                      number
,data_source                    varchar2(8 char)
,organization                   varchar2(4000 char)
,station_id                     number
,object_name                    varchar2(4000 char)
,object_type                    varchar2(4000 char)
,object_content                 blob
) parallel 4 compress pctfree 0 nologging cache
partition by range (data_source_id)
(partition station_object_garbage values less than (maxvalue)
);
