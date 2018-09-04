create table wqx_attached_object_result
(org_uid                        number
,ref_uid                        number
,result_object_name             varchar2(4000 char)
,result_object_type             varchar2(4000 char)
) parallel 4 compress pctfree 0 nologging cache;
