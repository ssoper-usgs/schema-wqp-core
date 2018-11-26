alter table county split partition county_garbage into
(partition county_stewards values less than (2)
,partition county_nwis values less than (3)
,partition county_storet values less than (4)
,partition county_biodata values less than (5)
,partition county_garbage
);
