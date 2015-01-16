--liquibase formatted sql

--This is for the wqp_core schema

--changeset drsteini:1TablesAA
create table wqp_results_d
(
wqp_id number,
station_id number,
data_source varchar2(4000 char),
event_date_id date,
analytical_method varchar2(4000 char),
p_code varchar2(4000 char),
activity varchar2(4000 char),
characteristic_name varchar2(4000 char),
characteristic_type varchar2(4000 char),
sample_media varchar2(4000 char),
organization varchar2(4000 char),
site_type varchar2(4000 char),
huc2 number,
huc4 number,
huc6 number,
huc8 number,
huc10 number,
huc12 number,
country_code varchar2(4000 char),
state_code varchar2(4000 char),
county_code varchar2(4000 char),
geography mdsys.sdo_geometry,
data_blob blob,
primary key (wqp_id)
);
--rollback drop table wqp_results_d cascade constraints purge;

--changeset drsteini:1TablesAB
create table stations_d
(
station_id number,
site_id varchar2(4000 char),
data_source varchar2(4000 char),
organization varchar2(4000 char),
site_type varchar2(4000 char),
huc2 number,
huc4 number,
huc6 number,
huc8 number,
huc10 number,
huc12 number,
country_code varchar2(4000 char),
state_code varchar2(4000 char),
county_code varchar2(4000 char),
geography mdsys.sdo_geometry,
data_blob blob,
primary key (station_id)
);
--rollback drop table stations_d cascade constraints purge;
