create table wqx_dql_hierarchy
(hierarchy_value                number              constraint nn_wqx_dql_hierarchy_pk not null
,dqltyp_uid                     number              constraint nn_wqx_dql_hierarchy_ak not null
,dqltyp_name                    varchar2(4000 char)
,constraint wqx_dql_hierarchy_pk
  primary key (hierarchy_value)
,constraint wqx_dql_hierarchy_ak
  unique (dqltyp_uid)
);
