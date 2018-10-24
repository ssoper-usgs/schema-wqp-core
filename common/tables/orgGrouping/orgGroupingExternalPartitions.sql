alter table org_grouping split partition org_grouping_garbage into
(partition org_grouping_stewards values less than (2)
,partition org_grouping_nwis values less than (3)
,partition org_grouping_storet values less than (4)
,partition org_grouping_biodata values less than (5)
,partition org_groupingm_garbage
);
