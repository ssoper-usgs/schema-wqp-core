alter table bio_hab_metric split partition bio_hab_metric_garbage into
(partition bio_hab_metric_nwis values less than (2)
,partition bio_hab_metric_garbage
);
