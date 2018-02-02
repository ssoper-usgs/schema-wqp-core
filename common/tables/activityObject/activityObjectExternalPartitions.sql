alter table activity_object split partition activity_object_garbage into
(partition activity_object_stewards values less than (2)
,partition activity_object_nwis values less than (3)
,partition activity_object_storet values less than (4)
,partition activity_object_biodata values less than (5)
,partition activity_object_garbage
);