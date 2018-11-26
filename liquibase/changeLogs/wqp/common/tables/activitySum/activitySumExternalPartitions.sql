alter table activity_sum split partition activity_sum_garbage into
(partition activity_sum_stewards values less than (2)
,partition activity_sum_nwis values less than (3)
,partition activity_sum_storet values less than (4)
,partition activity_sum_biodata values less than (5)
,partition activity_sum_garbage
);
