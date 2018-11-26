alter table char_name split partition char_name_garbage into
(partition char_name_nwis values less than (2)
,partition char_name_garbage
);
