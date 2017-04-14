alter table char_name split partition char_name_garbage into
(partition char_name_stewards values less than (2)
,partition char_name_nwis values less than (3)
,partition char_name_storet values less than (4)
,partition char_name_biodata values less than (5)
,partition char_name_garbage
);
