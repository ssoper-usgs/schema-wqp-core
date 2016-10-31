--liquibase formatted sql

--This is for the wqp_core schema

--changeset drsteini:WQP-913-create-a_stewards_activity_id
create bitmap index a_stewards_activity_id on activity_swap_stewards(activity_id) local parallel 4 nologging;
--rollback drop index a_stewards_activity_id;

--changeset drsteini:WQP-913-create-a_stewards_activity
create bitmap index a_stewards_activity on activity_swap_stewards(activity) local parallel 4 nologging;
--rollback drop index a_stewards_activity;

--changeset drsteini:WQP-913-create-a_stewards_country
create bitmap index a_stewards_country on activity_swap_stewards(country_code) local parallel 4 nologging;
--rollback drop index a_stewards_country;

--changeset drsteini:WQP-913-create-a_stewards_county
create bitmap index a_stewards_county on activity_swap_stewards(county_code) local parallel 4 nologging;
--rollback drop index a_stewards_county;

--changeset drsteini:WQP-913-create-a_stewards_event_date
create bitmap index a_stewards_event_date on activity_swap_stewards(event_date) local parallel 4 nologging;
--rollback drop index a_stewards_event_date;

--changeset drsteini:WQP-913-create-a_stewards_huc10
create bitmap index a_stewards_huc10 on activity_swap_stewards(huc_10) local parallel 4 nologging;
--rollback drop index a_stewards_huc10;

--changeset drsteini:WQP-913-create-a_stewards_huc12
create bitmap index a_stewards_huc12 on activity_swap_stewards(huc_12) local parallel 4 nologging;
--rollback drop index a_stewards_huc12;

--changeset drsteini:WQP-913-create-a_stewards_huc2
create bitmap index a_stewards_huc2 on activity_swap_stewards(huc_2) local parallel 4 nologging;
--rollback drop index a_stewards_huc2;

--changeset drsteini:WQP-913-create-a_stewards_huc4
create bitmap index a_stewards_huc4 on activity_swap_stewards(huc_4) local parallel 4 nologging;
--rollback drop index a_stewards_huc4;

--changeset drsteini:WQP-913-create-a_stewards_huc6
create bitmap index a_stewards_huc6 on activity_swap_stewards(huc_6) local parallel 4 nologging;
--rollback drop index a_stewards_huc6;

--changeset drsteini:WQP-913-create-a_stewards_huc8
create bitmap index a_stewards_huc8 on activity_swap_stewards(huc_8) local parallel 4 nologging;
--rollback drop index a_stewards_huc8;

--changeset drsteini:WQP-913-create-a_stewards_organization
create bitmap index a_stewards_organization on activity_swap_stewards(organization) local parallel 4 nologging;
--rollback drop index a_stewards_organization;

--changeset drsteini:WQP-913-create-a_stewards_sample_media
create bitmap index a_stewards_sample_media on activity_swap_stewards(sample_media) local parallel 4 nologging;
--rollback drop index a_stewards_sample_media;

--changeset drsteini:WQP-913-create-a_stewards_site
create bitmap index a_stewards_site on activity_swap_stewards(site_id) local parallel 4 nologging;
--rollback drop index a_stewards_site;

--changeset drsteini:WQP-913-create-a_stewards_site_type
create bitmap index a_stewards_site_type on activity_swap_stewards(site_type) local parallel 4 nologging;
--rollback drop index a_stewards_site_type;

--changeset drsteini:WQP-913-create-a_stewards_state
create bitmap index a_stewards_state on activity_swap_stewards(state_code) local parallel 4 nologging;
--rollback drop index a_stewards_state;

--changeset drsteini:WQP-913-create-a_stewards_station
create bitmap index a_stewards_station on activity_swap_stewards(station_id) local parallel 4 nologging;
--rollback drop index a_stewards_station;



--changeset drsteini:WQP-913-create-am_stewards_activity_id
create bitmap index am_stewards_activity_id on act_metric_swap_stewards(activity_id) local parallel 4 nologging;
--rollback drop index am_stewards_activity_id;

--changeset drsteini:WQP-913-create-am_stewards_activity
create bitmap index am_stewards_activity on act_metric_swap_stewards(activity) local parallel 4 nologging;
--rollback drop index am_stewards_activity;

--changeset drsteini:WQP-913-create-am_stewards_country
create bitmap index am_stewards_country on act_metric_swap_stewards(country_code) local parallel 4 nologging;
--rollback drop index am_stewards_country;

--changeset drsteini:WQP-913-create-am_stewards_county
create bitmap index am_stewards_county on act_metric_swap_stewards(county_code) local parallel 4 nologging;
--rollback drop index am_stewards_county;

--changeset drsteini:WQP-913-create-am_stewards_event_date
create bitmap index am_stewards_event_date on act_metric_swap_stewards(event_date) local parallel 4 nologging;
--rollback drop index am_stewards_event_date;

--changeset drsteini:WQP-913-create-am_stewards_huc10
create bitmap index am_stewards_huc10 on act_metric_swap_stewards(huc_10) local parallel 4 nologging;
--rollback drop index am_stewards_huc10;

--changeset drsteini:WQP-913-create-am_stewards_huc12
create bitmap index am_stewards_huc12 on act_metric_swap_stewards(huc_12) local parallel 4 nologging;
--rollback drop index am_stewards_huc12;

--changeset drsteini:WQP-913-create-am_stewards_huc2
create bitmap index am_stewards_huc2 on act_metric_swap_stewards(huc_2) local parallel 4 nologging;
--rollback drop index am_stewards_huc2;

--changeset drsteini:WQP-913-create-am_stewards_huc4
create bitmap index am_stewards_huc4 on act_metric_swap_stewards(huc_4) local parallel 4 nologging;
--rollback drop index am_stewards_huc4;

--changeset drsteini:WQP-913-create-am_stewards_huc6
create bitmap index am_stewards_huc6 on act_metric_swap_stewards(huc_6) local parallel 4 nologging;
--rollback drop index am_stewards_huc6;

--changeset drsteini:WQP-913-create-am_stewards_huc8
create bitmap index am_stewards_huc8 on act_metric_swap_stewards(huc_8) local parallel 4 nologging;
--rollback drop index am_stewards_huc8;

--changeset drsteini:WQP-913-create-am_stewards_organization
create bitmap index am_stewards_organization on act_metric_swap_stewards(organization) local parallel 4 nologging;
--rollback drop index am_stewards_organization;

--changeset drsteini:WQP-913-create-am_stewards_sample_media
create bitmap index am_stewards_sample_media on act_metric_swap_stewards(sample_media) local parallel 4 nologging;
--rollback drop index am_stewards_sample_media;

--changeset drsteini:WQP-913-create-am_stewards_site
create bitmap index am_stewards_site on act_metric_swap_stewards(site_id) local parallel 4 nologging;
--rollback drop index am_stewards_site;

--changeset drsteini:WQP-913-create-am_stewards_site_type
create bitmap index am_stewards_site_type on act_metric_swap_stewards(site_type) local parallel 4 nologging;
--rollback drop index am_stewards_site_type;

--changeset drsteini:WQP-913-create-am_stewards_state
create bitmap index am_stewards_state on act_metric_swap_stewards(state_code) local parallel 4 nologging;
--rollback drop index am_stewards_state;

--changeset drsteini:WQP-913-create-am_stewards_station
create bitmap index am_stewards_station on act_metric_swap_stewards(station_id) local parallel 4 nologging;
--rollback drop index am_stewards_station;

