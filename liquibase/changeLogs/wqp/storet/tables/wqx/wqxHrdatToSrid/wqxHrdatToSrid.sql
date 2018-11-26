create table wqx_hrdat_to_srid
(hrdat_uid                      number
,srid                           number
) parallel 4 compress nologging cache;
