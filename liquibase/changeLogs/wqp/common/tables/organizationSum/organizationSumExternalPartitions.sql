alter table organization_sum split partition organization_sum_garbage into
(partition organization_sum_stewards values less than (2)
,partition organization_sum_nwis values less than (3)
,partition organization_sum_storet values less than (4)
,partition organization_sum_biodata values less than (5)
,partition organization_sum_garbage
);
