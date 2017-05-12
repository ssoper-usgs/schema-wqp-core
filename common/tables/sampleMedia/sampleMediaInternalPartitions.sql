alter table sample_media split partition sample_media_garbage into
(partition sample_media_nwis values less than (2)
,partition sample_media_garbage
);
