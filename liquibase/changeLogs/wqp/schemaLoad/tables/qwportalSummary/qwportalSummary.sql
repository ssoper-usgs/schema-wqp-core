create unlogged table if not exists ${WQP_SCHEMA_NAME}.qwportal_summary
(data_source_id                 smallint
,fips_state_code                character varying (2)
,fips_county_code               character varying (3)
,fips_state_and_county          character varying (5)
,site_type                      character varying (30)
,huc8                           character varying (8)
,min_date                       date
,max_date                       date
,samples_past_12_months         integer
,samples_past_60_months         integer
,samples_all_time               integer
,results_past_12_months         integer
,results_past_60_months         integer
,results_all_time               integer
,nwis_or_epa                    character varying (1)
)
partition by list (data_source_id)
;
