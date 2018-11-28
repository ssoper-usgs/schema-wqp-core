alter table ml_grouping split partition ml_grouping_garbage into
(partition ml_grouping_stewards values less than (2)
,partition ml_grouping_nwis values less than (3)
,partition ml_grouping_storet values less than (4)
,partition ml_grouping_biodata values less than (5)
,partition ml_grouping_garbage
);
