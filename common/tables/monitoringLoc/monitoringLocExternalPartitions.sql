alter table monitoring_loc split partition monitoring_loc_garbage into
(partition monitoring_loc_stewards values less than (2)
,partition monitoring_loc_nwis values less than (3)
,partition monitoring_loc_storet values less than (4)
,partition monitoring_loc_biodata values less than (5)
,partition monitoring_loc_garbage
);
