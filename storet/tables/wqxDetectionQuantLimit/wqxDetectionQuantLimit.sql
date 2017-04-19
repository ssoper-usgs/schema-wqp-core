create table wqx_detection_quant_limit
(res_uid                        number
,rdqlmt_measure                 varchar2(4000 char)
,msunt_cd                       varchar2(4000 char)
,dqltyp_name                    varchar2(4000 char)
) parallel 4 compress pctfree 0 nologging cache;
