alter table organization split partition organization_garbage into
(partition organization_nwis values less than (2)
,partition organization_garbage
);
