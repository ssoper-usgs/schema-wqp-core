alter table assemblage split partition assemblage_garbage into
(partition assemblage_nwis values less than (2)
,partition assemblage_garbage
);
