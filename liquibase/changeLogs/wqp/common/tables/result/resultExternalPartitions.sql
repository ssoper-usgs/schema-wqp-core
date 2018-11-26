alter table result split partition result_garbage into
(partition result_stewards values less than (2)
,partition result_nwis values less than (3)
,partition result_storet values less than (4)
,partition result_biodata values less than (5)
,partition result_garbage
);
