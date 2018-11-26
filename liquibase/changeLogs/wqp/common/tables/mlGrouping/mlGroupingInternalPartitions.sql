alter table ml_grouping split partition ml_grouping_garbage into
(partition ml_grouping_nwis values less than (2)
,partition ml_grouping_garbage
);
