alter table assemblage split partition assemblage_garbage into
(partition assemblage_stewards values less than (2)
,partition assemblage_nwis values less than (3)
,partition assemblage_storet values less than (4)
,partition assemblage_biodata values less than (5)
,partition assemblage_garbage
);
