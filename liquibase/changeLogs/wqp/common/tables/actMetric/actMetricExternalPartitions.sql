alter table act_metric split partition act_metric_garbage into
(partition act_metric_stewards values less than (2)
,partition act_metric_nwis values less than (3)
,partition act_metric_storet values less than (4)
,partition act_metric_biodata values less than (5)
,partition act_metric_garbage
);
