alter table state split partition state_garbage into
(partition state_nwis values less than (2)
,partition state_garbage
);
