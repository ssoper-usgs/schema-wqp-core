create unlogged table if not exists ${schemaName}.org_data
(data_source_id                 smallint
,data_source                    character varying (8)
,organization_id                numeric
,organization                   text
,organization_name              text
,organization_description       text
,tribal_code                    text
,electronic_address             text
,telephonic                     text
,address_type_1                 text
,address_text_1                 text
,supplemental_address_text_1    text
,locality_name_1                text
,postal_code_1                  character varying (10)
,country_code_1                 character varying (2)
,state_code_1                   character varying (2)
,county_code_1                  character varying (3)
,address_type_2                 text
,address_text_2                 text
,supplemental_address_text_2    text
,locality_name_2                text
,postal_code_2                  character varying (10)
,country_code_2                 character varying (2)
,state_code_2                   character varying (2)
,county_code_2                  character varying (3)
,address_type_3                 text
,address_text_3                 text
,supplemental_address_text_3    text
,locality_name_3                text
,postal_code_3                  character varying (10)
,country_code_3                 character varying (2)
,state_code_3                   character varying (2)
,county_code_3                  character varying (3)
,organization_type              text

)
partition by list (data_source_id)
;
