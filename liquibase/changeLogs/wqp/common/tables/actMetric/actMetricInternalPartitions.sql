alter table act_metric split partition act_metric_garbage into
(partition act_metric_nwis values less than (2)
,partition act_metric_garbage
);
