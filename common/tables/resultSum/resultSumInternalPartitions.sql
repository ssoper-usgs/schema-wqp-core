alter table result_sum split partition result_sum_garbage into
(partition result_sum_nwis values less than (2)
,partition result_sum_garbage
);
