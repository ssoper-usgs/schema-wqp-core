alter table station_sum split partition station_sum_garbage into
(partition station_sum_nwis values less than (2)
,partition station_sum_garbage
);
