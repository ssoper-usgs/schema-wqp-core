--liquibase formatted sql

--This is for the wqp_core schema

--changeset drsteini:WQP-913-create-a_biodata_activity_id
create bitmap index a_biodata_activity_id on activity_swap_biodata(activity_id) local parallel 4 nologging;
--rollback drop index a_biodata_activity_id;

--changeset drsteini:WQP-913-create-a_biodata_activity
create bitmap index a_biodata_activity on activity_swap_biodata(activity) local parallel 4 nologging;
--rollback drop index a_biodata_activity;

--changeset drsteini:WQP-913-create-a_biodata_country
create bitmap index a_biodata_country on activity_swap_biodata(country_code) local parallel 4 nologging;
--rollback drop index a_biodata_country;

--changeset drsteini:WQP-913-create-a_biodata_county
create bitmap index a_biodata_county on activity_swap_biodata(county_code) local parallel 4 nologging;
--rollback drop index a_biodata_county;

--changeset drsteini:WQP-913-create-a_biodata_event_date
create bitmap index a_biodata_event_date on activity_swap_biodata(event_date) local parallel 4 nologging;
--rollback drop index a_biodata_event_date;

--changeset drsteini:WQP-913-create-a_biodata_huc10
create bitmap index a_biodata_huc10 on activity_swap_biodata(huc_10) local parallel 4 nologging;
--rollback drop index a_biodata_huc10;

--changeset drsteini:WQP-913-create-a_biodata_huc12
create bitmap index a_biodata_huc12 on activity_swap_biodata(huc_12) local parallel 4 nologging;
--rollback drop index a_biodata_huc12;

--changeset drsteini:WQP-913-create-a_biodata_huc2
create bitmap index a_biodata_huc2 on activity_swap_biodata(huc_2) local parallel 4 nologging;
--rollback drop index a_biodata_huc2;

--changeset drsteini:WQP-913-create-a_biodata_huc4
create bitmap index a_biodata_huc4 on activity_swap_biodata(huc_4) local parallel 4 nologging;
--rollback drop index a_biodata_huc4;

--changeset drsteini:WQP-913-create-a_biodata_huc6
create bitmap index a_biodata_huc6 on activity_swap_biodata(huc_6) local parallel 4 nologging;
--rollback drop index a_biodata_huc6;

--changeset drsteini:WQP-913-create-a_biodata_huc8
create bitmap index a_biodata_huc8 on activity_swap_biodata(huc_8) local parallel 4 nologging;
--rollback drop index a_biodata_huc8;

--changeset drsteini:WQP-913-create-a_biodata_organization
create bitmap index a_biodata_organization on activity_swap_biodata(organization) local parallel 4 nologging;
--rollback drop index a_biodata_organization;

--changeset drsteini:WQP-913-create-a_biodata_sample_media
create bitmap index a_biodata_sample_media on activity_swap_biodata(sample_media) local parallel 4 nologging;
--rollback drop index a_biodata_sample_media;

--changeset drsteini:WQP-913-create-a_biodata_site
create bitmap index a_biodata_site on activity_swap_biodata(site_id) local parallel 4 nologging;
--rollback drop index a_biodata_site;

--changeset drsteini:WQP-913-create-a_biodata_site_type
create bitmap index a_biodata_site_type on activity_swap_biodata(site_type) local parallel 4 nologging;
--rollback drop index a_biodata_site_type;

--changeset drsteini:WQP-913-create-a_biodata_state
create bitmap index a_biodata_state on activity_swap_biodata(state_code) local parallel 4 nologging;
--rollback drop index a_biodata_state;

--changeset drsteini:WQP-913-create-a_biodata_station
create bitmap index a_biodata_station on activity_swap_biodata(station_id) local parallel 4 nologging;
--rollback drop index a_biodata_station;



--changeset drsteini:WQP-913-create-am_biodata_activity_id
create bitmap index am_biodata_activity_id on act_metric_swap_biodata(activity_id) local parallel 4 nologging;
--rollback drop index am_biodata_activity_id;

--changeset drsteini:WQP-913-create-am_biodata_activity
create bitmap index am_biodata_activity on act_metric_swap_biodata(activity) local parallel 4 nologging;
--rollback drop index am_biodata_activity;

--changeset drsteini:WQP-913-create-am_biodata_country
create bitmap index am_biodata_country on act_metric_swap_biodata(country_code) local parallel 4 nologging;
--rollback drop index am_biodata_country;

--changeset drsteini:WQP-913-create-am_biodata_county
create bitmap index am_biodata_county on act_metric_swap_biodata(county_code) local parallel 4 nologging;
--rollback drop index am_biodata_county;

--changeset drsteini:WQP-913-create-am_biodata_event_date
create bitmap index am_biodata_event_date on act_metric_swap_biodata(event_date) local parallel 4 nologging;
--rollback drop index am_biodata_event_date;

--changeset drsteini:WQP-913-create-am_biodata_huc10
create bitmap index am_biodata_huc10 on act_metric_swap_biodata(huc_10) local parallel 4 nologging;
--rollback drop index am_biodata_huc10;

--changeset drsteini:WQP-913-create-am_biodata_huc12
create bitmap index am_biodata_huc12 on act_metric_swap_biodata(huc_12) local parallel 4 nologging;
--rollback drop index am_biodata_huc12;

--changeset drsteini:WQP-913-create-am_biodata_huc2
create bitmap index am_biodata_huc2 on act_metric_swap_biodata(huc_2) local parallel 4 nologging;
--rollback drop index am_biodata_huc2;

