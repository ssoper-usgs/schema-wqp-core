create table wqx_analytical_method
(anlmth_uid                     number
,anlmth_id                      varchar2(4000 char)
,amctx_cd                       varchar2(4000 char)
,anlmth_name                    varchar2(4000 char)
,anlmth_url                     varchar2(4000 char)
,anlmth_qual_type               varchar2(4000 char)
,nemi_url                       varchar2(4000 char)
) parallel 4 compress pctfree 0 nologging cache;
