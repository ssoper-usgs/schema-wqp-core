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
	
	procedure analyze_tables(p_table_suffix in user_tables.table_name%type);
	
	procedure validate(p_data_source_id in data_source.data_source_id%type);
	
	procedure install(p_table_suffix in user_tables.table_name%type);
	
	procedure update_last_etl(p_data_source_id in last_etl.data_source_id%type);

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

        execute immediate 'insert /*+ append parallel(4) */ into ' || table_name || '
        	(data_source_id, data_source, station_id, site_id, organization, site_type, huc, governmental_unit_code,
             geom, result_count)
        select station.data_source_id,
               station.data_source,
               station.station_id,
               station.site_id,
               station.organization,
               station.site_type,
               station.huc,
               station.governmental_unit_code,
               station.geom,
               nvl(result.result_count,0) result_count
          from station_swap_' || p_table_suffix || ' station
               left join (select station_id, count(*) result_count
                            from pc_result_swap_' || p_table_suffix || '
                               group by station_id) result
                 on station.station_id = pc_result.station_id
            order by organization';
        commit;

                    
        table_name := dbms_assert.sql_object_name(upper('pc_result_sum_swap_' || p_table_suffix));

        dbms_output.put_line('dropping indexes on:' || table_name);
        etl_helper.drop_indexes(table_name);
        
        dbms_output.put_line('populating:' || table_name);
        execute immediate 'truncate table ' || table_name;

        execute immediate 'insert /*+ append parallel(4) */ into ' || table_name || '
		  	(data_source_id, data_source, station_id, site_id, event_date, analytical_method, p_code,
             characteristic_name, characteristic_type, sample_media, organization, site_type, huc,
             governmental_unit_code, project_id, result_count)
        select /*+ full(station) parallel(station, 4) full(result) parallel(b, result) use_hash(station) use_hash(result) */
               station.data_source_id,
               station.data_source,
               station.station_id,
               station.site_id,
               result.event_date,
               result.analytical_method,
               result.p_code,
               result.characteristic_name,
               result.characteristic_type,
               result.sample_media,
               station.organization,
               station.site_type,
               station.huc,
               station.governmental_unit_code,
               result.project_id,
               nvl(result.result_count, 0) result_count
          from station_sum_swap_' || p_table_suffix || ' station
               left join (select data_source_id, station_id, sample_media, characteristic_type, characteristic_name, p_code,
                                 event_date, analytical_method, project_id,
                                 count(*) result_count
                            from pc_result_swap_' || p_table_suffix || '
                               group by data_source_id, station_id, sample_media, characteristic_type, characteristic_name, p_code,
                                        event_date, analytical_method, project_id
                          ) result
                 on station.station_id = result.station_id and
                    station.data_source_id = result.data_source_id
             order by station.station_id';
        commit;

        table_name := dbms_assert.sql_object_name(upper('pc_result_ct_sum_swap_' || p_table_suffix));

        dbms_output.put_line('dropping indexes on:' || table_name);
        etl_helper.drop_indexes(table_name);
        
        dbms_output.put_line('populating:' || table_name);
        execute immediate 'truncate table ' || table_name;

        execute immediate 'insert /*+ append parallel(4) */ into ' || table_name || '
          	(data_source_id, data_source, station_id, site_id, governmental_unit_code, site_type, organization,
             huc, sample_media, characteristic_type, characteristic_name, analytical_method,
             p_code, project_id, result_count)
        select data_source_id,
               data_source,
               station_id,
               site_id,
               governmental_unit_code,
               site_type,
               organization,
               huc,
               sample_media,
               characteristic_type,
               characteristic_name,
               analytical_method,
               p_code,
               project_id,
               sum(result_count) result_count
          from pc_result_sum_swap_' || p_table_suffix || '
             group by data_source_id,
                      data_source,
                      site_id,
                      station_id,
                      governmental_unit_code,
                      site_type,
                      organization,
                      huc,
                      sample_media,
                      characteristic_type,
                      characteristic_name,
                      analytical_method,
                      p_code,
                      project_id
             order by characteristic_name';
        commit;


        table_name := dbms_assert.sql_object_name(upper('pc_result_nr_sum_swap_' || p_table_suffix));

        dbms_output.put_line('dropping indexes on:' || table_name);
        etl_helper.drop_indexes(table_name);
        
        dbms_output.put_line('populating:' || table_name);
        execute immediate 'truncate table ' || table_name;

        execute immediate 'insert /*+ append parallel(4) */ into ' || table_name || '
          	(data_source_id, data_source, station_id, event_date, analytical_method, p_code,
             characteristic_name, characteristic_type, sample_media, project_id, result_count)
        select data_source_id, data_source, station_id, event_date, analytical_method, p_code,
               characteristic_name, characteristic_type, sample_media, project_id,
               sum(result_count) result_count
          from pc_result_sum_swap_' || p_table_suffix || '
             group by data_source_id, data_source, station_id, event_date, analytical_method, p_code,
                      characteristic_name, characteristic_type, sample_media, project_id
             order by characteristic_name';
        commit;

    end create_summaries;
    
    procedure create_code_tables(p_table_suffix in user_tables.table_name%type) is
        table_name		user_tables.table_name%type;
        sql_stmnt		varchar2(4000 char);
    begin

        table_name := dbms_assert.sql_object_name(upper('char_name_swap_' || p_table_suffix));
        
        dbms_output.put_line('populating:' || table_name);
        execute immediate 'truncate table ' || table_name;

        execute immediate 'insert /*+ append parallel(4) */ into ' || table_name || '
          	(data_source_id, code_value)
        select distinct data_source_id,
                        characteristic_name code_value
          from pc_result_swap_' || p_table_suffix || '
         where characteristic_name is not null';
        commit;
        

        
        table_name := dbms_assert.sql_object_name(upper('char_type_swap_' || p_table_suffix));

        dbms_output.put_line('populating:' || table_name);
        execute immediate 'truncate table ' || table_name;

        execute immediate 'insert /*+ append parallel(4) */ into ' || table_name || '
          	(data_source_id, code_value)
        select distinct data_source_id,
                        characteristic_type code_value
          from pc_result_swap_' || p_table_suffix || '
         where characteristic_type is not null';
        commit;


        
        table_name := dbms_assert.sql_object_name(upper('country_swap_' || p_table_suffix));

        dbms_output.put_line('populating:' || table_name);
        execute immediate 'truncate table ' || table_name;

        
        if upper(p_table_suffix) = 'NWIS' or
           upper(p_table_suffix) = 'STEWARDS' then
          sql_stmnt := 'insert /*+ append parallel(4) */ into ' || table_name || ' (data_source_id, code_value, description)
                        select distinct s.data_source_id,
                                        s.country_code code_value,
                                        country.country_nm description
                                   from station_sum_swap_' || p_table_suffix || ' s
                                        join nwis_ws_star.country
                                          on s.country_code = country.country_cd 
                                  where s.country_code is not null';
        else
          sql_stmnt := 'insert /*+ append parallel(4) */ into ' || table_name || ' (data_source_id, code_value, description)
                        select distinct s.data_source_id,
                                        s.country_code code_value,
                                        nvl(nwis_country.country_nm, upper(country.cntry_name)) description
                                   from station_sum_swap_' || p_table_suffix || ' s
                                        left join nwis_ws_star.country nwis_country
                                          on s.country_code = nwis_country.country_cd 
                                        join wqx.country
                                          on s.country_code = country.cntry_cd 
                                  where s.country_code is not null';
        end if;

        execute immediate sql_stmnt;
        commit;

                  

        table_name := dbms_assert.sql_object_name(upper('county_swap_' || p_table_suffix));

        dbms_output.put_line('populating:' || table_name);
        execute immediate 'truncate table ' || table_name;

        if upper(p_table_suffix) = 'NWIS' or
           upper(p_table_suffix) = 'STEWARDS' then
          sql_stmnt := 'insert /*+ append parallel(4) */ into ' || table_name || q'! (data_source_id, code_value, description)
                        select distinct s.data_source_id,
                                        s.county_code code_value,
                                        s.country_code || ', ' || state.state_nm || ', ' || county.county_nm description
                          from station_sum_swap_!' || p_table_suffix || q'! s
                               left join nwis_ws_star.state
                                 on s.country_code = state.country_cd and
                                    regexp_substr(s.state_code, '[^:]+', 1, 2) = state.state_cd
                               left join nwis_ws_star.county
                                 on s.country_code = county.country_cd and
                                    regexp_substr(s.state_code, '[^:]+', 1, 2) = county.state_cd and
                                    regexp_substr(s.county_code, '[^:]+', 1, 3) = county.county_cd
                         where s.county_code is not null!';
        else
          sql_stmnt := 'insert /*+ append parallel(4) */ into ' || table_name || q'! (data_source_id, code_value, description)
                        select distinct s.data_source_id,
                                        s.county_code code_value,
                                        s.country_code || ', ' || state.st_name || ', ' || county.cnty_name description
                          from station_sum_swap_!' || p_table_suffix || q'! s
                               join wqx.country
                                 on s.country_code = country.cntry_cd 
                               left join wqx.state
                                 on country.cntry_uid = state.cntry_uid and
                                    regexp_substr(s.state_code, '[^:]+', 1, 2) = state.st_fips_cd
                               left join wqx.county
                                 on state.st_uid = county.st_uid and
                                    regexp_substr(s.county_code, '[^:]+', 1, 3) = county.cnty_fips_cd
                         where s.county_code is not null!';
        end if;

        execute immediate sql_stmnt;
        commit;
        
        

        table_name := dbms_assert.sql_object_name(upper('organization_swap_' || p_table_suffix));

        dbms_output.put_line('populating:' || table_name);
        execute immediate 'truncate table ' || table_name;

        execute immediate 'insert /*+ append parallel(4) */ into ' || table_name || '
          	(data_source_id, code_value, description)
        select distinct s.data_source_id,
                        s.organization code_value,
                        s.organization_name description
          from station_swap_' || p_table_suffix || ' s
         where s.organization is not null';
           commit;
          
           

        table_name := dbms_assert.sql_object_name(upper('project_swap_' || p_table_suffix));

        dbms_output.put_line('populating:' || table_name);
        execute immediate 'truncate table ' || table_name;

        execute immediate 'insert /*+ append parallel(4) */ into ' || table_name || '
          	(data_source_id, code_value)
        select distinct data_source_id,
                        project_id code_value
          from pc_result_swap_' || p_table_suffix || '
         where project_id is not null';
        commit;
        

        
        table_name := dbms_assert.sql_object_name(upper('sample_media_swap_' || p_table_suffix));

        dbms_output.put_line('populating:' || table_name);
        execute immediate 'truncate table ' || table_name;

        execute immediate 'insert /*+ append parallel(4) */ into ' || table_name || '
          	(data_source_id, code_value)
        select distinct data_source_id,
                        sample_media code_value
          from pc_result_swap_' || p_table_suffix || '
         where sample_media is not null';
        commit;
      
      

        table_name := dbms_assert.sql_object_name(upper('site_type_swap_' || p_table_suffix));

        dbms_output.put_line('populating:' || table_name);
        execute immediate 'truncate table ' || table_name;

        execute immediate 'insert /*+ append parallel(4) */ into ' || table_name || '
          	(data_source_id, code_value)
        select distinct s.data_source_id,
                        s.site_type code_value
          from station_sum_swap_' || p_table_suffix || ' s
         where s.site_type is not null';
		commit;
           
           

        table_name := dbms_assert.sql_object_name(upper('state_swap_' || p_table_suffix));

        dbms_output.put_line('populating:' || table_name);
        execute immediate 'truncate table ' || table_name;

        if upper(p_table_suffix) = 'NWIS' or
           upper(p_table_suffix) = 'STEWARDS' then
          sql_stmnt := 'insert /*+ append parallel(4) */ into ' || table_name || q'! (data_source_id, code_value, description_with_country, description_with_out_country)
                        select distinct s.data_source_id,
                                        s.state_code code_value,
                                        s.country_code || ', ' || state.state_nm description_with_country,
                                        state.state_nm description_with_out_country
                          from station_sum_swap_!' || p_table_suffix || q'! s
                               left join nwis_ws_star.state
                                 on s.country_code = trim(state.country_cd) and
                                    regexp_substr(s.state_code, '[^:]+', 1, 2) = trim(state.state_cd)
                         where s.state_code is not null!';
        else
          sql_stmnt := 'insert /*+ append parallel(4) */ into ' || table_name || q'! (data_source_id, code_value, description_with_country, description_with_out_country)
                        select distinct s.data_source_id,
                                        s.state_code code_value,
                                        s.country_code || ', ' || state.st_name description_with_country,
                                        state.st_name description_with_out_country
                          from station_sum_swap_!' || p_table_suffix || q'! s
                               join wqx.country
                                 on s.country_code = country.cntry_cd 
                               left join wqx.state
                                 on country.cntry_uid = state.cntry_uid and
                                    regexp_substr(s.state_code, '[^:]+', 1, 2) = state.st_fips_cd
                         where s.state_code is not null!';
        end if;

        execute immediate sql_stmnt;
        commit;

    end create_code_tables;
    
    procedure create_qwportal_summary(p_table_suffix in user_tables.table_name%type) is
        table_name		user_tables.table_name%type;
    begin

        table_name := dbms_assert.sql_object_name(upper('qwportal_summary_swap_' || p_table_suffix));

        dbms_output.put_line('populating:' || table_name);
        execute immediate 'truncate table ' || table_name;

        execute immediate 'insert /*+ append parallel(4) */ into ' || table_name || q'!
			   (data_source_id, fips_state_code, fips_county_code, fips_state_and_county, huc8, min_date, max_date,
                samples_past_12_months, samples_past_60_months, samples_all_time)
        select data_source_id,
               regexp_substr(state_code, '[^:]+', 1, 2) state_fips_code,
               regexp_substr(county_code, '[^:]+', 1, 3) county_fips_code,
               regexp_substr(state_code, '[^:]+', 1, 2)||regexp_substr(county_code, '[^:]+', 1, 3) fips_state_and_county,
               huc_8,
               min(case when event_date between to_date('01-JAN-1875', 'DD-MON-YYYY') and to_date('19-FEB-2015', 'DD-MON-YYYY') then event_date else null end) min_date,
               max(case when event_date between to_date('01-JAN-1875', 'DD-MON-YYYY') and to_date('19-FEB-2015', 'DD-MON-YYYY') then event_date else null end) max_date,
               count(distinct case when months_between(to_date('19-FEB-2015', 'DD-MON-YYYY'), event_date) between 0 and 12 then activity else null end) samples_past_12_months,
               count(distinct case when months_between(to_date('19-FEB-2015', 'DD-MON-YYYY'), event_date) between 0 and 60 then activity else null end) samples_past_60_months,
               count(distinct activity) samples_all_time
          from pc_result_swap_!' || p_table_suffix || q'!
         where state_code between 'US:01' and 'US:56'
            group by data_source_id, regexp_substr(state_code, '[^:]+', 1, 2), regexp_substr(county_code, '[^:]+', 1, 3), huc_8!';
            
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
        
        stmt := 'create bitmap index pcr_' || p_table_suffix || '_project on ' || table_name || '(project_id) local parallel 4 nologging';
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

        stmt := 'create bitmap index pcrs_' || p_table_suffix || '_project on ' || table_name || '(project_id) local parallel 4 nologging';
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

        stmt := 'create bitmap index pcrcts_' || p_table_suffix || '_project on ' || table_name || '(project_id) local parallel 4 nologging';
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

        stmt := 'create bitmap index pcrnrs_' || p_table_suffix || '_project on ' || table_name || '(project_id) local parallel 4 nologging';
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

	procedure analyze_tables(p_table_suffix in user_tables.table_name%type) is
        suffix user_tables.table_name%type;
    begin

	    suffix := dbms_assert.simple_sql_name(upper(p_table_suffix));
		
	    dbms_output.put_line('analyze characteristic_name...');
	    dbms_stats.gather_table_stats(ownname => 'WQP_CORE', tabname => 'CHAR_NAME_SWAP_' || suffix);
	    
	    dbms_output.put_line('analyze characteristic_type...');
	    dbms_stats.gather_table_stats(ownname => 'WQP_CORE', tabname => 'CHAR_TYPE_SWAP_' || suffix);
	    
	    dbms_output.put_line('analyze country...');
	    dbms_stats.gather_table_stats(ownname => 'WQP_CORE', tabname => 'COUNTRY_SWAP_' || suffix);
	    
	    dbms_output.put_line('analyze county...');
	    dbms_stats.gather_table_stats(ownname => 'WQP_CORE', tabname => 'COUNTY_SWAP_' || suffix);
	    
	    dbms_output.put_line('analyze organization...');
	    dbms_stats.gather_table_stats(ownname => 'WQP_CORE', tabname => 'ORGANIZATION_SWAP_' || suffix);
	    
	    dbms_output.put_line('analyze pc_result...');
	    dbms_stats.gather_table_stats(ownname => 'WQP_CORE', tabname => 'PC_RESULT_SWAP_' || suffix);
	    
	    dbms_output.put_line('analyze pc_result_ct_sum...');
	    dbms_stats.gather_table_stats(ownname => 'WQP_CORE', tabname => 'PC_RESULT_CT_SUM_SWAP_' || suffix);
	    
	    dbms_output.put_line('analyze pc_result_nr_sum...');
	    dbms_stats.gather_table_stats(ownname => 'WQP_CORE', tabname => 'PC_RESULT_NR_SUM_SWAP_' || suffix);
	    
	    dbms_output.put_line('analyze pc_result_sum...');
	    dbms_stats.gather_table_stats(ownname => 'WQP_CORE', tabname => 'PC_RESULT_SUM_SWAP_' || suffix);
	    
	    dbms_output.put_line('analyze project...');
	    dbms_stats.gather_table_stats(ownname => 'WQP_CORE', tabname => 'PROJECT_SWAP_' || suffix);
	    
	    if (suffix = 'STORET' or suffix = 'NWIS') then
		    dbms_output.put_line('analyze qwportal_summary...');
		    dbms_stats.gather_table_stats(ownname => 'WQP_CORE', tabname => 'QWPORTAL_SUMMARY_SWAP_' || suffix);
		end if;

	    dbms_output.put_line('analyze sample_media...');
	    dbms_stats.gather_table_stats(ownname => 'WQP_CORE', tabname => 'SAMPLE_MEDIA_SWAP_' || suffix);
	    
	    dbms_output.put_line('analyze site_type...');
	    dbms_stats.gather_table_stats(ownname => 'WQP_CORE', tabname => 'SITE_TYPE_SWAP_' || suffix);
	    
	    dbms_output.put_line('analyze state...');
	    dbms_stats.gather_table_stats(ownname => 'WQP_CORE', tabname => 'STATE_SWAP_' || suffix);
		
	    dbms_output.put_line('analyze station...');
	    dbms_stats.gather_table_stats(ownname => 'WQP_CORE', tabname => 'STATION_SWAP_' || suffix);
	
	    dbms_output.put_line('analyze station_sum...');
	    dbms_stats.gather_table_stats(ownname => 'WQP_CORE', tabname => 'STATION_SUM_SWAP_' || suffix);
	    
	end analyze_tables;

	procedure validate(p_data_source_id in data_source.data_source_id%type) is
        min_rows	etl_threshold.min_rows%type;
        max_diff	etl_threshold.max_diff%type;
        suffix		data_source.text%type;
 		old_rows    int;
        new_rows    int;
        pass_fail   varchar2(15);
        end_job     boolean := false;
    begin

		dbms_output.put_line('validating...');
	
	    select dbms_assert.simple_sql_name(upper(text))
	      into suffix
	      from data_source
	     where data_source_id = p_data_source_id;
		
		dbms_output.put_line('... pc_result');
		select min_rows, max_diff
		  into min_rows, max_diff
		 from etl_threshold
		where data_source_id = p_data_source_id and
		      table_name = 'PC_RESULT';
		execute immediate 'select count(*) from pc_result partition (pc_result_' || suffix || ')' into old_rows;
		execute immediate 'select count(*) from pc_result_swap_' || suffix into new_rows;
		if new_rows > min_rows and new_rows > old_rows - max_diff then
	    	pass_fail := 'PASS';
	    else
	        pass_fail := 'FAIL';
	    	end_job := true;
	        $IF $$empty_db $THEN
	            pass_fail := 'PASS empty_db';
	            end_job := false;
	        $END
	    end if;
	    dbms_output.put_line(pass_fail || ': table comparison for pc_result: was ' || trim(to_char(old_rows, '999,999,999')) || ', now ' || trim(to_char(new_rows, '999,999,999')));
	
	    dbms_output.put_line('... station');
		select min_rows, max_diff
		  into min_rows, max_diff
		 from etl_threshold
		where data_source_id = p_data_source_id and
		      table_name = 'STATION';
		execute immediate 'select count(*) from station partition (station_' || suffix || ')' into old_rows;
		execute immediate 'select count(*) from station_swap_' || suffix into new_rows;
	    if new_rows > min_rows and new_rows > old_rows - max_diff then
	        pass_fail := 'PASS';
	    else
	        pass_fail := 'FAIL';
	    	end_job := true;
	        $IF $$empty_db $THEN
	            pass_fail := 'PASS empty_db';
	            end_job := false;
	        $END
	    end if;
	    dbms_output.put_line(pass_fail || ': table comparison for station: was ' || trim(to_char(old_rows, '999,999,999')) || ', now ' || trim(to_char(new_rows, '999,999,999')));
	
	    if (suffix = 'STORET' or suffix = 'NWIS') then
		    dbms_output.put_line('... qw_portal_summary');
			select min_rows, max_diff
			  into min_rows, max_diff
			 from etl_threshold
			where data_source_id = p_data_source_id and
			      table_name = 'QWPORTAL_SUMMARY';
			execute immediate 'select count(*) from qwportal_summary partition (summary_' || suffix || ')' into old_rows;
			execute immediate 'select count(*) from qwportal_summary_swap_' || suffix into new_rows;
		    if new_rows > min_rows and new_rows > old_rows - max_diff then
		        pass_fail := 'PASS';
		    else
		        pass_fail := 'FAIL';
		    	end_job := true;
		        $IF $$empty_db $THEN
		            pass_fail := 'PASS empty_db';
		            end_job := false;
		        $END
		    end if;
		    dbms_output.put_line(pass_fail || ': table comparison for qwportal_summary: was ' || trim(to_char(old_rows, '999,999,999')) || ', now ' || trim(to_char(new_rows, '999,999,999')));

		end if;

		if end_job then
	    	raise_application_error(-20666, 'Failed to pass one or more validation checks.');
	  	end if;

	end validate;

	procedure install(p_table_suffix in user_tables.table_name%type) is
        suffix user_tables.table_name%type;
    begin

	    suffix := dbms_assert.simple_sql_name(p_table_suffix);
		
		dbms_output.put_line('station');
	    execute immediate 'alter table station exchange partition station_' || suffix ||
	                      ' with table station_swap_' || suffix || ' including indexes';
	    
	    dbms_output.put_line('pc_result');
	   	execute immediate 'alter table pc_result exchange partition pc_result_' || suffix ||
	                      ' with table pc_result_swap_' || suffix || ' including indexes';
	    
	   	dbms_output.put_line('station_sum');
		execute immediate 'alter table station_sum exchange partition station_sum_' || suffix ||
	                      ' with table station_sum_swap_' || suffix || ' including indexes';
	    
		dbms_output.put_line('pc_result_sum');
		execute immediate 'alter table pc_result_sum exchange partition pc_result_sum_' || suffix ||
	                      ' with table pc_result_sum_swap_' || suffix || ' including indexes';
	    
		dbms_output.put_line('pc_result_ct_sum');
		execute immediate 'alter table pc_result_ct_sum exchange partition pcrcts_' || suffix ||
	                      ' with table pc_result_ct_sum_swap_' || suffix || ' including indexes';
	    
		dbms_output.put_line('pc_result_nr_sum');
		execute immediate 'alter table pc_result_nr_sum exchange partition pc_res_nr_sum_' || suffix ||
	                      ' with table pc_result_nr_sum_swap_' || suffix || ' including indexes';
	    
		dbms_output.put_line('characteristic_name');
		execute immediate 'alter table char_name exchange partition char_name_' || suffix ||
	                      ' with table char_name_swap_' || suffix || ' including indexes';
	    
		dbms_output.put_line('characteristic_type');
		execute immediate 'alter table char_type exchange partition char_type_' || suffix ||
	                      ' with table char_type_swap_' || suffix || ' including indexes';
	    
		dbms_output.put_line('country');
		execute immediate 'alter table country exchange partition country_' || suffix ||
	                      ' with table country_swap_' || suffix || ' including indexes';
	    
		dbms_output.put_line('county');
		execute immediate 'alter table county exchange partition county_' || suffix ||
	                      ' with table county_swap_' || suffix || ' including indexes';
	    
		dbms_output.put_line('organization');
		execute immediate 'alter table organization exchange partition organization_' || suffix ||
	                      ' with table organization_swap_' || suffix || ' including indexes';
	    
		dbms_output.put_line('project');
		execute immediate 'alter table project exchange partition project_' || suffix ||
	                      ' with table project_swap_' || suffix || ' including indexes';
	
		dbms_output.put_line('sample_media');
		execute immediate 'alter table sample_media exchange partition sample_media_' || suffix ||
	                      ' with table sample_media_swap_' || suffix || ' including indexes';
	    
		dbms_output.put_line('site_type');
		execute immediate 'alter table site_type exchange partition site_type_' || suffix ||
	                      ' with table site_type_swap_' || suffix || ' including indexes';
	    
		dbms_output.put_line('state');
		execute immediate 'alter table state exchange partition state_' || suffix ||
	                      ' with table state_swap_' || suffix || ' including indexes';
	
	    if (suffix = 'STORET' or suffix = 'NWIS') then
			dbms_output.put_line('qwportal_summary');
			execute immediate 'alter table qwportal_summary exchange partition summary_' || suffix ||
	                          ' with table qwportal_summary_swap_' || suffix || ' including indexes';
		end if;

	end install;

	procedure update_last_etl(p_data_source_id in last_etl.data_source_id%type) is
	begin
		update last_etl
		   set data_source_id = p_data_source_id,
		       completed_utc = systimestamp at time zone 'UTC';
		if sql%rowcount = 0 then
		  insert into last_etl
		  values (p_data_source_id, systimestamp at time zone 'UTC');
		end if;
		commit;
	end update_last_etl;

end etl_helper;
--rollback drop package body etl_helper;
