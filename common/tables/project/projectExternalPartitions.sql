alter table project split partition project_garbage into
(partition project_stewards values less than (2)
,partition project_nwis values less than (3)
,partition project_storet values less than (4)
,partition project_biodata values less than (5)
,partition project_garbage
);
