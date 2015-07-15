--liquibase formatted sql

--This is for the wqp_core schema

--changeset drsteini:1BiodataRIAA
alter table station_swap_biodata add constraint s_biodata_pk
   primary key (data_source_id, station_id)
     rely enable novalidate;
--rollback alter table station_swap_biodata drop constraint s_biodata_pk;

--changeset drsteini:1BiodataRIAB
alter table station_sum_swap_biodata add constraint ss_biodata_pk
   primary key (data_source_id, station_id)
     rely enable novalidate;
--rollback alter table station_sum_swap_biodata drop constraint ss_biodata_pk;

--changeset drsteini:1BiodataRIAC
alter table result_swap_biodata add constraint result_station_fk_biodata
   foreign key (data_source_id, station_id)
     references station_swap_biodata (data_source_id, station_id)
       rely enable novalidate;
--rollback alter table result_swap_biodata drop constraint result_station_fk_biodata;

--changeset drsteini:1BiodataRIAD
alter table result_sum_swap_biodata add constraint rs_station_fk_biodata
   foreign key (data_source_id, station_id)
     references station_sum_swap_biodata (data_source_id, station_id)
       rely enable novalidate;
--rollback alter table result_sum_swap_biodata drop constraint rs_station_fk_biodata;

--changeset drsteini:1BiodataRIAE
alter table result_ct_sum_swap_biodata add constraint rcts_station_fk_biodata
   foreign key (data_source_id, station_id)
     references station_sum_swap_biodata (data_source_id, station_id)
       rely enable novalidate;
--rollback alter table result_ct_sum_swap_biodata drop constraint rcts_station_fk_biodata;

--changeset drsteini:1BiodataRIAF
alter table result_nr_sum_swap_biodata add constraint rnrs_station_fk_biodata
   foreign key (data_source_id, station_id)
     references station_sum_swap_biodata (data_source_id, station_id)
       rely enable novalidate;
--rollback alter table result_nr_sum_swap_biodata drop constraint rnrs_station_fk_biodata;
