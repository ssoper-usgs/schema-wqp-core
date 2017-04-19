alter table station_sum split partition station_sum_garbage into
(partition station_sum_stewards values less than (2)
,partition station_sum_nwis values less than (3)
,partition station_sum_storet values less than (4)
,partition station_sum_biodata values less than (5)
,partition station_sum_garbage
);
