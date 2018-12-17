create unlogged table if not exists ${schemaName}.project_data
(data_source_id					smallint
,project_id						numeric
,data_source					character varying (8)
,organization					text
,organization_name				text
,project_identifier				text
,project_name					text
,description					text
,sampling_design_type_code		text
,qapp_approved_indicator		text
,qapp_approval_agency_name		text
,project_file_url				text
,monitoring_location_weight_url	text
)
partition by list (data_source_id)
;
