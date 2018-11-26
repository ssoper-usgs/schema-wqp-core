create table wqx_activity_conducting_org
(act_uid                        number
,acorg_name_list                varchar2(4000 char)
) parallel 4 compress pctfree 0 nologging cache;
