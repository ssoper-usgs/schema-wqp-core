create table wqx_result_taxon_habit
(res_uid                        number
,habit_name_list                varchar2(4000 char)
) parallel 4 compress pctfree 0 nologging cache;
