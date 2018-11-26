alter table station_object split partition station_object_garbage into
(partition station_object_nwis values less than (2)
,partition station_object_garbage
);