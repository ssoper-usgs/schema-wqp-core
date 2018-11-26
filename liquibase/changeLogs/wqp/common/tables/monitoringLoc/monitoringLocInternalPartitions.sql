alter table monitoring_loc split partition monitoring_loc_garbage into
(partition monitoring_loc_nwis values less than (2)
,partition monitoring_loc_garbage
);
