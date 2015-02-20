--liquibase formatted sql

--This is for the wqp_core schema

--changeset drsteini:1EtlHelperAA endDelimiter:/ splitStatements:false
create or replace package etl_helper as

	procedure drop_ri(p_table_suffix in user_tables.table_name%type);
	
	procedure drop_indexes(p_table_name in user_indexes.table_name%type);
	
	procedure create_summaries(p_table_suffix in user_tables.table_name%type);
	
	procedure create_code_tables(p_table_suffix in user_tables.table_name%type);
	
    procedure create_qwportal_summary(p_table_suffix in user_tables.table_name%type);

	procedure create_station_indexes(p_table_suffix in user_tables.table_name%type);

	procedure create_result_indexes(p_table_suffix in user_tables.table_name%type);

	procedure create_station_sum_indexes(p_table_suffix in user_tables.table_name%type);

	procedure create_result_sum_indexes(p_table_suffix in user_tables.table_name%type);

	procedure create_result_ct_sum_indexes(p_table_suffix in user_tables.table_name%type);

	procedure create_result_nr_sum_indexes(p_table_suffix in user_tables.table_name%type);
	
	procedure add_ri(p_table_suffix in user_tables.table_name%type);

end etl_helper;
--rollback drop package etl_helper;

--changeset drsteini:1EtlHelperAB endDelimiter:/ splitStatements:false
create or replace package body etl_helper as

	procedure drop_ri(p_table_suffix in user_tables.table_name%type) is
    begin

		for i in (select table_name, constraint_name
                    from user_constraints
                   where table_name like '%' || dbms_assert.simple_sql_name(upper(p_table_suffix)) and
                         constraint_type = 'R') loop
			dbms_output.put_line('Dropping foreign key constraint: ' || i.constraint_name);
			execute immediate 'alter table ' || i.table_name || ' drop constraint ' || i.constraint_name;
		end loop;

		for i in (select table_name, constraint_name
                    from user_constraints
                   where table_name like '%' || dbms_assert.simple_sql_name(upper(p_table_suffix)) and
                         constraint_type = 'P') loop
			dbms_output.put_line('Dropping primary key constraint: ' || i.constraint_name);
			execute immediate 'alter table ' || i.table_name || ' drop constraint ' || i.constraint_name;
		end loop;

	end drop_ri;

	procedure drop_indexes(p_table_name in user_indexes.table_name%type) is
	begin
		for i in (select index_name
                    from user_indexes
                   where table_name = dbms_assert.sql_object_name(upper(p_table_name)) and
                         index_type != 'LOB') loop
			dbms_output.put_line('Dropping index: ' || i.index_name);
			execute immediate 'drop index ' || i.index_name;
		end loop;
    end drop_indexes;

    procedure create_summaries(p_table_suffix in user_tables.table_name%type) is
        table_name		user_tables.table_name%type;
   	begin

        table_name := dbms_assert.sql_object_name(upper('station_sum_swap_' || p_table_suffix));

        dbms_output.put_line('dropping indexes on:' || table_name);
        etl_helper.drop_indexes(table_name);
        
        dbms_output.put_line('populating:' || table_name);
        execute immediate 'truncate table ' || table_name;

        execute immediate 'insert /*+ append nologging parallel */ into ' || table_name || '
        	(data_source_id, data_source, station_id, site_id, organization, site_type, huc_12, governmental_unit_code,
             geom, pc_result_count, biological_result_count)
        select station.data_source_id,
               station.data_source,
               station.station_id,
               station.site_id,
               station.organization,
               station.site_type,
               station.huc_12,
               station.governmental_unit_code,
               station.geom,
               nvl(pc_result.pc_result_count,0),
               0
          from station_swap_' || p_table_suffix || ' station
               left join (select station_id, count(*) pc_result_count
                            from pc_result_swap_' || p_table_suffix || '
                               group by station_id) pc_result
                 on station.station_id = pc_result.station_id';
        commit;

                    
        table_name := dbms_assert.sql_object_name(upper('pc_result_sum_swap_' || p_table_suffix));

        dbms_output.put_line('dropping indexes on:' || table_name);
        etl_helper.drop_indexes(table_name);
        
        dbms_output.put_line('populating:' || table_name);
        execute immediate 'truncate table ' || table_name;

        execute immediate 'insert /*+ append nologging parallel */ into ' || table_name || '
		  	(data_source_id, data_source, station_id, site_id, event_date, analytical_method, p_code,
             characteristic_name, characteristic_type, sample_media, organization, site_type, huc_12,
             governmental_unit_code, pc_result_count)
        select /*+ full(a) parallel(a, 4) full(b) parallel(b, 4) use_hash(a) use_hash(b) */
               a.data_source_id,
               a.data_source,
               a.station_id,
               a.site_id,
               b.event_date,
               b.analytical_method,
               b.p_code,
               b.characteristic_name,
               b.characteristic_type,
               b.sample_media,
               a.organization,
               a.site_type,
               a.huc_12,
               a.governmental_unit_code,
               b.result_count
          from station_sum_swap_' || p_table_suffix || ' a
               left join (select data_source_id, station_id, sample_media, characteristic_type, characteristic_name, p_code,
                                 event_date, analytical_method,
                                 nvl(count(*), 0) result_count
                            from pc_result_swap_' || p_table_suffix || '
                               group by data_source_id, station_id, sample_media, characteristic_type, characteristic_name, p_code,
                                        event_date, analytical_method
                         ) b
                 on a.station_id = b.station_id and
                    a.data_source_id = b.data_source_id';
        commit;

        table_name := dbms_assert.sql_object_name(upper('pc_result_ct_sum_swap_' || p_table_suffix));

        dbms_output.put_line('dropping indexes on:' || table_name);
        etl_helper.drop_indexes(table_name);
        
        dbms_output.put_line('populating:' || table_name);
        execute immediate 'truncate table ' || table_name;

        execute immediate 'insert /*+ append nologging parallel */ into ' || table_name || '
          	(data_source_id, data_source, station_id, site_id, governmental_unit_code, site_type, organization,
             huc_12, sample_media, characteristic_type, characteristic_name, analytical_method,
             p_code, pc_result_count)
        select /*+ full(b) parallel(b, 4) */
               data_source_id,
               data_source,
               station_id,
               site_id,
               governmental_unit_code,
               site_type,
               organization,
               huc_12,
               sample_media,
               characteristic_type,
               characteristic_name,
               analytical_method,
               p_code,
               sum(pc_result_count) pc_result_count
          from pc_result_sum_swap_' || p_table_suffix || '
             group by data_source_id,
                      data_source,
                      site_id,
                      station_id,
                      governmental_unit_code,
                      site_type,
                      organization,
                      huc_12,
                      sample_media,
                      characteristic_type,
                      characteristic_name,
                      analytical_method,
                      p_code';
        commit;


        table_name := dbms_assert.sql_object_name(upper('pc_result_nr_sum_swap_' || p_table_suffix));

        dbms_output.put_line('dropping indexes on:' || table_name);
        etl_helper.drop_indexes(table_name);
        
        dbms_output.put_line('populating:' || table_name);
        execute immediate 'truncate table ' || table_name;

        execute immediate 'insert /*+ append nologging parallel */ into ' || table_name || '
          	(data_source_id, data_source, station_id, event_date, analytical_method, p_code,
             characteristic_name, characteristic_type, sample_media, pc_result_count)
        select data_source_id, data_source, station_id, event_date, analytical_method, p_code,
               characteristic_name, characteristic_type, sample_media,
               sum(pc_result_count) pc_result_count
          from pc_result_sum_swap_' || p_table_suffix || '
             group by data_source_id, data_source, station_id, event_date, analytical_method, p_code,
                      characteristic_name, characteristic_type, sample_media';
        commit;

    end create_summaries;
    
    procedure create_code_tables(p_table_suffix in user_tables.table_name%type) is
        table_name		user_tables.table_name%type;
    begin

        table_name := dbms_assert.sql_object_name(upper('char_name_swap_' || p_table_suffix));

        dbms_output.put_line('populating:' || table_name);
        execute immediate 'truncate table ' || table_name;

        execute immediate 'insert /*+ append nologging parallel */ into ' || table_name || '
          	(data_source_id, code_value)
        select distinct data_source_id,
                        characteristic_name code_value
          from pc_result_swap_' || p_table_suffix || '
         where characteristic_name is not null';
        commit;
        

        
        table_name := dbms_assert.sql_object_name(upper('char_type_swap_' || p_table_suffix));

        dbms_output.put_line('populating:' || table_name);
        execute immediate 'truncate table ' || table_name;

        execute immediate 'insert /*+ append nologging parallel */ into ' || table_name || '
          	(data_source_id, code_value)
        select distinct data_source_id,
                        characteristic_type code_value
          from pc_result_swap_' || p_table_suffix || '
         where characteristic_type is not null';
        commit;


        
        table_name := dbms_assert.sql_object_name(upper('country_swap_' || p_table_suffix));

        dbms_output.put_line('populating:' || table_name);
        execute immediate 'truncate table ' || table_name;

        execute immediate 'insert /*+ append nologging parallel */ into ' || table_name || '
          	(data_source_id, code_value, description)
        select distinct s.data_source_id,
                        s.country_code code_value,
                        nwis_ws_stg_stage_country.country_nm description
          from station_sum_swap_' || p_table_suffix || ' s
               join nwis_ws_stg_stage_country
                 on s.country_code = trim(nwis_ws_stg_stage_country.country_cd)
         where s.country_code is not null';
        commit;

                  

        table_name := dbms_assert.sql_object_name(upper('county_swap_' || p_table_suffix));

        dbms_output.put_line('populating:' || table_name);
        execute immediate 'truncate table ' || table_name;

        execute immediate 'insert /*+ append nologging parallel */ into ' || table_name || q'!
          	(data_source_id, code_value, description)
        select distinct s.data_source_id,
                        s.county_code code_value,
                        s.country_code || ', ' ||
                            nwis_ws_stg_stage_state.state_nm || ', ' ||
                            nwis_ws_stg_stage_county.county_nm description
          from station_sum_swap_!' || p_table_suffix || q'! s
               left join nwis_ws_stg_stage_state
                 on s.country_code = trim(nwis_ws_stg_stage_state.country_cd) and
                    regexp_substr(s.state_code, '[^:]+', 1, 2) = trim(nwis_ws_stg_stage_state.state_cd)
               left join nwis_ws_stg_stage_county
                 on s.country_code = trim(nwis_ws_stg_stage_county.country_cd) and
                    regexp_substr(s.state_code, '[^:]+', 1, 2) = trim(nwis_ws_stg_stage_county.state_cd) and
                    regexp_substr(s.county_code, '[^:]+', 1, 3) = trim(nwis_ws_stg_stage_county.county_cd)
         where s.county_code is not null!';
        commit;
        
        

        table_name := dbms_assert.sql_object_name(upper('organization_swap_' || p_table_suffix));

        dbms_output.put_line('populating:' || table_name);
        execute immediate 'truncate table ' || table_name;

        execute immediate 'insert /*+ append nologging parallel */ into ' || table_name || '
          	(data_source_id, code_value, description)
        select distinct s.data_source_id,
                        s.organization code_value,
                        s.organization_name description
          from station_swap_' || p_table_suffix || ' s
         where s.organization is not null';
           commit;
          
           

        table_name := dbms_assert.sql_object_name(upper('sample_media_swap_' || p_table_suffix));

        dbms_output.put_line('populating:' || table_name);
        execute immediate 'truncate table ' || table_name;

        execute immediate 'insert /*+ append nologging parallel */ into ' || table_name || '
          	(data_source_id, code_value)
        select distinct data_source_id,
                        sample_media code_value
          from pc_result_swap_' || p_table_suffix || '
         where sample_media is not null';
        commit;
      
      

        table_name := dbms_assert.sql_object_name(upper('site_type_swap_' || p_table_suffix));

        dbms_output.put_line('populating:' || table_name);
        execute immediate 'truncate table ' || table_name;

        execute immediate 'insert /*+ append nologging parallel */ into ' || table_name || '
          	(data_source_id, code_value)
        select distinct s.data_source_id,
                        s.site_type code_value
          from station_sum_swap_' || p_table_suffix || ' s
         where s.site_type is not null';
		commit;
           
           

        table_name := dbms_assert.sql_object_name(upper('state_swap_' || p_table_suffix));

        dbms_output.put_line('populating:' || table_name);
        execute immediate 'truncate table ' || table_name;

        execute immediate 'insert /*+ append nologging parallel */ into ' || table_name || q'!
          	(data_source_id, code_value, description_with_country, description_with_out_country)
        select distinct s.data_source_id,
                        s.state_code code_value,
                        s.country_code || ', ' ||
                        nwis_ws_stg_stage_state.state_nm description_with_country,
                        nwis_ws_stg_stage_state.state_nm description_with_out_country
          from station_sum_swap_!' || p_table_suffix || q'! s
               left join nwis_ws_stg_stage_state
                 on s.country_code = trim(nwis_ws_stg_stage_state.country_cd) and
                    regexp_substr(s.state_code, '[^:]+', 1, 2) = trim(nwis_ws_stg_stage_state.state_cd)
         where s.state_code is not null!';
        commit;

    end create_code_tables;
    
    procedure create_qwportal_summary(p_table_suffix in user_tables.table_name%type) is
        table_name		user_tables.table_name%type;
    begin

        table_name := dbms_assert.sql_object_name(upper('qwportal_summary_swap_' || p_table_suffix));

        dbms_output.put_line('populating:' || table_name);
        execute immediate 'truncate table ' || table_name;

        execute immediate 'insert /*+ append nologging parallel */ into ' || table_name || q'!
			(data_source_id, fips_state_and_county, site_type, huc, min_date, max_date, samples_past_12_months, samples_past_60_months,
             samples_all_time, results_past_12_months, results_past_60_months, results_all_time)
        select data_source_id,
               regexp_substr(state_code, '[^:]+', 1, 2) || regexp_substr(county_code, '[^:]+', 1, 3) fips_state_and_county,
               site_type,
               huc_12,
               min(case when event_date between to_date('01-JAN-1875', 'DD-MON-YYYY') and to_date('19-FEB-2015', 'DD-MON-YYYY') then event_date else null end) min_date,
               max(case when event_date between to_date('01-JAN-1875', 'DD-MON-YYYY') and to_date('19-FEB-2015', 'DD-MON-YYYY') then event_date else null end) max_date,
               count(distinct case when months_between(to_date('19-FEB-2015', 'DD-MON-YYYY'), event_date) between 0 and 12 then activity else null end) samples_past_12_months,
               count(distinct case when months_between(to_date('19-FEB-2015', 'DD-MON-YYYY'), event_date) between 0 and 60 then activity else null end) samples_past_60_months,
               count(distinct activity) samples_all_time,
               sum(case when months_between(to_date('19-FEB-2015', 'DD-MON-YYYY'), event_date) between 0 and 12 then 1 else 0 end) results_past_12_months,
               sum(case when months_between(to_date('19-FEB-2015', 'DD-MON-YYYY'), event_date) between 0 and 60 then 1 else 0 end) results_past_60_months,
               count(*) results_all_time
          from pc_result_swap_!' || p_table_suffix || q'!
         where state_code between 'US:01' and 'US:56' and
              length(state_code) = 5
            group by data_source_id, regexp_substr(state_code, '[^:]+', 1, 2)||regexp_substr(county_code, '[^:]+', 1, 3), site_type, huc_12!';
            
		commit;

 	end create_qwportal_summary;

    procedure create_station_indexes(p_table_suffix in user_tables.table_name%type) is
        stmt            varchar2(32000);
        table_name		user_tables.table_name%type;
   	begin

	   	dbms_output.put_line('creating station indexes...');
        table_name := dbms_assert.sql_object_name(upper('station_swap_' || p_table_suffix));
        
        stmt := 'create bitmap index s_' || p_table_suffix || '_country on ' || table_name || '(country_code) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index s_' || p_table_suffix || '_county on ' || table_name || '(county_code) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create index s_' || p_table_suffix || '_geom on ' || table_name || q'!(geom) indextype is mdsys.spatial_index parameters ('SDO_INDX_DIMS=2 LAYER_GTYPE="POINT"')!';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index s_' || p_table_suffix || '_huc10 on ' || table_name || '(huc_10) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index s_' || p_table_suffix || '_huc12 on ' || table_name || '(huc_12) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index s_' || p_table_suffix || '_huc2 on ' || table_name || '(huc_2) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index s_' || p_table_suffix || '_huc4 on ' || table_name || '(huc_4) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index s_' || p_table_suffix || '_huc6 on ' || table_name || '(huc_6) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index s_' || p_table_suffix || '_huc8 on ' || table_name || '(huc_8) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index s_' || p_table_suffix || '_organization on ' || table_name || '(organization) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create unique index s_pk_' || p_table_suffix || ' on ' || table_name || '(data_source_id, station_id) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;
        	
        stmt := 'create bitmap index s_' || p_table_suffix || '_site on ' || table_name || '(site_id) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index s_' || p_table_suffix || '_site_type on ' || table_name || '(site_type) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index s_' || p_table_suffix || '_state on ' || table_name || '(state_code) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index s_' || p_table_suffix || '_station on ' || table_name || '(station_id) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

	end create_station_indexes;

	procedure create_result_indexes(p_table_suffix in user_tables.table_name%type) is
        stmt            varchar2(32000);
        table_name		user_tables.table_name%type;
   	begin
	
        dbms_output.put_line('creating result indexes...');
        table_name := dbms_assert.sql_object_name(upper('pc_result_swap_' || p_table_suffix));
        
        stmt := 'create bitmap index pcr_' || p_table_suffix || '_activity on ' || table_name || '(activity) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index pcr_' || p_table_suffix || '_analytical on ' || table_name || '(analytical_method) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index pcr_' || p_table_suffix || '_char_name on ' || table_name || '(characteristic_name) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index pcr_' || p_table_suffix || '_char_type on ' || table_name || '(characteristic_type) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index pcr_' || p_table_suffix || '_country on ' || table_name || '(country_code) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index pcr_' || p_table_suffix || '_county on ' || table_name || '(county_code) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index pcr_' || p_table_suffix || '_event_date on ' || table_name || '(event_date) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index pcr_' || p_table_suffix || '_huc10 on ' || table_name || '(huc_10) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index pcr_' || p_table_suffix || '_huc12 on ' || table_name || '(huc_12) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index pcr_' || p_table_suffix || '_huc2 on ' || table_name || '(huc_2) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index pcr_' || p_table_suffix || '_huc4 on ' || table_name || '(huc_4) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index pcr_' || p_table_suffix || '_huc6 on ' || table_name || '(huc_6) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index pcr_' || p_table_suffix || '_huc8 on ' || table_name || '(huc_8) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index pcr_' || p_table_suffix || '_organization on ' || table_name || '(organization) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index pcr_' || p_table_suffix || '_p_code on ' || table_name || '(p_code) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index pcr_' || p_table_suffix || '_sample_media on ' || table_name || '(sample_media) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index pcr_' || p_table_suffix || '_site on ' || table_name || '(site_id) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index pcr_' || p_table_suffix || '_site_type on ' || table_name || '(site_type) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index pcr_' || p_table_suffix || '_state on ' || table_name || '(state_code) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index pcr_' || p_table_suffix || '_station on ' || table_name || '(station_id) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;
        
	end create_result_indexes;

	procedure create_station_sum_indexes(p_table_suffix in user_tables.table_name%type) is
        stmt            varchar2(32000);
        table_name		user_tables.table_name%type;
   	begin

	   	dbms_output.put_line('creating station_sum indexes...');
        table_name := dbms_assert.sql_object_name(upper('station_sum_swap_' || p_table_suffix));

        stmt := 'create bitmap index ss_' || p_table_suffix || '_county on ' || table_name || '(county_code) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create index ss_' || p_table_suffix || '_geom on ' || table_name || q'!(geom) indextype is mdsys.spatial_index parameters ('SDO_INDX_DIMS=2 LAYER_GTYPE="POINT"')!';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index ss_' || p_table_suffix || '_huc10 on ' || table_name || '(huc_10) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index ss_' || p_table_suffix || '_huc12 on ' || table_name || '(huc_12) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index ss_' || p_table_suffix || '_huc2 on ' || table_name || '(huc_2) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index ss_' || p_table_suffix || '_huc4 on ' || table_name || '(huc_4) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index ss_' || p_table_suffix || '_huc6 on ' || table_name || '(huc_6) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index ss_' || p_table_suffix || '_huc8 on ' || table_name || '(huc_8) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index ss_' || p_table_suffix || '_organization on ' || table_name || '(organization) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create unique index ss_pk_' || p_table_suffix || ' on ' || table_name || '(data_source_id, station_id) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;
        	
        stmt := 'create bitmap index ss_' || p_table_suffix || '_site on ' || table_name || '(site_id) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index ss_' || p_table_suffix || '_site_type on ' || table_name || '(site_type) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index ss_' || p_table_suffix || '_state on ' || table_name || '(state_code) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index ss_' || p_table_suffix || '_station on ' || table_name || '(station_id) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;
        	
	end create_station_sum_indexes;

	procedure create_result_sum_indexes(p_table_suffix in user_tables.table_name%type) is
        stmt            varchar2(32000);
        table_name		user_tables.table_name%type;
   	begin

	   	dbms_output.put_line('creating result_sum indexes...');
        table_name := dbms_assert.sql_object_name(upper('pc_result_sum_swap_' || p_table_suffix));

        stmt := 'create bitmap index pcrs_' || p_table_suffix || '_analytical on ' || table_name || '(analytical_method) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index pcrs_' || p_table_suffix || '_char_name on ' || table_name || '(characteristic_name) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index pcrs_' || p_table_suffix || '_char_type on ' || table_name || '(characteristic_type) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index pcrs_' || p_table_suffix || '_country on ' || table_name || '(country_code) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index pcrs_' || p_table_suffix || '_county on ' || table_name || '(county_code) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index pcrs_' || p_table_suffix || '_event_date on ' || table_name || '(event_date) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index pcrs_' || p_table_suffix || '_huc10 on ' || table_name || '(huc_10) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index pcrs_' || p_table_suffix || '_huc12 on ' || table_name || '(huc_12) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index pcrs_' || p_table_suffix || '_huc2 on ' || table_name || '(huc_2) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index pcrs_' || p_table_suffix || '_huc4 on ' || table_name || '(huc_4) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index pcrs_' || p_table_suffix || '_huc6 on ' || table_name || '(huc_6) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index pcrs_' || p_table_suffix || '_huc8 on ' || table_name || '(huc_8) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index pcrs_' || p_table_suffix || '_organization on ' || table_name || '(organization) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index pcrs_' || p_table_suffix || '_p_code on ' || table_name || '(p_code) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index pcrs_' || p_table_suffix || '_sample_media on ' || table_name || '(sample_media) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index pcrs_' || p_table_suffix || '_site on ' || table_name || '(site_id) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index pcrs_' || p_table_suffix || '_site_type on ' || table_name || '(site_type) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index pcrs_' || p_table_suffix || '_state on ' || table_name || '(state_code) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index pcrs_' || p_table_suffix || '_station on ' || table_name || '(station_id) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;
	
	end create_result_sum_indexes;

	procedure create_result_ct_sum_indexes(p_table_suffix in user_tables.table_name%type) is
        stmt            varchar2(32000);
        table_name		user_tables.table_name%type;
   	begin
	
        dbms_output.put_line('creating result_ct_sum indexes...');
        table_name := dbms_assert.sql_object_name(upper('pc_result_ct_sum_swap_' || p_table_suffix));

        stmt := 'create bitmap index pcrcts_' || p_table_suffix || '_analytical on ' || table_name || '(analytical_method) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index pcrcts_' || p_table_suffix || '_char_name on ' || table_name || '(characteristic_name) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index pcrcts_' || p_table_suffix || '_char_type on ' || table_name || '(characteristic_type) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index pcrcts_' || p_table_suffix || '_country on ' || table_name || '(country_code) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index pcrcts_' || p_table_suffix || '_county on ' || table_name || '(county_code) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index pcrcts_' || p_table_suffix || '_huc10 on ' || table_name || '(huc_10) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index pcrcts_' || p_table_suffix || '_huc12 on ' || table_name || '(huc_12) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index pcrcts_' || p_table_suffix || '_huc2 on ' || table_name || '(huc_2) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index pcrcts_' || p_table_suffix || '_huc4 on ' || table_name || '(huc_4) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index pcrcts_' || p_table_suffix || '_huc6 on ' || table_name || '(huc_6) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index pcrcts_' || p_table_suffix || '_huc8 on ' || table_name || '(huc_8) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index pcrcts_' || p_table_suffix || '_organization on ' || table_name || '(organization) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index pcrcts_' || p_table_suffix || '_p_code on ' || table_name || '(p_code) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index pcrcts_' || p_table_suffix || '_sample_media on ' || table_name || '(sample_media) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index pcrcts_' || p_table_suffix || '_site on ' || table_name || '(site_id) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index pcrcts_' || p_table_suffix || '_site_type on ' || table_name || '(site_type) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index pcrcts_' || p_table_suffix || '_state on ' || table_name || '(state_code) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index pcrcts_' || p_table_suffix || '_station on ' || table_name || '(station_id) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

    end create_result_ct_sum_indexes;

	procedure create_result_nr_sum_indexes(p_table_suffix in user_tables.table_name%type) is
        stmt            varchar2(32000);
        table_name		user_tables.table_name%type;
   	begin
	
        table_name := dbms_assert.sql_object_name(upper('pc_result_nr_sum_swap_' || p_table_suffix));
        dbms_output.put_line('creating result_nr_sum indexes...');

        stmt := 'create bitmap index pcrnrs_' || p_table_suffix || '_analytical on ' || table_name || '(analytical_method) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index pcrnrs_' || p_table_suffix || '_char_name on ' || table_name || '(characteristic_name) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index pcrnrs_' || p_table_suffix || '_char_type on ' || table_name || '(characteristic_type) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index pcrnrs_' || p_table_suffix || '_p_code on ' || table_name || '(p_code) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index pcrnrs_' || p_table_suffix || '_sample_media on ' || table_name || '(sample_media) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index pcrnrs_' || p_table_suffix || '_station on ' || table_name || '(station_id) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;
        
	end create_result_nr_sum_indexes;

	procedure add_ri(p_table_suffix in user_tables.table_name%type) is
        stmt            varchar2(32000);
        suffix			user_tables.table_name%type;
    begin

	    suffix := dbms_assert.simple_sql_name(p_table_suffix);
	    
		stmt := 'alter table station_swap_' || suffix || ' add constraint station_pk_' || suffix || 
                ' primary key (data_source_id, station_id) rely enable novalidate';
        dbms_output.put_line(stmt);
        execute immediate stmt;

		stmt := 'alter table station_sum_swap_' || suffix || ' add constraint station_sum_pk_' || suffix ||
                ' primary key (data_source_id, station_id) rely enable novalidate';
        dbms_output.put_line(stmt);
        execute immediate stmt;   

		stmt := 'alter table pc_result_swap_' || suffix || ' add constraint pcr_station_fk_' || suffix ||
                ' foreign key (data_source_id, station_id) references station_swap_' || suffix ||
                ' (data_source_id, station_id) rely enable novalidate';
        dbms_output.put_line(stmt);
        execute immediate stmt;
       
		stmt := 'alter table pc_result_sum_swap_' || suffix || ' add constraint pcrs_station_fk' || suffix ||
                ' foreign key (data_source_id, station_id) references station_sum_swap_' || suffix ||
                ' (data_source_id, station_id) rely enable novalidate';
        dbms_output.put_line(stmt);
        execute immediate stmt;
       
		stmt := 'alter table pc_result_ct_sum_swap_' || suffix || ' add constraint pcrcts_station_fk' || suffix ||
                ' foreign key (data_source_id, station_id) references station_sum_swap_' || suffix ||
                ' (data_source_id, station_id) rely enable novalidate';
        dbms_output.put_line(stmt);
        execute immediate stmt;
       
		stmt := 'alter table pc_result_nr_sum_swap_' || suffix || ' add constraint pcrnrs_station_fk' || suffix ||
                ' foreign key (data_source_id, station_id) references station_sum_swap_' || suffix ||
                ' (data_source_id, station_id) rely enable novalidate';
        dbms_output.put_line(stmt);
        execute immediate stmt;
        
	end add_ri;

end etl_helper;
--rollback drop package body etl_helper;
