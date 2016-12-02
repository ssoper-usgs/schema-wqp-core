--liquibase formatted sql

--This is for the wqp_core schema

--changeset drsteini:WQP-913-create-a_nwis_activity_id
create bitmap index a_nwis_activity_id on activity_swap_nwis(activity_id) local parallel 4 nologging;
--rollback drop index a_nwis_activity_id;

--changeset drsteini:WQP-913-create-a_nwis_activity
create bitmap index a_nwis_activity on activity_swap_nwis(activity) local parallel 4 nologging;
--rollback drop index a_nwis_activity;

--changeset drsteini:WQP-913-create-a_nwis_country
create bitmap index a_nwis_country on activity_swap_nwis(country_code) local parallel 4 nologging;
--rollback drop index a_nwis_country;

--changeset drsteini:WQP-913-create-a_nwis_county
create bitmap index a_nwis_county on activity_swap_nwis(county_code) local parallel 4 nologging;
--rollback drop index a_nwis_county;

--changeset drsteini:WQP-913-create-a_nwis_event_date
create bitmap index a_nwis_event_date on activity_swap_nwis(event_date) local parallel 4 nologging;
--rollback drop index a_nwis_event_date;

--changeset drsteini:WQP-913-create-a_nwis_huc10
create bitmap index a_nwis_huc10 on activity_swap_nwis(huc_10) local parallel 4 nologging;
--rollback drop index a_nwis_huc10;

--changeset drsteini:WQP-913-create-a_nwis_huc12
create bitmap index a_nwis_huc12 on activity_swap_nwis(huc_12) local parallel 4 nologging;
--rollback drop index a_nwis_huc12;

--changeset drsteini:WQP-913-create-a_nwis_huc2
create bitmap index a_nwis_huc2 on activity_swap_nwis(huc_2) local parallel 4 nologging;
--rollback drop index a_nwis_huc2;

--changeset drsteini:WQP-913-create-a_nwis_huc4
create bitmap index a_nwis_huc4 on activity_swap_nwis(huc_4) local parallel 4 nologging;
--rollback drop index a_nwis_huc4;

--changeset drsteini:WQP-913-create-a_nwis_huc6
create bitmap index a_nwis_huc6 on activity_swap_nwis(huc_6) local parallel 4 nologging;
--rollback drop index a_nwis_huc6;

--changeset drsteini:WQP-913-create-a_nwis_huc8
create bitmap index a_nwis_huc8 on activity_swap_nwis(huc_8) local parallel 4 nologging;
--rollback drop index a_nwis_huc8;

--changeset drsteini:WQP-913-create-a_nwis_organization
create bitmap index a_nwis_organization on activity_swap_nwis(organization) local parallel 4 nologging;
--rollback drop index a_nwis_organization;

--changeset drsteini:WQP-913-create-a_nwis_sample_media
create bitmap index a_nwis_sample_media on activity_swap_nwis(sample_media) local parallel 4 nologging;
--rollback drop index a_nwis_sample_media;

--changeset drsteini:WQP-913-create-a_nwis_site
create bitmap index a_nwis_site on activity_swap_nwis(site_id) local parallel 4 nologging;
--rollback drop index a_nwis_site;

--changeset drsteini:WQP-913-create-a_nwis_site_type
create bitmap index a_nwis_site_type on activity_swap_nwis(site_type) local parallel 4 nologging;
--rollback drop index a_nwis_site_type;

--changeset drsteini:WQP-913-create-a_nwis_state
create bitmap index a_nwis_state on activity_swap_nwis(state_code) local parallel 4 nologging;
--rollback drop index a_nwis_state;

--changeset drsteini:WQP-913-create-a_nwis_station
create bitmap index a_nwis_station on activity_swap_nwis(station_id) local parallel 4 nologging;
--rollback drop index a_nwis_station;



--changeset drsteini:WQP-913-create-am_nwis_activity_id
create bitmap index am_nwis_activity_id on act_metric_swap_nwis(activity_id) local parallel 4 nologging;
--rollback drop index am_nwis_activity_id;

--changeset drsteini:WQP-913-create-am_nwis_activity
create bitmap index am_nwis_activity on act_metric_swap_nwis(activity) local parallel 4 nologging;
--rollback drop index am_nwis_activity;

--changeset drsteini:WQP-913-create-am_nwis_country
create bitmap index am_nwis_country on act_metric_swap_nwis(country_code) local parallel 4 nologging;
--rollback drop index am_nwis_country;

--changeset drsteini:WQP-913-create-am_nwis_county
create bitmap index am_nwis_county on act_metric_swap_nwis(county_code) local parallel 4 nologging;
--rollback drop index am_nwis_county;

--changeset drsteini:WQP-913-create-am_nwis_event_date
create bitmap index am_nwis_event_date on act_metric_swap_nwis(event_date) local parallel 4 nologging;
--rollback drop index am_nwis_event_date;

--changeset drsteini:WQP-913-create-am_nwis_huc10
create bitmap index am_nwis_huc10 on act_metric_swap_nwis(huc_10) local parallel 4 nologging;
--rollback drop index am_nwis_huc10;

--changeset drsteini:WQP-913-create-am_nwis_huc12
create bitmap index am_nwis_huc12 on act_metric_swap_nwis(huc_12) local parallel 4 nologging;
--rollback drop index am_nwis_huc12;

--changeset drsteini:WQP-913-create-am_nwis_huc2
create bitmap index am_nwis_huc2 on act_metric_swap_nwis(huc_2) local parallel 4 nologging;
--rollback drop index am_nwis_huc2;

