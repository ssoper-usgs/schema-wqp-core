alter table r_detect_qnt_lmt split partition rdtct_qnt_lmt_garbage into
(partition rdtct_qnt_lmt_stewards values less than (2)
,partition rdtct_qnt_lmt_nwis values less than (3)
,partition rdtct_qnt_lmt_storet values less than (4)
,partition rdtct_qnt_lmt_biodata values less than (5)
,partition rdtct_qnt_lmt_garbage
);
