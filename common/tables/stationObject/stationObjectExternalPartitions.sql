alter table station_object split partition station_object_garbage into
(partition station_object_stewards values less than (2)
,partition station_object_nwis values less than (3)
,partition station_object_storet values less than (4)
,partition station_object_biodata values less than (5)
,partition station_object_garbage
);