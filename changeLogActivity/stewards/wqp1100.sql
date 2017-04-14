--liquibase formatted sql

--This is for the wqp_core schema

--changeset drsteini:alter-activity_swap_stewards-split-stewards-2019-2020
alter table activity_swap_stewards split partition activity_stewards_y_maxx into 
(partition activity_stewards_y_2019 values less than (to_date('01-JAN-2020', 'DD-MON-YYYY')) tablespace result4
,partition activity_stewards_y_2020 values less than (to_date('01-JAN-2021', 'DD-MON-YYYY')) tablespace result1
,partition activity_stewards_y_maxx);
--rollback alter table activity_swap_stewards merge partitions activity_stewards_y_2019, activity_stewards_y_2020, activity_stewards_y_maxx into partition activity_stewards_y_maxx;

--changeset drsteini:alter-activity_sum_swap_stewards-split-stewards-2019-2020
alter table activity_sum_swap_stewards split partition act_sum_stewards_y_maxx into 
(partition act_sum_stewards_y_2019 values less than (to_date('01-JAN-2020', 'DD-MON-YYYY')) tablespace result4
,partition act_sum_stewards_y_2020 values less than (to_date('01-JAN-2021', 'DD-MON-YYYY')) tablespace result1
,partition act_sum_stewards_y_maxx tablespace result2);
--rollback alter table activity_sum_swap_stewards merge partitions act_sum_stewards_y_2019, act_sum_stewards_y_2020, act_sum_stewards_y_maxx into partition act_sum_stewards_y_maxx;

--changeset drsteini:alter-act_metric_swap_stewards-split-stewards-2019-2020
alter table act_metric_swap_stewards split partition act_metric_stewards_y_maxx into 
(partition act_metric_stewards_y_2019 values less than (to_date('01-JAN-2020', 'DD-MON-YYYY')) tablespace result4
,partition act_metric_stewards_y_2020 values less than (to_date('01-JAN-2021', 'DD-MON-YYYY')) tablespace result1
,partition act_metric_stewards_y_maxx);
--rollback alter table act_metric_swap_stewards merge partitions act_metric_stewards_y_2019, act_metric_stewards_y_2020, act_metric_stewards_y_maxx into partition act_metric_stewards_y_maxx;

--changeset drsteini:alter-project_dim_swap_stewards-cache-parallel
alter table project_dim_swap_stewards parallel 4 cache;
--rollback alter table project_dim_swap_stewards noparallel nocache;

--changeset drsteini:alter-result_swap_stewards-split-stewards-2019-2020
alter table result_swap_stewards split partition result_stewards_y_maxx into 
(partition result_stewards_y_2019 values less than (to_date('01-JAN-2020', 'DD-MON-YYYY')) tablespace result4
,partition result_stewards_y_2020 values less than (to_date('01-JAN-2021', 'DD-MON-YYYY')) tablespace result1
,partition result_stewards_y_maxx);
--rollback alter table result_swap_stewards merge partitions result_stewards_y_2019, result_stewards_y_2020, result_stewards_y_maxx into partition result_stewards_y_maxx;

--changeset drsteini:alter-result_sum_swap_stewards-split-stewards-2019-2020
alter table result_sum_swap_stewards split partition result_sum_stewards_y_maxx into 
(partition result_sum_stewards_y_2019 values less than (to_date('01-JAN-2020', 'DD-MON-YYYY')) tablespace result4
,partition result_sum_stewards_y_2020 values less than (to_date('01-JAN-2021', 'DD-MON-YYYY')) tablespace result1
,partition result_sum_stewards_y_maxx tablespace result2);
--rollback alter table result_sum_swap_stewards merge partitions result_sum_stewards_y_2019, result_sum_stewards_y_2020, result_sum_stewards_y_maxx into partition result_sum_stewards_y_maxx;

--changeset drsteini:create-index-ss_stewards_country
create bitmap index ss_stewards_country on station_sum_swap_stewards(country_code) parallel 4 nologging;
--rollback drop index ss_stewards_country;
