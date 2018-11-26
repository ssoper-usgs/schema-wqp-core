alter table activity split partition activity_garbage into
(partition activity_stewards values less than (2)
,partition activity_nwis values less than (3)
,partition activity_storet values less than (4)
,partition activity_biodata values less than (5)
,partition activity_garbage
);
