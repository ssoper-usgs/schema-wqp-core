alter table project_data split partition project_data_garbage into
(partition project_data_nwis values less than (2)
,partition project_data_garbage
);