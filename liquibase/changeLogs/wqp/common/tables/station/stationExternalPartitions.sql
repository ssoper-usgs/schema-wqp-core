alter table station split partition station_garbage into
(partition station_stewards values less than (2)
,partition station_nwis values less than (3)
,partition station_storet values less than (4)
,partition station_biodata values less than (5)
,partition station_garbage
);
