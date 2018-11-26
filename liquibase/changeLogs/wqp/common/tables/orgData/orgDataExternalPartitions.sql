alter table org_data split partition org_data_garbage into
(partition org_data_stewards values less than (2)
,partition org_data_nwis values less than (3)
,partition org_data_storet values less than (4)
,partition org_data_biodata values less than (5)
,partition org_data_garbage
);
