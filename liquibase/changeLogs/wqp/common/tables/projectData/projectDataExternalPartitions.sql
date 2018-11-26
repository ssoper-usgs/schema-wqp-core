alter table project_data split partition project_data_garbage into
(partition project_data_stewards values less than (2)
,partition project_data_nwis values less than (3)
,partition project_data_storet values less than (4)
,partition project_data_biodata values less than (5)
,partition project_data_garbage
);