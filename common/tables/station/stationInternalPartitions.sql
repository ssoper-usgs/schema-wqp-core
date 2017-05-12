alter table station split partition station_garbage into
(partition station_nwis values less than (2)
,partition station_garbage
);
