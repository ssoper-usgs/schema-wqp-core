--liquibase formatted sql

--This is for the wqp_core schema

--changeset drsteini:1GeoFromDbdwAA context:dev,qa,prod
insert into huc8_conus_hi_ak_pr_dis select * from huc8_conus_hi_ak_pr_dis@wqp_core_dbdw.er.usgs.gov;
--rollback truncate table huc8_conus_hi_ak_pr_dis;

--changeset drsteini:1GeoFromDbdwAB context:dev,qa,prod
insert into us_counties_dis_20121015 select * from us_counties_dis_20121015@wqp_core_dbdw.er.usgs.gov;
--rollback truncate table us_counties_dis_20121015;

--changeset drsteini:1GeoFromDbdwAC context:dev,qa,prod
insert into county_geom_lookup select * from county_geom_lookup@wqp_core_dbdw.er.usgs.gov;
--rollback truncate table county_geom_lookup;

--changeset drsteini:1GeoFromDbdwAD context:dev,qa,prod
insert into huc8_geom_lookup select * from huc8_geom_lookup@wqp_core_dbdw.er.usgs.gov;
--rollback truncate table huc8_geom_lookup;

--changeset drsteini:WQP-767-Populate-States context:dev,qa,prod
insert into states select * from states@nwis_ws_star_dbdw.er.usgs.gov;
--rollback truncate table states;
