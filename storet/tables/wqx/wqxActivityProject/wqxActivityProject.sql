create table wqx_activity_project
(act_uid                        number
,project_id_list                varchar2(4000 char)
) parallel 4 compress pctfree 0 nologging cache;
