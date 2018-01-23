alter table prj_ml_weighting split partition prj_ml_weighting_garbage into
(partition prj_ml_weighting_stewards values less than (2)
,partition prj_ml_weighting_nwis values less than (3)
,partition prj_ml_weighting_storet values less than (4)
,partition prj_ml_weighting_biodata values less than (5)
,partition prj_ml_weighting_garbage
);