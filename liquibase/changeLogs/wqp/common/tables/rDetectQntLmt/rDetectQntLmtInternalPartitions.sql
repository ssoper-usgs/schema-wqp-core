alter table r_detect_qnt_lmt split partition rdtct_qnt_lmt_garbage into
(partition rdtct_qnt_lmt_nwis values less than (2)
,partition rdtct_qnt_lmt_garbage
);
