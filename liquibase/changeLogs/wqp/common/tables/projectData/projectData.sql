create table project_data
(data_source_id					number
,project_id						number
,data_source					varchar2(8 char)
,organization					varchar2(4000 char)
,organization_name				varchar2(4000 char)
,project_identifier				varchar2(4000 char)
,project_name					varchar2(4000 char)
,description					varchar2(4000 char)
,sampling_design_type_code		varchar2(4000 char)
,qapp_approved_indicator		varchar2(4000 char)
,qapp_approval_agency_name		varchar2(4000 char)
,project_file_url				varchar2(4000 char)
,monitoring_location_weight_url	varchar2(4000 char)
) parallel 4 compress pctfree 0 nologging cache
partition by range (data_source_id)
(partition project_data_garbage values less than (maxvalue)
);
