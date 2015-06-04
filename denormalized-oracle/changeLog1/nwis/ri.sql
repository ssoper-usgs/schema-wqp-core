--liquibase formatted sql

--This is for the wqp_core schema

--changeset drsteini:1NwisRIAA
alter table station_swap_nwis add constraint s_nwis_pk
   primary key (data_source_id, station_id)
     rely enable novalidate;
--rollback alter table station_swap_nwis drop constraint s_nwis_pk;

--changeset drsteini:1NwisRIAB
alter table station_sum_swap_nwis add constraint ss_nwis_pk
   primary key (data_source_id, station_id)
     rely enable novalidate;
--rollback alter table station_sum_swap_nwis drop constraint ss_nwis_pk;

--changeset drsteini:1NwisRIAC
alter table result_swap_nwis add constraint result_station_fk_nwis
   foreign key (data_source_id, station_id)
     references station_swap_nwis (data_source_id, station_id)
       rely enable novalidate;
--rollback alter table result_swap_nwis drop constraint result_station_fk_nwis;

--changeset drsteini:1NwisRIAD
alter table result_sum_swap_nwis add constraint rs_station_fk_nwis
   foreign key (data_source_id, station_id)
     references station_sum_swap_nwis (data_source_id, station_id)
       rely enable novalidate;
--rollback alter table result_sum_swap_nwis drop constraint rs_station_fk_nwis;

--changeset drsteini:1NwisRIAE
alter table result_ct_sum_swap_nwis add constraint rcts_station_fk_nwis
   foreign key (data_source_id, station_id)
     references station_sum_swap_nwis (data_source_id, station_id)
       rely enable novalidate;
--rollback alter table result_ct_sum_swap_nwis drop constraint rcts_station_fk_nwis;

--changeset drsteini:1NwisRIAF
alter table result_nr_sum_swap_nwis add constraint rnrs_station_fk_nwis
   foreign key (data_source_id, station_id)
     references station_sum_swap_nwis (data_source_id, station_id)
       rely enable novalidate;
--rollback alter table result_nr_sum_swap_nwis drop constraint rnrs_station_fk_nwis;
