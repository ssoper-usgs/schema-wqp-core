create table r_detect_qnt_lmt_swap_biodata
(data_source_id                 number
,data_source                    varchar2(8 char)
,station_id                     number
,site_id                        varchar2(4000 char)
,event_date                     date
,activity                       varchar2(4000 char)
,analytical_method              varchar2(4000 char)
,p_code                         varchar2(4000 char)
,characteristic_name            varchar2(4000 char)
,characteristic_type            varchar2(4000 char)
,sample_media                   varchar2(4000 char)
,organization                   varchar2(4000 char)
,site_type                      varchar2(4000 char)
,huc                            varchar2(12 char)
,governmental_unit_code         varchar2(9 char)
,project_id                     varchar2(4000 char)
,assemblage_sampled_name        varchar2(4000 char)
,sample_tissue_taxonomic_name   varchar2(4000 char)
,activity_id                    number
,result_id                      number
,organization_name              varchar2(4000 char)
,detection_limit_id             number
,detection_limit                varchar2(4000 char)
,detection_limit_unit           varchar2(4000 char)
,detection_limit_desc           varchar2(4000 char)
,huc_2                          varchar2(2 char) generated always as (case  when length(huc)>1 then substr(huc,1,2) else null end)
,huc_4                          varchar2(4 char) generated always as (case  when length(huc)>3 then substr(huc,1,4) else null end)
,huc_6                          varchar2(6 char) generated always as (case  when length(huc)>5 then substr(huc,1,6) else null end)
,huc_8                          varchar2(8 char) generated always as (case  when length(huc)>7 then substr(huc,1,8) else null end)
,huc_10                         varchar2(10 char) generated always as (case  when length(huc)>9 then substr(huc,1,10) else null end)
,huc_12                         varchar2(12 char) generated always as (case length(huc) when 12 then substr(huc,1,12) else null end)
,country_code                   varchar2(9 char) generated always as (regexp_substr (governmental_unit_code,'[^:]+'))
,state_code                     varchar2(9 char) generated always as (regexp_substr (governmental_unit_code,'[^:]+:[^:]+'))
,county_code                    varchar2(9 char) generated always as (regexp_substr (governmental_unit_code,'[^:]+:[^:]+:[^:]+'))
) parallel 4 compress pctfree 0 nologging cache
partition by range (event_date)
(partition rdtct_qnt_lmt_biodata_p_1990 values less than (to_date('01-JAN-1990', 'DD-MON-YYYY')) tablespace result1,
 partition rdtct_qnt_lmt_biodata_y_1990 values less than (to_date('01-JAN-1991', 'DD-MON-YYYY')) tablespace result2,
 partition rdtct_qnt_lmt_biodata_y_1991 values less than (to_date('01-JAN-1992', 'DD-MON-YYYY')) tablespace result3,
 partition rdtct_qnt_lmt_biodata_y_1992 values less than (to_date('01-JAN-1993', 'DD-MON-YYYY')) tablespace result4,
 partition rdtct_qnt_lmt_biodata_y_1993 values less than (to_date('01-JAN-1994', 'DD-MON-YYYY')) tablespace result1,
 partition rdtct_qnt_lmt_biodata_y_1994 values less than (to_date('01-JAN-1995', 'DD-MON-YYYY')) tablespace result2,
 partition rdtct_qnt_lmt_biodata_y_1995 values less than (to_date('01-JAN-1996', 'DD-MON-YYYY')) tablespace result3,
 partition rdtct_qnt_lmt_biodata_y_1996 values less than (to_date('01-JAN-1997', 'DD-MON-YYYY')) tablespace result4,
 partition rdtct_qnt_lmt_biodata_y_1997 values less than (to_date('01-JAN-1998', 'DD-MON-YYYY')) tablespace result1,
 partition rdtct_qnt_lmt_biodata_y_1998 values less than (to_date('01-JAN-1999', 'DD-MON-YYYY')) tablespace result2,
 partition rdtct_qnt_lmt_biodata_y_1999 values less than (to_date('01-JAN-2000', 'DD-MON-YYYY')) tablespace result3,
 partition rdtct_qnt_lmt_biodata_y_2000 values less than (to_date('01-JAN-2001', 'DD-MON-YYYY')) tablespace result4,
 partition rdtct_qnt_lmt_biodata_y_2001 values less than (to_date('01-JAN-2002', 'DD-MON-YYYY')) tablespace result1,
 partition rdtct_qnt_lmt_biodata_y_2002 values less than (to_date('01-JAN-2003', 'DD-MON-YYYY')) tablespace result2,
 partition rdtct_qnt_lmt_biodata_y_2003 values less than (to_date('01-JAN-2004', 'DD-MON-YYYY')) tablespace result3,
 partition rdtct_qnt_lmt_biodata_y_2004 values less than (to_date('01-JAN-2005', 'DD-MON-YYYY')) tablespace result4,
 partition rdtct_qnt_lmt_biodata_y_2005 values less than (to_date('01-JAN-2006', 'DD-MON-YYYY')) tablespace result1,
 partition rdtct_qnt_lmt_biodata_y_2006 values less than (to_date('01-JAN-2007', 'DD-MON-YYYY')) tablespace result2,
 partition rdtct_qnt_lmt_biodata_y_2007 values less than (to_date('01-JAN-2008', 'DD-MON-YYYY')) tablespace result3,
 partition rdtct_qnt_lmt_biodata_y_2008 values less than (to_date('01-JAN-2009', 'DD-MON-YYYY')) tablespace result4,
 partition rdtct_qnt_lmt_biodata_y_2009 values less than (to_date('01-JAN-2010', 'DD-MON-YYYY')) tablespace result1,
 partition rdtct_qnt_lmt_biodata_y_2010 values less than (to_date('01-JAN-2011', 'DD-MON-YYYY')) tablespace result2,
 partition rdtct_qnt_lmt_biodata_y_2011 values less than (to_date('01-JAN-2012', 'DD-MON-YYYY')) tablespace result3,
 partition rdtct_qnt_lmt_biodata_y_2012 values less than (to_date('01-JAN-2013', 'DD-MON-YYYY')) tablespace result4,
 partition rdtct_qnt_lmt_biodata_y_2013 values less than (to_date('01-JAN-2014', 'DD-MON-YYYY')) tablespace result1,
 partition rdtct_qnt_lmt_biodata_y_2014 values less than (to_date('01-JAN-2015', 'DD-MON-YYYY')) tablespace result2,
 partition rdtct_qnt_lmt_biodata_y_2015 values less than (to_date('01-JAN-2016', 'DD-MON-YYYY')) tablespace result3,
 partition rdtct_qnt_lmt_biodata_y_2016 values less than (to_date('01-JAN-2017', 'DD-MON-YYYY')) tablespace result4,
 partition rdtct_qnt_lmt_biodata_y_2017 values less than (to_date('01-JAN-2018', 'DD-MON-YYYY')) tablespace result2,
 partition rdtct_qnt_lmt_biodata_y_2018 values less than (to_date('01-JAN-2019', 'DD-MON-YYYY')) tablespace result3,
 partition rdtct_qnt_lmt_biodata_y_2019 values less than (to_date('01-JAN-2020', 'DD-MON-YYYY')) tablespace result4,
 partition rdtct_qnt_lmt_biodata_y_2020 values less than (to_date('01-JAN-2021', 'DD-MON-YYYY')) tablespace result1,
 partition rdtct_qnt_lmt_biodata_y_maxx values less than (maxvalue) tablespace result2
);