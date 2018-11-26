alter table taxa_name split partition taxa_name_garbage into
(partition taxa_name_nwis values less than (2)
,partition taxa_name_garbage
);