--changeset drsteini:WQP-913-create-am_biodata_huc4
create bitmap index am_biodata_huc4 on act_metric_swap_biodata(huc_4) local parallel 4 nologging;
--rollback drop index am_biodata_huc4;

--changeset drsteini:WQP-913-create-am_biodata_huc6
create bitmap index am_biodata_huc6 on act_metric_swap_biodata(huc_6) local parallel 4 nologging;
--rollback drop index am_biodata_huc6;

--changeset drsteini:WQP-913-create-am_biodata_huc8
create bitmap index am_biodata_huc8 on act_metric_swap_biodata(huc_8) local parallel 4 nologging;
--rollback drop index am_biodata_huc8;

--changeset drsteini:WQP-913-create-am_biodata_organization
create bitmap index am_biodata_organization on act_metric_swap_biodata(organization) local parallel 4 nologging;
--rollback drop index am_biodata_organization;

--changeset drsteini:WQP-913-create-am_biodata_sample_media
create bitmap index am_biodata_sample_media on act_metric_swap_biodata(sample_media) local parallel 4 nologging;
--rollback drop index am_biodata_sample_media;

--changeset drsteini:WQP-913-create-am_biodata_site
create bitmap index am_biodata_site on act_metric_swap_biodata(site_id) local parallel 4 nologging;
--rollback drop index am_biodata_site;

--changeset drsteini:WQP-913-create-am_biodata_site_type
create bitmap index am_biodata_site_type on act_metric_swap_biodata(site_type) local parallel 4 nologging;
--rollback drop index am_biodata_site_type;

--changeset drsteini:WQP-913-create-am_biodata_state
create bitmap index am_biodata_state on act_metric_swap_biodata(state_code) local parallel 4 nologging;
--rollback drop index am_biodata_state;

--changeset drsteini:WQP-913-create-am_biodata_station
create bitmap index am_biodata_station on act_metric_swap_biodata(station_id) local parallel 4 nologging;
--rollback drop index am_biodata_station;

--changeset drsteini:WQP-933-create-as_biodata_country
create bitmap index as_biodata_country on activity_sum_swap_biodata(country_code) local parallel 4 nologging;
--rollback drop index as_biodata_country;

--changeset drsteini:WQP-933-create-as_biodata_county
create bitmap index as_biodata_county on activity_sum_swap_biodata(county_code) local parallel 4 nologging;
--rollback drop index as_biodata_county;

--changeset drsteini:WQP-933-create-as_biodata_event_date
create bitmap index as_biodata_event_date on activity_sum_swap_biodata(event_date) local parallel 4 nologging;
--rollback drop index as_biodata_event_date;

--changeset drsteini:WQP-933-create-as_biodata_huc10
create bitmap index as_biodata_huc10 on activity_sum_swap_biodata(huc_10) local parallel 4 nologging;
--rollback drop index as_biodata_huc10;

--changeset drsteini:WQP-933-create-as_biodata_huc12
create bitmap index as_biodata_huc12 on activity_sum_swap_biodata(huc_12) local parallel 4 nologging;
--rollback drop index as_biodata_huc12;

--changeset drsteini:WQP-933-create-as_biodata_huc2
create bitmap index as_biodata_huc2 on activity_sum_swap_biodata(huc_2) local parallel 4 nologging;
--rollback drop index as_biodata_huc2;

--changeset drsteini:WQP-933-create-as_biodata_huc4
create bitmap index as_biodata_huc4 on activity_sum_swap_biodata(huc_4) local parallel 4 nologging;
--rollback drop index as_biodata_huc4;

--changeset drsteini:WQP-933-create-as_biodata_huc6
create bitmap index as_biodata_huc6 on activity_sum_swap_biodata(huc_6) local parallel 4 nologging;
--rollback drop index as_biodata_huc6;

--changeset drsteini:WQP-933-create-as_biodata_huc8
create bitmap index as_biodata_huc8 on activity_sum_swap_biodata(huc_8) local parallel 4 nologging;
--rollback drop index as_biodata_huc8;

--changeset drsteini:WQP-933-create-as_biodata_organization
create bitmap index as_biodata_organization on activity_sum_swap_biodata(organization) local parallel 4 nologging;
--rollback drop index as_biodata_organization;

--changeset drsteini:WQP-933-create-as_biodata_project
create bitmap index as_biodata_project on activity_sum_swap_biodata(project_id) local parallel 4 nologging;
--rollback drop index as_biodata_project;

--changeset drsteini:WQP-933-create-as_biodata_sample_media
create bitmap index as_biodata_sample_media on activity_sum_swap_biodata(sample_media) local parallel 4 nologging;
--rollback drop index as_biodata_sample_media;

--changeset drsteini:WQP-933-create-as_biodata_site
create bitmap index as_biodata_site on activity_sum_swap_biodata(site_id) local parallel 4 nologging;
--rollback drop index as_biodata_site;

--changeset drsteini:WQP-933-create-as_biodata_site_type
create bitmap index as_biodata_site_type on activity_sum_swap_biodata(site_type) local parallel 4 nologging;
--rollback drop index as_biodata_site_type;

--changeset drsteini:WQP-933-create-as_biodata_state
create bitmap index as_biodata_state on activity_sum_swap_biodata(state_code) local parallel 4 nologging;
--rollback drop index as_biodata_state;

--changeset drsteini:WQP-933-create-as_biodata_station
create bitmap index as_biodata_station on activity_sum_swap_biodata(station_id) local parallel 4 nologging;
--rollback drop index as_biodata_station;
