alter table organization_sum split partition organization_sum_garbage into
(partition organization_sum_nwis values less than (2)
,partition organization_sum_garbage
);
