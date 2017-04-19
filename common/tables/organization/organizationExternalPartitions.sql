alter table organization split partition organization_garbage into
(partition organization_stewards values less than (2)
,partition organization_nwis values less than (3)
,partition organization_storet values less than (4)
,partition organization_biodata values less than (5)
,partition organization_garbage
);
