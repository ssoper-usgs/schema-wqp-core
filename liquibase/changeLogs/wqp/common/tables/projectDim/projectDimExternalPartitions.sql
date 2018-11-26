alter table project_dim split partition project_dim_garbage into
(partition project_dim_stewards values less than (2)
,partition project_dim_nwis values less than (3)
,partition project_dim_storet values less than (4)
,partition project_dim_biodata values less than (5)
,partition project_dim_garbage
);
