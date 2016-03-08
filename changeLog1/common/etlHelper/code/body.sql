create or replace package body etl_helper_code as

	procedure create_tables(p_table_suffix in user_tables.table_name%type) is
    begin

	    create_assemblage(p_table_suffix);

	    create_char_name(p_table_suffix);

		create_char_type(p_table_suffix);

		create_country(p_table_suffix);

		create_county(p_table_suffix);

		create_organization(p_table_suffix);

		create_project_dim(p_table_suffix);

		create_project(p_table_suffix);

		create_sample_media(p_table_suffix);

		create_site_type(p_table_suffix);

		create_state(p_table_suffix);

		create_taxa_name(p_table_suffix);

	end create_tables;

    function create_table(p_table_prefix in user_tables.table_name%type,
    					  p_table_suffix in user_tables.table_name%type,
        				  p_sql_suffix in varchar2)
    	return user_tables.table_name%type is
		table_name user_tables.table_name%type;
    begin

   	    table_name := dbms_assert.sql_object_name(upper(p_table_prefix || p_table_suffix));

        dbms_output.put_line('dropping indexes on:' || table_name || ' at:' || systimestamp);
        etl_helper_main.drop_indexes(table_name);
        
	    dbms_output.put_line('populating:' || table_name || ' at:' || systimestamp);
        execute immediate 'truncate table ' || table_name;

        execute immediate 'insert /*+ append parallel(4) */ into ' || table_name || p_sql_suffix;
        commit;

        dbms_output.put_line('finished populating:' || table_name || ' at:' || systimestamp);
        return table_name;
 
	end create_table;

	procedure create_assemblage(p_table_suffix in user_tables.table_name%type) is
        sql_suffix varchar2(4000 char);
		table_name user_tables.table_name%type;
    begin

        sql_suffix := ' (data_source_id, code_value)
        select /*+ parallel(4) */ 
               distinct data_source_id,
                        assemblage_sampled_name code_value
          from result_ct_sum_swap_' || dbms_assert.simple_sql_name(upper(p_table_suffix)) || '
         where assemblage_sampled_name is not null';
        
		table_name := create_table('assemblage_swap_', p_table_suffix, sql_suffix);
        
	end create_assemblage;

    procedure create_char_name(p_table_suffix in user_tables.table_name%type) is
        sql_suffix varchar2(4000 char);
		table_name user_tables.table_name%type;
    begin

        sql_suffix := ' (data_source_id, code_value)
        select /*+ parallel(4) */ 
               distinct data_source_id,
                        characteristic_name code_value
          from result_ct_sum_swap_' || dbms_assert.simple_sql_name(upper(p_table_suffix)) || '
         where characteristic_name is not null';
        
		table_name := create_table('char_name_swap_', p_table_suffix, sql_suffix);
        
	end create_char_name;

    procedure create_char_type(p_table_suffix in user_tables.table_name%type) is
        sql_suffix varchar2(4000 char);
		table_name user_tables.table_name%type;
    begin

        sql_suffix := ' (data_source_id, code_value)
        select /*+ parallel(4) */ 
               distinct data_source_id,
                        characteristic_type code_value
          from result_ct_sum_swap_' || dbms_assert.simple_sql_name(upper(p_table_suffix)) || '
         where characteristic_type is not null';
        
		table_name := create_table('char_type_swap_', p_table_suffix, sql_suffix);
        
	end create_char_type;

    procedure create_country(p_table_suffix in user_tables.table_name%type) is
        sql_suffix varchar2(4000 char);
		table_name user_tables.table_name%type;
    begin

        if upper(p_table_suffix) = 'BIODATA' or
           upper(p_table_suffix) = 'NWIS' or
           upper(p_table_suffix) = 'STEWARDS' then
          	sql_suffix := ' (data_source_id, code_value, description)
            select /*+ parallel(4) */ 
                   distinct s.data_source_id,
                            s.country_code code_value,
                            country.country_nm description
                       from station_sum_swap_' || dbms_assert.simple_sql_name(upper(p_table_suffix)) || ' s
                            join nwis_ws_star.country
                              on s.country_code = country.country_cd 
                      where s.country_code is not null';
        else
          	sql_suffix := ' (data_source_id, code_value, description)
            select /*+ parallel(4) */ 
                   distinct s.data_source_id,
                            s.country_code code_value,
                            nvl(nwis_country.country_nm, upper(country.cntry_name)) description
                       from station_sum_swap_' || dbms_assert.simple_sql_name(upper(p_table_suffix)) || ' s
                            left join nwis_ws_star.country nwis_country
                              on s.country_code = nwis_country.country_cd 
                            join wqx.country
                              on s.country_code = country.cntry_cd 
                      where s.country_code is not null';
        end if;
        
		table_name := create_table('country_swap_', p_table_suffix, sql_suffix);
        
	end create_country;

    procedure create_county(p_table_suffix in user_tables.table_name%type) is
        sql_suffix varchar2(4000 char);
		table_name user_tables.table_name%type;
    begin

        if upper(p_table_suffix) = 'BIODATA' or
           upper(p_table_suffix) = 'NWIS' or
           upper(p_table_suffix) = 'STEWARDS' then
			sql_suffix := q'! (data_source_id, code_value, description)
            select /*+ parallel(4) */ 
                   distinct s.data_source_id,
                            s.county_code code_value,
                            s.country_code || ', ' || state.state_nm || ', ' || county.county_nm description
              from station_sum_swap_!' || dbms_assert.simple_sql_name(upper(p_table_suffix)) || q'! s
                   left join nwis_ws_star.state
                     on s.country_code = state.country_cd and
                        regexp_substr(s.state_code, '[^:]+', 1, 2) = state.state_cd
                   left join nwis_ws_star.county
                     on s.country_code = county.country_cd and
                        regexp_substr(s.state_code, '[^:]+', 1, 2) = county.state_cd and
                        regexp_substr(s.county_code, '[^:]+', 1, 3) = county.county_cd
             where s.county_code is not null!';
        else
          	sql_suffix := q'! (data_source_id, code_value, description)
            select /*+ parallel(4) */ 
                   distinct s.data_source_id,
                            s.county_code code_value,
                            s.country_code || ', ' || state.st_name || ', ' || county.cnty_name description
              from station_sum_swap_!' || dbms_assert.simple_sql_name(upper(p_table_suffix)) || q'! s
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

		table_name := create_table('county_swap_', p_table_suffix, sql_suffix);
        
	end create_county;

    procedure create_organization(p_table_suffix in user_tables.table_name%type) is
        sql_suffix varchar2(4000 char);
		table_name user_tables.table_name%type;
    begin

        sql_suffix := '	(data_source_id, code_value, description)
        select /*+ parallel(4) */ 
               distinct s.data_source_id,
                        s.organization code_value,
                        s.organization_name description
          from station_swap_' || dbms_assert.simple_sql_name(upper(p_table_suffix)) || ' s
         where s.organization is not null';
        
		table_name := create_table('organization_swap_', p_table_suffix, sql_suffix);
        
	end create_organization;

    procedure create_project_dim(p_table_suffix in user_tables.table_name%type) is
        sql_suffix varchar2(4000 char);
		table_name user_tables.table_name%type;
    begin

        sql_suffix := q'! (data_source_id, code_value, project_dim_value)
		select /*+ parallel(4) */
		       data_source_id,
		       code_value,
		       project_dim_value
		  from (select distinct
		               data_source_id,
		               trim(replace(regexp_substr(project_id, '(.*?)(;|$)', 1, levels.column_value),';','')) code_value,
		               project_id project_dim_value
		          from result_ct_sum_swap_!' || dbms_assert.simple_sql_name(upper(p_table_suffix)) || q'!,
		               table(cast(multiset(select level from dual connect by level <= regexp_count(project_id, ';', 1, 'i') + 1) as sys.odcinumberlist)) levels
		         where project_id is not null)!';
        
		table_name := create_table('project_dim_swap_', p_table_suffix, sql_suffix);
        
		execute immediate 'create bitmap index pds_' || p_table_suffix || '_code on ' || table_name || '(code_value) parallel 4 nologging';

	end create_project_dim;

    procedure create_project(p_table_suffix in user_tables.table_name%type) is
        sql_suffix varchar2(4000 char);
		table_name user_tables.table_name%type;
    begin

        sql_suffix := ' (data_source_id, code_value)
        select /*+ parallel(4) */ 
               distinct data_source_id,
                        code_value
          from project_dim_swap_' || dbms_assert.simple_sql_name(upper(p_table_suffix)) || '
         where code_value is not null';
        
		table_name := create_table('project_swap_', p_table_suffix, sql_suffix);
        
	end create_project;

    procedure create_sample_media(p_table_suffix in user_tables.table_name%type) is
        sql_suffix varchar2(4000 char);
		table_name user_tables.table_name%type;
    begin

        sql_suffix := ' (data_source_id, code_value)
        select /*+ parallel(4) */ 
               distinct data_source_id,
                        sample_media code_value
          from result_ct_sum_swap_' || dbms_assert.simple_sql_name(upper(p_table_suffix)) || '
         where sample_media is not null';
        
		table_name := create_table('sample_media_swap_', p_table_suffix, sql_suffix);
        
	end create_sample_media;

    procedure create_site_type(p_table_suffix in user_tables.table_name%type) is
        sql_suffix varchar2(4000 char);
		table_name user_tables.table_name%type;
    begin

        sql_suffix := ' (data_source_id, code_value)
        select /*+ parallel(4) */ 
               distinct s.data_source_id,
                        s.site_type code_value
          from station_sum_swap_' || dbms_assert.simple_sql_name(upper(p_table_suffix)) || ' s
         where s.site_type is not null';
        
		table_name := create_table('site_type_swap_', p_table_suffix, sql_suffix);
        
	end create_site_type;

    procedure create_state(p_table_suffix in user_tables.table_name%type) is
        sql_suffix varchar2(4000 char);
		table_name user_tables.table_name%type;
    begin

		if upper(p_table_suffix) = 'BIODATA' or
    	   upper(p_table_suffix) = 'NWIS' or
	       upper(p_table_suffix) = 'STEWARDS' then
			sql_suffix := q'! (data_source_id, code_value, description_with_country, description_with_out_country)
            select /*+ parallel(4) */ 
                   distinct s.data_source_id,
                            s.state_code code_value,
                            s.country_code || ', ' || state.state_nm description_with_country,
                            state.state_nm description_with_out_country
              from station_sum_swap_!' || dbms_assert.simple_sql_name(upper(p_table_suffix)) || q'! s
                   left join nwis_ws_star.state
                     on s.country_code = trim(state.country_cd) and
                        regexp_substr(s.state_code, '[^:]+', 1, 2) = trim(state.state_cd)
             where s.state_code is not null!';
        else
          	sql_suffix := q'! (data_source_id, code_value, description_with_country, description_with_out_country)
			select /*+ parallel(4) */ 
			       distinct s.data_source_id,
			                s.state_code code_value,
			                s.country_code || ', ' || state.st_name description_with_country,
			                state.st_name description_with_out_country
			  from station_sum_swap_!' || dbms_assert.simple_sql_name(upper(p_table_suffix)) || q'! s
			       join wqx.country
			         on s.country_code = country.cntry_cd 
			       left join wqx.state
			         on country.cntry_uid = state.cntry_uid and
			            regexp_substr(s.state_code, '[^:]+', 1, 2) = state.st_fips_cd
			 where s.state_code is not null!';
        end if;
        
		table_name := create_table('state_swap_', p_table_suffix, sql_suffix);
        
	end create_state;

    procedure create_taxa_name(p_table_suffix in user_tables.table_name%type) is
        sql_suffix varchar2(4000 char);
		table_name user_tables.table_name%type;
    begin

        sql_suffix := ' (data_source_id, code_value)
        select /*+ parallel(4) */ 
               distinct data_source_id,
                        sample_tissue_taxonomic_name code_value
          from result_ct_sum_swap_' || dbms_assert.simple_sql_name(upper(p_table_suffix)) || '
         where sample_tissue_taxonomic_name is not null';
        
		table_name := create_table('taxa_name_swap_', p_table_suffix, sql_suffix);
        
    end create_taxa_name;

	procedure analyze_tables(p_table_suffix in user_tables.table_name%type) is
        suffix user_tables.table_name%type;
    begin

	    suffix := dbms_assert.simple_sql_name(upper(p_table_suffix));
		
	    dbms_output.put_line('analyze assemblage...');
	    dbms_stats.gather_table_stats(ownname => 'WQP_CORE', tabname => 'ASSEMBLAGE_SWAP_' || suffix, method_opt => 'FOR ALL INDEXED COLUMNS');
	    
	    dbms_output.put_line('analyze characteristic_name...');
	    dbms_stats.gather_table_stats(ownname => 'WQP_CORE', tabname => 'CHAR_NAME_SWAP_' || suffix, method_opt => 'FOR ALL INDEXED COLUMNS');
	    
	    dbms_output.put_line('analyze characteristic_type...');
	    dbms_stats.gather_table_stats(ownname => 'WQP_CORE', tabname => 'CHAR_TYPE_SWAP_' || suffix, method_opt => 'FOR ALL INDEXED COLUMNS');
	    
	    dbms_output.put_line('analyze country...');
	    dbms_stats.gather_table_stats(ownname => 'WQP_CORE', tabname => 'COUNTRY_SWAP_' || suffix, method_opt => 'FOR ALL INDEXED COLUMNS');
	    
	    dbms_output.put_line('analyze county...');
	    dbms_stats.gather_table_stats(ownname => 'WQP_CORE', tabname => 'COUNTY_SWAP_' || suffix, method_opt => 'FOR ALL INDEXED COLUMNS');
	    
	    dbms_output.put_line('analyze organization...');
	    dbms_stats.gather_table_stats(ownname => 'WQP_CORE', tabname => 'ORGANIZATION_SWAP_' || suffix, method_opt => 'FOR ALL INDEXED COLUMNS');
	    
	    dbms_output.put_line('analyze project...');
	    dbms_stats.gather_table_stats(ownname => 'WQP_CORE', tabname => 'PROJECT_SWAP_' || suffix, method_opt => 'FOR ALL INDEXED COLUMNS');
	    
	    dbms_output.put_line('analyze project_dim...');
	    dbms_stats.gather_table_stats(ownname => 'WQP_CORE', tabname => 'PROJECT_DIM_SWAP_' || suffix, method_opt => 'FOR ALL INDEXED COLUMNS');
	    
	    dbms_output.put_line('analyze sample_media...');
	    dbms_stats.gather_table_stats(ownname => 'WQP_CORE', tabname => 'SAMPLE_MEDIA_SWAP_' || suffix, method_opt => 'FOR ALL INDEXED COLUMNS');
	    
	    dbms_output.put_line('analyze site_type...');
	    dbms_stats.gather_table_stats(ownname => 'WQP_CORE', tabname => 'SITE_TYPE_SWAP_' || suffix, method_opt => 'FOR ALL INDEXED COLUMNS');
	    
	    dbms_output.put_line('analyze state...');
	    dbms_stats.gather_table_stats(ownname => 'WQP_CORE', tabname => 'STATE_SWAP_' || suffix, method_opt => 'FOR ALL INDEXED COLUMNS');
		
	    dbms_output.put_line('analyze taxa_name...');
	    dbms_stats.gather_table_stats(ownname => 'WQP_CORE', tabname => 'TAXA_NAME_SWAP_' || suffix, method_opt => 'FOR ALL INDEXED COLUMNS');

	end analyze_tables;

	procedure install(p_table_suffix in user_tables.table_name%type) is
        suffix user_tables.table_name%type;
    begin

	    suffix := dbms_assert.simple_sql_name(p_table_suffix);
		
		dbms_output.put_line('assemblage');
		execute immediate 'alter table assemblage exchange partition assemblage_' || suffix ||
	                      ' with table assemblage_swap_' || suffix || ' including indexes';
	    
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
	
		dbms_output.put_line('project_dim');
		execute immediate 'alter table project_dim exchange partition project_dim_' || suffix ||
	                      ' with table project_dim_swap_' || suffix || ' including indexes';
	
		dbms_output.put_line('sample_media');
		execute immediate 'alter table sample_media exchange partition sample_media_' || suffix ||
	                      ' with table sample_media_swap_' || suffix || ' including indexes';
	    
		dbms_output.put_line('site_type');
		execute immediate 'alter table site_type exchange partition site_type_' || suffix ||
	                      ' with table site_type_swap_' || suffix || ' including indexes';
	    
		dbms_output.put_line('state');
		execute immediate 'alter table state exchange partition state_' || suffix ||
	                      ' with table state_swap_' || suffix || ' including indexes';
	
		dbms_output.put_line('taxa_name');
		execute immediate 'alter table taxa_name exchange partition taxa_name_' || suffix ||
	                      ' with table taxa_name_swap_' || suffix || ' including indexes';

	end install;

end etl_helper_code;
