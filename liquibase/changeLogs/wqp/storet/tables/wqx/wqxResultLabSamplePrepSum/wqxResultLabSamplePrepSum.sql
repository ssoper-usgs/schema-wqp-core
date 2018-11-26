create table wqx_result_lab_sample_prep_sum
(res_uid                        number
,result_lab_sample_prep_count   number
) parallel 4 compress pctfree 0 nologging cache;
