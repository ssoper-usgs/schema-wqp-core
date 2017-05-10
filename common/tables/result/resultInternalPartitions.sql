alter table result split partition result_garbage into
(partition result_nwis values less than (2)
,partition result_garbage
);