--changeset drsteini:WQP-913-create-am_nwis_huc4
create bitmap index am_nwis_huc4 on act_metric_swap_nwis(huc_4) local parallel 4 nologging;
--rollback drop index am_nwis_huc4;

--changeset drsteini:WQP-913-create-am_nwis_huc6
create bitmap index am_nwis_huc6 on act_metric_swap_nwis(huc_6) local parallel 4 nologging;
--rollback drop index am_nwis_huc6;

--changeset drsteini:WQP-913-create-am_nwis_huc8
create bitmap index am_nwis_huc8 on act_metric_swap_nwis(huc_8) local parallel 4 nologging;
--rollback drop index am_nwis_huc8;

--changeset drsteini:WQP-913-create-am_nwis_organization
create bitmap index am_nwis_organization on act_metric_swap_nwis(organization) local parallel 4 nologging;
--rollback drop index am_nwis_organization;

--changeset drsteini:WQP-913-create-am_nwis_sample_media
create bitmap index am_nwis_sample_media on act_metric_swap_nwis(sample_media) local parallel 4 nologging;
--rollback drop index am_nwis_sample_media;

--changeset drsteini:WQP-913-create-am_nwis_site
create bitmap index am_nwis_site on act_metric_swap_nwis(site_id) local parallel 4 nologging;
--rollback drop index am_nwis_site;

--changeset drsteini:WQP-913-create-am_nwis_site_type
create bitmap index am_nwis_site_type on act_metric_swap_nwis(site_type) local parallel 4 nologging;
--rollback drop index am_nwis_site_type;

--changeset drsteini:WQP-913-create-am_nwis_state
create bitmap index am_nwis_state on act_metric_swap_nwis(state_code) local parallel 4 nologging;
--rollback drop index am_nwis_state;

--changeset drsteini:WQP-913-create-am_nwis_station
create bitmap index am_nwis_station on act_metric_swap_nwis(station_id) local parallel 4 nologging;
--rollback drop index am_nwis_station;

--changeset drsteini:WQP-933-create-as_nwis_country
create bitmap index as_nwis_country on activity_sum_swap_nwis(country_code) local parallel 4 nologging;
--rollback drop index as_nwis_country;

--changeset drsteini:WQP-933-create-as_nwis_county
create bitmap index as_nwis_county on activity_sum_swap_nwis(county_code) local parallel 4 nologging;
--rollback drop index as_nwis_county;

--changeset drsteini:WQP-933-create-as_nwis_event_date
create bitmap index as_nwis_event_date on activity_sum_swap_nwis(event_date) local parallel 4 nologging;
--rollback drop index as_nwis_event_date;

--changeset drsteini:WQP-933-create-as_nwis_huc10
create bitmap index as_nwis_huc10 on activity_sum_swap_nwis(huc_10) local parallel 4 nologging;
--rollback drop index as_nwis_huc10;

--changeset drsteini:WQP-933-create-as_nwis_huc12
create bitmap index as_nwis_huc12 on activity_sum_swap_nwis(huc_12) local parallel 4 nologging;
--rollback drop index as_nwis_huc12;

--changeset drsteini:WQP-933-create-as_nwis_huc2
create bitmap index as_nwis_huc2 on activity_sum_swap_nwis(huc_2) local parallel 4 nologging;
--rollback drop index as_nwis_huc2;

--changeset drsteini:WQP-933-create-as_nwis_huc4
create bitmap index as_nwis_huc4 on activity_sum_swap_nwis(huc_4) local parallel 4 nologging;
--rollback drop index as_nwis_huc4;

--changeset drsteini:WQP-933-create-as_nwis_huc6
create bitmap index as_nwis_huc6 on activity_sum_swap_nwis(huc_6) local parallel 4 nologging;
--rollback drop index as_nwis_huc6;

--changeset drsteini:WQP-933-create-as_nwis_huc8
create bitmap index as_nwis_huc8 on activity_sum_swap_nwis(huc_8) local parallel 4 nologging;
--rollback drop index as_nwis_huc8;

--changeset drsteini:WQP-933-create-as_nwis_organization
create bitmap index as_nwis_organization on activity_sum_swap_nwis(organization) local parallel 4 nologging;
--rollback drop index as_nwis_organization;

--changeset drsteini:WQP-933-create-as_nwis_project
create bitmap index as_nwis_project on activity_sum_swap_nwis(project_id) local parallel 4 nologging;
--rollback drop index as_nwis_project;

--changeset drsteini:WQP-933-create-as_nwis_sample_media
create bitmap index as_nwis_sample_media on activity_sum_swap_nwis(sample_media) local parallel 4 nologging;
--rollback drop index as_nwis_sample_media;

--changeset drsteini:WQP-933-create-as_nwis_site
create bitmap index as_nwis_site on activity_sum_swap_nwis(site_id) local parallel 4 nologging;
--rollback drop index as_nwis_site;

--changeset drsteini:WQP-933-create-as_nwis_site_type
create bitmap index as_nwis_site_type on activity_sum_swap_nwis(site_type) local parallel 4 nologging;
--rollback drop index as_nwis_site_type;

--changeset drsteini:WQP-933-create-as_nwis_state
create bitmap index as_nwis_state on activity_sum_swap_nwis(state_code) local parallel 4 nologging;
--rollback drop index as_nwis_state;

--changeset drsteini:WQP-933-create-as_nwis_station
create bitmap index as_nwis_station on activity_sum_swap_nwis(station_id) local parallel 4 nologging;
--rollback drop index as_nwis_station;
