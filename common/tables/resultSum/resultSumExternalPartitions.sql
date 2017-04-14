alter table result_sum split partition result_sum_garbage into
(partition result_sum_stewards values less than (2)
,partition result_sum_nwis values less than (3)
,partition result_sum_storet values less than (4)
,partition result_sum_biodata values less than (5)
,partition result_sum_garbage
);
