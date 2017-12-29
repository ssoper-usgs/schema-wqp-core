alter table project_object split partition project_object_garbage into
(partition project_object_stewards values less than (2)
,partition project_object_nwis values less than (3)
,partition project_object_storet values less than (4)
,partition project_object_biodata values less than (5)
,partition project_object_garbage
);