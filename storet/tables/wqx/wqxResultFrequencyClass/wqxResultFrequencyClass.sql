create table wqx_result_frequency_class
(res_uid                        number
,one_fcdsc_name                 varchar2(4000 char)
,one_msunt_cd                   varchar2(4000 char)
,one_fcdsc_lower_bound          varchar2(4000 char)
,one_fcdsc_upper_bound          varchar2(4000 char)
,two_fcdsc_name                 varchar2(4000 char)
,two_msunt_cd                   varchar2(4000 char)
,two_fcdsc_lower_bound          varchar2(4000 char)
,two_fcdsc_upper_bound          varchar2(4000 char)
,three_fcdsc_name               varchar2(4000 char)
,three_msunt_cd                 varchar2(4000 char)
,three_fcdsc_lower_bound        varchar2(4000 char)
,three_fcdsc_upper_bound        varchar2(4000 char)
) parallel 4 compress pctfree 0 nologging cache;
