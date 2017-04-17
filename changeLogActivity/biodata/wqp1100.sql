--liquibase formatted sql

--This is for the wqp_core schema

--changeset drsteini:alter-activity_swap_biodata-split-biodata-2019-2020
alter table activity_swap_biodata split partition activity_biodata_y_maxx into 
(partition activity_biodata_y_2019 values less than (to_date('01-JAN-2020', 'DD-MON-YYYY')) tablespace result4
,partition activity_biodata_y_2020 values less than (to_date('01-JAN-2021', 'DD-MON-YYYY')) tablespace result1
,partition activity_biodata_y_maxx);
--rollback alter table activity_swap_biodata merge partitions activity_biodata_y_2019, activity_biodata_y_2020, activity_biodata_y_maxx into partition activity_biodata_y_maxx;

--changeset drsteini:alter-activity_sum_swap_biodata-split-biodata-2019-2020
alter table activity_sum_swap_biodata split partition act_sum_biodata_y_maxx into 
(partition act_sum_biodata_y_2019 values less than (to_date('01-JAN-2020', 'DD-MON-YYYY')) tablespace result4
,partition act_sum_biodata_y_2020 values less than (to_date('01-JAN-2021', 'DD-MON-YYYY')) tablespace result1
,partition act_sum_biodata_y_maxx tablespace result2);
--rollback alter table activity_sum_swap_biodata merge partitions act_sum_biodata_y_2019, act_sum_biodata_y_2020, act_sum_biodata_y_maxx into partition act_sum_biodata_y_maxx;

--changeset drsteini:alter-act_metric_swap_biodata-split-biodata-2019-2020
alter table act_metric_swap_biodata split partition act_metric_biodata_y_maxx into 
(partition act_metric_biodata_y_2019 values less than (to_date('01-JAN-2020', 'DD-MON-YYYY')) tablespace result4
,partition act_metric_biodata_y_2020 values less than (to_date('01-JAN-2021', 'DD-MON-YYYY')) tablespace result1
,partition act_metric_biodata_y_maxx);
--rollback alter table act_metric_swap_biodata merge partitions act_metric_biodata_y_2019, act_metric_biodata_y_2020, act_metric_biodata_y_maxx into partition act_metric_biodata_y_maxx;

--changeset drsteini:alter-project_dim_swap_biodata-cache-parallel
alter table project_dim_swap_biodata parallel 4 cache;
--rollback alter table project_dim_swap_biodata noparallel nocache;

--changeset drsteini:alter-result_swap_biodata-split-biodata-2019-2020
alter table result_swap_biodata split partition result_biodata_y_maxx into 
(partition result_biodata_y_2019 values less than (to_date('01-JAN-2020', 'DD-MON-YYYY')) tablespace result4
,partition result_biodata_y_2020 values less than (to_date('01-JAN-2021', 'DD-MON-YYYY')) tablespace result1
,partition result_biodata_y_maxx);
--rollback alter table result_swap_biodata merge partitions result_biodata_y_2019, result_biodata_y_2020, result_biodata_y_maxx into partition result_biodata_y_maxx;

--changeset drsteini:alter-result_sum_swap_biodata-split-biodata-2019-2020
alter table result_sum_swap_biodata split partition result_sum_biodata_y_maxx into 
(partition result_sum_biodata_y_2019 values less than (to_date('01-JAN-2020', 'DD-MON-YYYY')) tablespace result4
,partition result_sum_biodata_y_2020 values less than (to_date('01-JAN-2021', 'DD-MON-YYYY')) tablespace result1
,partition result_sum_biodata_y_maxx tablespace result2);
--rollback alter table result_sum_swap_biodata merge partitions result_sum_biodata_y_2019, result_sum_biodata_y_2020, result_sum_biodata_y_maxx into partition result_sum_biodata_y_maxx;

--changeset drsteini:create-index-ss_biodata_country
create bitmap index ss_biodata_country on station_sum_swap_biodata(country_code) parallel 4 nologging;
--rollback drop index ss_biodata_country;
