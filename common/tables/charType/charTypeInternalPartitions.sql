alter table char_type split partition char_type_garbage into
(partition char_type_nwis values less than (2)
,partition char_type_garbage
);
