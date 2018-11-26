alter table project split partition project_garbage into
(partition project_nwis values less than (2)
,partition project_garbage
);
