alter table activity_object split partition activity_object_garbage into
(partition activity_object_nwis values less than (2)
,partition activity_object_garbage
);