alter table county split partition county_garbage into
(partition county_nwis values less than (2)
,partition county_garbage
);
