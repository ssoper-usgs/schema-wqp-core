--liquibase formatted sql

--This is for the wqp_core schema

--changeset drsteini:WQP-913-create-activity_activity_id
create bitmap index activity_activity_id on activity(activity_id) local parallel 4 nologging;
--rollback drop index activity_activity_id;

--changeset drsteini:WQP-913-create-activity_activity
create bitmap index activity_activity on activity(activity) local parallel 4 nologging;
--rollback drop index activity_activity;

--changeset drsteini:WQP-913-create-activity_country
create bitmap index activity_country on activity(country_code) local parallel 4 nologging;
--rollback drop index activity_country;

--changeset drsteini:WQP-913-create-activity_county
create bitmap index activity_county on activity(county_code) local parallel 4 nologging;
--rollback drop index activity_county;

--changeset drsteini:WQP-913-create-activity_event_date
create bitmap index activity_event_date on activity(event_date) local parallel 4 nologging;
--rollback drop index activity_event_date;

--changeset drsteini:WQP-913-create-activity_huc10
create bitmap index activity_huc10 on activity(huc_10) local parallel 4 nologging;
--rollback drop index activity_huc10;

--changeset drsteini:WQP-913-create-activity_huc12
create bitmap index activity_huc12 on activity(huc_12) local parallel 4 nologging;
--rollback drop index activity_huc12;

--changeset drsteini:WQP-913-create-activity_huc2
create bitmap index activity_huc2 on activity(huc_2) local parallel 4 nologging;
--rollback drop index activity_huc2;

--changeset drsteini:WQP-913-create-activity_huc4
create bitmap index activity_huc4 on activity(huc_4) local parallel 4 nologging;
--rollback drop index activity_huc4;

--changeset drsteini:WQP-913-create-activity_huc6
create bitmap index activity_huc6 on activity(huc_6) local parallel 4 nologging;
--rollback drop index activity_huc6;

--changeset drsteini:WQP-913-create-activity_huc8
create bitmap index activity_huc8 on activity(huc_8) local parallel 4 nologging;
--rollback drop index activity_huc8;

--changeset drsteini:WQP-913-create-activity_organization
create bitmap index activity_organization on activity(organization) local parallel 4 nologging;
--rollback drop index activity_organization;

--changeset drsteini:WQP-913-create-activity_sample_media
create bitmap index activity_sample_media on activity(sample_media) local parallel 4 nologging;
--rollback drop index activity_sample_media;

--changeset drsteini:WQP-913-create-activity_site
create bitmap index activity_site on activity(site_id) local parallel 4 nologging;
--rollback drop index activity_site;

--changeset drsteini:WQP-913-create-activity_site_type
create bitmap index activity_site_type on activity(site_type) local parallel 4 nologging;
--rollback drop index activity_site_type;

--changeset drsteini:WQP-913-create-activity_state
create bitmap index activity_state on activity(state_code) local parallel 4 nologging;
--rollback drop index activity_state;

--changeset drsteini:WQP-913-create-activity_station
create bitmap index activity_station on activity(station_id) local parallel 4 nologging;
--rollback drop index activity_station;



--changeset drsteini:WQP-913-create-act_metric_activity_id
create bitmap index act_metric_activity_id on act_metric(activity_id) local parallel 4 nologging;
--rollback drop index act_metric_activity_id;

--changeset drsteini:WQP-913-create-act_metric_activity
create bitmap index act_metric_activity on act_metric(activity) local parallel 4 nologging;
--rollback drop index act_metric_activity;

--changeset drsteini:WQP-913-create-act_metric_country
create bitmap index act_metric_country on act_metric(country_code) local parallel 4 nologging;
--rollback drop index act_metric_country;

--changeset drsteini:WQP-913-create-act_metric_county
create bitmap index act_metric_county on act_metric(county_code) local parallel 4 nologging;
--rollback drop index act_metric_county;

--changeset drsteini:WQP-913-create-act_metric_event_date
create bitmap index act_metric_event_date on act_metric(event_date) local parallel 4 nologging;
--rollback drop index act_metric_event_date;

--changeset drsteini:WQP-913-create-act_metric_huc10
create bitmap index act_metric_huc10 on act_metric(huc_10) local parallel 4 nologging;
--rollback drop index act_metric_huc10;

--changeset drsteini:WQP-913-create-act_metric_huc12
create bitmap index act_metric_huc12 on act_metric(huc_12) local parallel 4 nologging;
--rollback drop index act_metric_huc12;

--changeset drsteini:WQP-913-create-act_metric_huc2
create bitmap index act_metric_huc2 on act_metric(huc_2) local parallel 4 nologging;
--rollback drop index act_metric_huc2;

--changeset drsteini:WQP-913-create-act_metric_huc4
create bitmap index act_metric_huc4 on act_metric(huc_4) local parallel 4 nologging;
--rollback drop index act_metric_huc4;

--changeset drsteini:WQP-913-create-act_metric_huc6
create bitmap index act_metric_huc6 on act_metric(huc_6) local parallel 4 nologging;
--rollback drop index act_metric_huc6;

--changeset drsteini:WQP-913-create-act_metric_huc8
create bitmap index act_metric_huc8 on act_metric(huc_8) local parallel 4 nologging;
--rollback drop index act_metric_huc8;

--changeset drsteini:WQP-913-create-act_metric_organization
create bitmap index act_metric_organization on act_metric(organization) local parallel 4 nologging;
--rollback drop index act_metric_organization;

--changeset drsteini:WQP-913-create-act_metric_sample_media
create bitmap index act_metric_sample_media on act_metric(sample_media) local parallel 4 nologging;
--rollback drop index act_metric_sample_media;

--changeset drsteini:WQP-913-create-act_metric_site
create bitmap index act_metric_site on act_metric(site_id) local parallel 4 nologging;
--rollback drop index act_metric_site;

--changeset drsteini:WQP-913-create-act_metric_site_type
create bitmap index act_metric_site_type on act_metric(site_type) local parallel 4 nologging;
--rollback drop index act_metric_site_type;

--changeset drsteini:WQP-913-create-act_metric_state
create bitmap index act_metric_state on act_metric(state_code) local parallel 4 nologging;
--rollback drop index act_metric_state;

--changeset drsteini:WQP-913-create-act_metric_station
create bitmap index act_metric_station on act_metric(station_id) local parallel 4 nologging;
--rollback drop index act_metric_station;

