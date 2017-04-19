create table public_srsnames_test
(parm_cd                        varchar2(5 char) not null
,description                    varchar2(170 char)
,characteristicname             varchar2(1200 char)
,neasureunitcode                varchar2(10 char)
,resultsamplefraction           varchar2(24 char)
,resulttemperaturebasis         varchar2(12 char)
,resultstatisticalbasis         varchar2(25 char)
,resulttimebasis                varchar2(12 char)
,resultweightbasis              varchar2(15 char)
,resultparticlesizebasis        varchar2(64 char)
,last_rev_dt                    date
,max_last_rev_dt                date
) parallel 4 compress pctfree 0 nologging cache;
