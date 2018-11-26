alter table activity_sum split partition activity_sum_garbage into
(partition activity_sum_nwis values less than (2)
,partition activity_sum_garbage
);
