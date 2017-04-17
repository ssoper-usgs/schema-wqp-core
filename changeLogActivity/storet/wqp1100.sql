--liquibase formatted sql

--This is for the wqp_core schema

--changeset drsteini:alter-activity_swap_storet-split-storet-2019-2020
alter table activity_swap_storet split partition activity_storet_y_maxx into 
(partition activity_storet_y_2019 values less than (to_date('01-JAN-2020', 'DD-MON-YYYY')) tablespace result4
,partition activity_storet_y_2020 values less than (to_date('01-JAN-2021', 'DD-MON-YYYY')) tablespace result1
,partition activity_storet_y_maxx);
--rollback alter table activity_swap_storet merge partitions activity_storet_y_2019, activity_storet_y_2020, activity_storet_y_maxx into partition activity_storet_y_maxx;

--changeset drsteini:alter-activity_sum_swap_storet-split-storet-2019-2020
alter table activity_sum_swap_storet split partition act_sum_storet_y_maxx into 
(partition act_sum_storet_y_2019 values less than (to_date('01-JAN-2020', 'DD-MON-YYYY')) tablespace result4
,partition act_sum_storet_y_2020 values less than (to_date('01-JAN-2021', 'DD-MON-YYYY')) tablespace result1
,partition act_sum_storet_y_maxx tablespace result2);
--rollback alter table activity_sum_swap_storet merge partitions act_sum_storet_y_2019, act_sum_storet_y_2020, act_sum_storet_y_maxx into partition act_sum_storet_y_maxx;

--changeset drsteini:alter-act_metric_swap_storet-split-storet-2019-2020
alter table act_metric_swap_storet split partition act_metric_storet_y_maxx into 
(partition act_metric_storet_y_2019 values less than (to_date('01-JAN-2020', 'DD-MON-YYYY')) tablespace result4
,partition act_metric_storet_y_2020 values less than (to_date('01-JAN-2021', 'DD-MON-YYYY')) tablespace result1
,partition act_metric_storet_y_maxx);
--rollback alter table act_metric_swap_storet merge partitions act_metric_storet_y_2019, act_metric_storet_y_2020, act_metric_storet_y_maxx into partition act_metric_storet_y_maxx;

--changeset drsteini:alter-project_dim_swap_storet-cache-parallel
alter table project_dim_swap_storet parallel 4 cache;
--rollback alter table project_dim_swap_storet noparallel nocache;

--changeset drsteini:alter-result_swap_storet-split-storet-2019-2020
alter table result_swap_storet split partition result_storet_y_maxx into 
(partition result_storet_y_2019 values less than (to_date('01-JAN-2020', 'DD-MON-YYYY')) tablespace result4
,partition result_storet_y_2020 values less than (to_date('01-JAN-2021', 'DD-MON-YYYY')) tablespace result1
,partition result_storet_y_maxx);
--rollback alter table result_swap_storet merge partitions result_storet_y_2019, result_storet_y_2020, result_storet_y_maxx into partition result_storet_y_maxx;

--changeset drsteini:alter-result_sum_swap_storet-split-storet-2019-2020
alter table result_sum_swap_storet split partition result_sum_storet_y_maxx into 
(partition result_sum_storet_y_2019 values less than (to_date('01-JAN-2020', 'DD-MON-YYYY')) tablespace result4
,partition result_sum_storet_y_2020 values less than (to_date('01-JAN-2021', 'DD-MON-YYYY')) tablespace result1
,partition result_sum_storet_y_maxx tablespace result2);
--rollback alter table result_sum_swap_storet merge partitions result_sum_storet_y_2019, result_sum_storet_y_2020, result_sum_storet_y_maxx into partition result_sum_storet_y_maxx;

--changeset drsteini:create-index-ss_storet_country
create bitmap index ss_storet_country on station_sum_swap_storet(country_code) parallel 4 nologging;
--rollback drop index ss_storet_country;
