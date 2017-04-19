create table wqp_nemi_epa_crosswalk
(wqp_source                     varchar2(6 char)
,analytical_procedure_source    varchar2(256 char)
,analytical_procedure_id        varchar2(256 char)
,source_method_identifier       varchar2(30 char)
,method_id                      number
,method_source                  varchar2(20 char)
,method_type                    varchar2(100 char)
,nemi_url                       varchar2(4000 char)
) parallel 4 compress pctfree 0 nologging cache;
