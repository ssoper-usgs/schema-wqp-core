create table wqx_result_taxon_feeding_group
(res_uid                        number
,feeding_group_list             varchar2(4000 char)
) parallel 4 compress pctfree 0 nologging cache;
