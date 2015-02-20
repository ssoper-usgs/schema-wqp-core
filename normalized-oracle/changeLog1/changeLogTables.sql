--liquibase formatted sql

--This is for the wqp_core schema

--changeset drsteini:1TablesAA
create table analytical_methods
(
id number,
uri varchar2(4000 char),
primary key (id)
);
--rollback drop table analytical_methods cascade constraints purge;

--changeset drsteini:1TablesAB
create table characteristic_names
(
id number,
name varchar2(4000 char),
primary key (id)
);
--rollback drop table characteristic_names cascade constraints purge;

--changeset drsteini:1TablesAC
create table characteristic_types
(
id number,
name varchar2(4000 char),
primary key (id)
);
--rollback drop table characteristic_types cascade constraints purge;

--changeset drsteini:1TablesAD
create table country_codes
(
id number,
name varchar2(4000 char),
primary key (id)
);
--rollback drop table country_codes cascade constraints purge;

--changeset drsteini:1TablesAE
create table county_codes
(
id number,
name varchar2(4000 char),
primary key (id)
);
--rollback drop table county_codes cascade constraints purge;

--changeset drsteini:1TablesAF
create table data_sources
(
id number,
name varchar2(4000 char),
primary key (id)
);
--rollback drop table data_sources cascade constraints purge;

--changeset drsteini:1TablesAG
create table event_dates
(
id number,
date_desc date,
primary key (id)
);
--rollback drop table event_dates cascade constraints purge;

--changeset drsteini:1TablesAH
create table organizations
(
id number,
name varchar2(4000 char),
primary key (id)
);
--rollback drop table organizations cascade constraints purge;

--changeset drsteini:1TablesAI
create table p_codes
(
id number,
name varchar2(4000 char),
primary key (id)
);
--rollback drop table p_codes cascade constraints purge;

--changeset drsteini:1TablesAJ
create table sample_medias
(
id number,
name varchar2(4000 char),
primary key (id)
);
--rollback drop table sample_medias cascade constraints purge;

--changeset drsteini:1TablesAK
create table site_types
(
id number,
name varchar2(4000 char),
primary key (id)
);
--rollback drop table site_types cascade constraints purge;

--changeset drsteini:1TablesAL
create table state_codes
(
id number,
name varchar2(4000 char),
primary key (id)
);
--rollback drop table state_codes cascade constraints purge;

--changeset drsteini:1TablesAM
create table wqp_results_n
(
wqp_id number,
station_id number,
data_source_id number,
event_date_id number,
analytical_method_id number,
p_code_id number,
activity_id varchar2(4000 char),
characteristic_name_id number,
characteristic_type_id number,
sample_media_id number,
organization_id number,
site_type_id number,
huc2 number,
huc4 number,
huc6 number,
huc8 number,
huc10 number,
huc12 number,
country_code_id number,
state_code_id number,
county_code_id number,
geography mdsys.sdo_geometry,
data_blob blob,
primary key (wqp_id)
);
--rollback drop table wqp_results_n cascade constraints purge;

--changeset drsteini:1TablesAN
create table stations_n
(
station_id number,
site_id varchar2(4000 char),
data_source_id number,
organization_id number,
site_type_id number,
huc2 number,
huc4 number,
huc6 number,
huc8 number,
huc10 number,
huc12 number,
country_code_id number,
state_code_id number,
county_code_id number,
geography mdsys.sdo_geometry,
data_blob blob,
primary key (station_id)
);
--rollback drop table stations_n cascade constraints purge;
