alter table org_data split partition org_data_garbage into
(partition org_data_nwis values less than (2)
,partition org_data_garbage
);
