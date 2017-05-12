alter table site_type split partition site_type_garbage into
(partition site_type_nwis values less than (2)
,partition site_type_garbage
);
