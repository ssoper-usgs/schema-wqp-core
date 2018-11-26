alter table country split partition country_garbage into
(partition country_nwis values less than (2)
,partition country_garbage
);
