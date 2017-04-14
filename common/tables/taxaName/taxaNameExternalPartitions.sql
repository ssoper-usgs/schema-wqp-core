alter table taxa_name split partition taxa_name_garbage into
(partition taxa_name_stewards values less than (2)
,partition taxa_name_nwis values less than (3)
,partition taxa_name_storet values less than (4)
,partition taxa_name_biodata values less than (5)
,partition taxa_name_garbage
);
