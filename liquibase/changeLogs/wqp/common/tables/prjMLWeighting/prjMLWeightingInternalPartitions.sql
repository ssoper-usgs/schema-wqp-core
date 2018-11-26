alter table prj_ml_weighting split partition prj_ml_weighting_garbage into
(partition prj_ml_weighting_nwis values less than (2)
,partition prj_ml_weighting_garbage
);