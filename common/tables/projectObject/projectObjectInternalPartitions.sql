alter table project_object split partition project_object_garbage into
(partition project_object_nwis values less than (2)
,partition project_object_garbage
);