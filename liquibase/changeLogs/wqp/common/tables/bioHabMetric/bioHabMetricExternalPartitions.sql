alter table bio_hab_metric split partition bio_hab_metric_garbage into
(partition bio_hab_metric_stewards values less than (2)
,partition bio_hab_metric_nwis values less than (3)
,partition bio_hab_metric_storet values less than (4)
,partition bio_hab_metric_biodata values less than (5)
,partition bio_hab_metric_garbage
);
