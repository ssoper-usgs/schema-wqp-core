create table wqx_attached_object_activity
(org_uid                        number
,ref_uid                        number
,activity_object_name           varchar2(4000 char)
,activity_object_type           varchar2(4000 char)
) parallel 4 compress pctfree 0 nologging cache;
