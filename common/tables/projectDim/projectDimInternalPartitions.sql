alter table project_dim split partition project_dim_garbage into
(partition project_dim_nwis values less than (2)
,partition project_dim_garbage
);
