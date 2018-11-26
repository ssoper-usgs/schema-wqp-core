alter table result_object split partition result_object_garbage into
(partition result_object_stewards values less than (2)
,partition result_object_nwis values less than (3)
,partition result_object_storet values less than (4)
,partition result_object_biodata values less than (5)
,partition result_object_garbage
);