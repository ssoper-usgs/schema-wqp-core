alter table state split partition state_garbage into
(partition state_stewards values less than (2)
,partition state_nwis values less than (3)
,partition state_storet values less than (4)
,partition state_biodata values less than (5)
,partition state_garbage
);
