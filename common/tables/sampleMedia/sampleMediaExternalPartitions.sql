alter table sample_media split partition sample_media_garbage into
(partition sample_media_stewards values less than (2)
,partition sample_media_nwis values less than (3)
,partition sample_media_storet values less than (4)
,partition sample_media_biodata values less than (5)
,partition sample_media_garbage
);
