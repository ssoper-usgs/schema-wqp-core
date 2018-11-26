alter table qwportal_summary split partition summary_garbage into
(partition summary_nwis values less than (2)
,partition summary_garbage
);
