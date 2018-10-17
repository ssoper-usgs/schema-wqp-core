alter table org_grouping split partition org_grouping_garbage into
(partition org_grouping_nwis values less than (2)
,partition org_grouping_garbage
);
