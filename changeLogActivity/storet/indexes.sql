--liquibase formatted sql

--This is for the wqp_core schema

--changeset drsteini:WQP-913-create-a_storet_activity_id
create bitmap index a_storet_activity_id on activity_swap_storet(activity_id) local parallel 4 nologging;
--rollback drop index a_storet_activity_id;

--changeset drsteini:WQP-913-create-a_storet_activity
create bitmap index a_storet_activity on activity_swap_storet(activity) local parallel 4 nologging;
--rollback drop index a_storet_activity;

--changeset drsteini:WQP-913-create-a_storet_country
create bitmap index a_storet_country on activity_swap_storet(country_code) local parallel 4 nologging;
--rollback drop index a_storet_country;

--changeset drsteini:WQP-913-create-a_storet_county
create bitmap index a_storet_county on activity_swap_storet(county_code) local parallel 4 nologging;
--rollback drop index a_storet_county;

--changeset drsteini:WQP-913-create-a_storet_event_date
create bitmap index a_storet_event_date on activity_swap_storet(event_date) local parallel 4 nologging;
--rollback drop index a_storet_event_date;

--changeset drsteini:WQP-913-create-a_storet_huc10
create bitmap index a_storet_huc10 on activity_swap_storet(huc_10) local parallel 4 nologging;
--rollback drop index a_storet_huc10;

--changeset drsteini:WQP-913-create-a_storet_huc12
create bitmap index a_storet_huc12 on activity_swap_storet(huc_12) local parallel 4 nologging;
--rollback drop index a_storet_huc12;

--changeset drsteini:WQP-913-create-a_storet_huc2
create bitmap index a_storet_huc2 on activity_swap_storet(huc_2) local parallel 4 nologging;
--rollback drop index a_storet_huc2;

--changeset drsteini:WQP-913-create-a_storet_huc4
create bitmap index a_storet_huc4 on activity_swap_storet(huc_4) local parallel 4 nologging;
--rollback drop index a_storet_huc4;

--changeset drsteini:WQP-913-create-a_storet_huc6
create bitmap index a_storet_huc6 on activity_swap_storet(huc_6) local parallel 4 nologging;
--rollback drop index a_storet_huc6;

--changeset drsteini:WQP-913-create-a_storet_huc8
create bitmap index a_storet_huc8 on activity_swap_storet(huc_8) local parallel 4 nologging;
--rollback drop index a_storet_huc8;

--changeset drsteini:WQP-913-create-a_storet_organization
create bitmap index a_storet_organization on activity_swap_storet(organization) local parallel 4 nologging;
--rollback drop index a_storet_organization;

--changeset drsteini:WQP-913-create-a_storet_sample_media
create bitmap index a_storet_sample_media on activity_swap_storet(sample_media) local parallel 4 nologging;
--rollback drop index a_storet_sample_media;

--changeset drsteini:WQP-913-create-a_storet_site
create bitmap index a_storet_site on activity_swap_storet(site_id) local parallel 4 nologging;
--rollback drop index a_storet_site;

--changeset drsteini:WQP-913-create-a_storet_site_type
create bitmap index a_storet_site_type on activity_swap_storet(site_type) local parallel 4 nologging;
--rollback drop index a_storet_site_type;

--changeset drsteini:WQP-913-create-a_storet_state
create bitmap index a_storet_state on activity_swap_storet(state_code) local parallel 4 nologging;
--rollback drop index a_storet_state;

--changeset drsteini:WQP-913-create-a_storet_station
create bitmap index a_storet_station on activity_swap_storet(station_id) local parallel 4 nologging;
--rollback drop index a_storet_station;



--changeset drsteini:WQP-913-create-am_storet_activity_id
create bitmap index am_storet_activity_id on act_metric_swap_storet(activity_id) local parallel 4 nologging;
--rollback drop index am_storet_activity_id;

--changeset drsteini:WQP-913-create-am_storet_activity
create bitmap index am_storet_activity on act_metric_swap_storet(activity) local parallel 4 nologging;
--rollback drop index am_storet_activity;

--changeset drsteini:WQP-913-create-am_storet_country
create bitmap index am_storet_country on act_metric_swap_storet(country_code) local parallel 4 nologging;
--rollback drop index am_storet_country;

--changeset drsteini:WQP-913-create-am_storet_county
create bitmap index am_storet_county on act_metric_swap_storet(county_code) local parallel 4 nologging;
--rollback drop index am_storet_county;

--changeset drsteini:WQP-913-create-am_storet_event_date
create bitmap index am_storet_event_date on act_metric_swap_storet(event_date) local parallel 4 nologging;
--rollback drop index am_storet_event_date;

--changeset drsteini:WQP-913-create-am_storet_huc10
create bitmap index am_storet_huc10 on act_metric_swap_storet(huc_10) local parallel 4 nologging;
--rollback drop index am_storet_huc10;

--changeset drsteini:WQP-913-create-am_storet_huc12
create bitmap index am_storet_huc12 on act_metric_swap_storet(huc_12) local parallel 4 nologging;
--rollback drop index am_storet_huc12;

--changeset drsteini:WQP-913-create-am_storet_huc2
create bitmap index am_storet_huc2 on act_metric_swap_storet(huc_2) local parallel 4 nologging;
--rollback drop index am_storet_huc2;

--changeset drsteini:WQP-913-create-am_storet_huc4
create bitmap index am_storet_huc4 on act_metric_swap_storet(huc_4) local parallel 4 nologging;
--rollback drop index am_storet_huc4;

--changeset drsteini:WQP-913-create-am_storet_huc6
create bitmap index am_storet_huc6 on act_metric_swap_storet(huc_6) local parallel 4 nologging;
--rollback drop index am_storet_huc6;

--changeset drsteini:WQP-913-create-am_storet_huc8
create bitmap index am_storet_huc8 on act_metric_swap_storet(huc_8) local parallel 4 nologging;
--rollback drop index am_storet_huc8;

--changeset drsteini:WQP-913-create-am_storet_organization
create bitmap index am_storet_organization on act_metric_swap_storet(organization) local parallel 4 nologging;
--rollback drop index am_storet_organization;

--changeset drsteini:WQP-913-create-am_storet_sample_media
create bitmap index am_storet_sample_media on act_metric_swap_storet(sample_media) local parallel 4 nologging;
--rollback drop index am_storet_sample_media;

--changeset drsteini:WQP-913-create-am_storet_site
create bitmap index am_storet_site on act_metric_swap_storet(site_id) local parallel 4 nologging;
--rollback drop index am_storet_site;

--changeset drsteini:WQP-913-create-am_storet_site_type
create bitmap index am_storet_site_type on act_metric_swap_storet(site_type) local parallel 4 nologging;
--rollback drop index am_storet_site_type;

--changeset drsteini:WQP-913-create-am_storet_state
create bitmap index am_storet_state on act_metric_swap_storet(state_code) local parallel 4 nologging;
--rollback drop index am_storet_state;

--changeset drsteini:WQP-913-create-am_storet_station
create bitmap index am_storet_station on act_metric_swap_storet(station_id) local parallel 4 nologging;
--rollback drop index am_storet_station;

