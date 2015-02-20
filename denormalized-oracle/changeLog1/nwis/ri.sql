--liquibase formatted sql

--This is for the wqp_core schema

--changeset drsteini:1NwisRI
alter table station_swap_nwis add constraint station_pk_nwis
   primary key (data_source_id, station_id)
     rely enable novalidate;
--rollback alter table station_swap_nwis drop constraint station_pk_nwis;

--changeset drsteini:1NwisRI
alter table station_sum_swap_nwis add constraint station_sum_pk_nwis
   primary key (data_source_id, station_id)
     rely enable novalidate;
--rollback alter table station_sum_swap_nwis drop constraint station_sum_pk_nwis;

--changeset drsteini:1NwisRI
alter table pc_result_swap_nwis add constraint pc_result_station_fk_nwis
   foreign key (data_source_id, station_id)
     references station_swap_nwis (data_source_id, station_id)
       rely enable novalidate;
--rollback alter table pc_result_swap_nwis drop constraint pc_result_station_fk_nwis;

--changeset drsteini:1NwisRI
alter table pc_result_sum_swap_nwis add constraint pcrs_station_fk_nwis
   foreign key (data_source_id, station_id)
     references station_sum_swap_nwis (data_source_id, station_id)
       rely enable novalidate;
--rollback alter table pc_result_sum_swap_nwis drop constraint pcrs_station_fk_nwis;

--changeset drsteini:1NwisRI
alter table pc_result_ct_sum_swap_nwis add constraint pcrcts_station_fk_nwis
   foreign key (data_source_id, station_id)
     references station_sum_swap_nwis (data_source_id, station_id)
       rely enable novalidate;
--rollback alter table pc_result_sum_swap_nwis drop constraint pcrcts_station_fk_nwis;

--changeset drsteini:1NwisRI
alter table pc_result_nr_sum_swap_nwis add constraint pcrnrs_station_fk_nwis
   foreign key (data_source_id, station_id)
     references station_sum_swap_nwis (data_source_id, station_id)
       rely enable novalidate;
--rollback alter table pc_result_sum_swap_nwis drop constraint pcrnrs_station_fk_nwis;
