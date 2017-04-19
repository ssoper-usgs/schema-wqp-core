create table data_source
(data_source_id                 number              constraint nn_data_source_pk not null
,text                           varchar2(8 char)
,constraint data_source_pk
  primary key (data_source_id)
);
