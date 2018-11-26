create table wqx_activity_metric_sum
(act_uid                        number
,activity_metric_count          number
) parallel 4 compress pctfree 0 nologging cache;
