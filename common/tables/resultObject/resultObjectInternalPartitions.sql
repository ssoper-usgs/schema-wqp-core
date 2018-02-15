alter table result_object split partition result_object_garbage into
(partition result_object_nwis values less than (2)
,partition result_object_garbage
);