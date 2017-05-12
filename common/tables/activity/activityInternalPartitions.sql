alter table activity split partition activity_garbage into
(partition activity_nwis values less than (2)
,partition activity_garbage
);
