alter table char_type split partition char_type_garbage into
(partition char_type_stewards values less than (2)
,partition char_type_nwis values less than (3)
,partition char_type_storet values less than (4)
,partition char_type_biodata values less than (5)
,partition char_type_garbage
);
