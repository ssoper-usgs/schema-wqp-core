alter table qwportal_summary split partition summary_garbage into
(partition summary_stewards values less than (2)
,partition summary_nwis values less than (3)
,partition summary_storet values less than (4)
,partition summary_biodata values less than (5)
,partition summary_garbage
);
