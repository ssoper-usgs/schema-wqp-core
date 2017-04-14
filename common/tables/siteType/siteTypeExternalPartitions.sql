alter table site_type split partition site_type_garbage into
(partition site_type_stewards values less than (2)
,partition site_type_nwis values less than (3)
,partition site_type_storet values less than (4)
,partition site_type_biodata values less than (5)
,partition site_type_garbage
);
