create or replace package body etl_helper_summary as

    procedure create_tables(p_table_suffix in user_tables.table_name%type) is
        table_name		user_tables.table_name%type;
   	begin

		create_station_sum(p_table_suffix);
		create_result_sum(p_table_suffix);
		create_result_ct_sum(p_table_suffix);
		create_result_nr_sum(p_table_suffix);
		create_qwportal_summary(p_table_suffix);

    end create_tables;
        
    procedure create_table(p_table_prefix in user_tables.table_name%type,
    					  p_table_suffix in user_tables.table_name%type,
        				  p_sql_suffix in varchar2) is
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
 
	end create_table;

	procedure create_station_sum(p_table_suffix in user_tables.table_name%type) is
        sql_suffix varchar2(4000 char);
	begin
    
        sql_suffix := '(data_source_id, data_source, station_id, site_id, organization, site_type, huc, governmental_unit_code, geom, result_count)
        select /*+ parallel(4) */ 
               station.data_source_id,
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
                            from result_swap_' || p_table_suffix || '
                               group by station_id) result
                 on station.station_id = result.station_id
            order by organization';

        create_table('station_sum_swap', p_table_suffix, sql_suffix);

    end create_station_sum;

	procedure create_result_sum(p_table_suffix in user_tables.table_name%type) is
    	sql_suffix varchar2(4000 char);
	begin
    
        sql_suffix := '(data_source_id, data_source, station_id, site_id, event_date, analytical_method, p_code,
             characteristic_name, characteristic_type, sample_media, organization, site_type, huc,
             governmental_unit_code, project_id, assemblage_sampled_name, sample_tissue_taxonomic_name, result_count)
        select data_source_id, data_source, station_id, site_id, event_date, analytical_method, p_code, characteristic_name,
               characteristic_type, sample_media, organization, site_type, huc, governmental_unit_code, project_id,
               assemblage_sampled_name, sample_tissue_taxonomic_name, count(*) result_count
          from result_swap_' || p_table_suffix || '
            group by data_source_id, data_source, station_id, site_id, event_date, analytical_method, p_code, characteristic_name,
                     characteristic_type, sample_media, organization, site_type, huc, governmental_unit_code, project_id,
                     assemblage_sampled_name, sample_tissue_taxonomic_name
             order by station_id';

        create_table('result_sum_swap_', p_table_suffix, sql_suffix);

    end create_result_sum;

	procedure create_result_ct_sum(p_table_suffix in user_tables.table_name%type) is
        sql_suffix varchar2(4000 char);
	begin
    
        sql_suffix := '(data_source_id, data_source, station_id, site_id, governmental_unit_code, site_type, organization, huc, sample_media,
             characteristic_type, characteristic_name, analytical_method, p_code, project_id, assemblage_sampled_name,
             sample_tissue_taxonomic_name, result_count)
        select /*+ parallel(4) */ 
               data_source_id, data_source, station_id, site_id, governmental_unit_code, site_type, organization, huc, sample_media,
               characteristic_type, characteristic_name, analytical_method, p_code, project_id, assemblage_sampled_name,
			   sample_tissue_taxonomic_name, sum(result_count) result_count
          from result_sum_swap_' || p_table_suffix || '
             group by data_source_id, data_source, site_id, station_id, governmental_unit_code, site_type, organization, huc,
                      sample_media, characteristic_type, characteristic_name, analytical_method, p_code, project_id,
                      assemblage_sampled_name, sample_tissue_taxonomic_name
             order by characteristic_name';

        create_table('result_ct_sum_swap_', p_table_suffix, sql_suffix);

    end create_result_ct_sum;

	procedure create_result_nr_sum(p_table_suffix in user_tables.table_name%type) is
        sql_suffix varchar2(4000 char);
	begin
    
        sql_suffix := '(data_source_id, data_source, station_id, event_date, analytical_method, p_code, characteristic_name,
             characteristic_type, sample_media, project_id, assemblage_sampled_name, sample_tissue_taxonomic_name, result_count)
        select /*+ parallel(4) */ 
               data_source_id, data_source, station_id, event_date, analytical_method, p_code, characteristic_name,
               characteristic_type, sample_media, project_id, assemblage_sampled_name, sample_tissue_taxonomic_name,
               sum(result_count) result_count
          from result_sum_swap_' || p_table_suffix || '
             group by data_source_id, data_source, station_id, event_date, analytical_method, p_code, characteristic_name,
                      characteristic_type, sample_media, project_id, assemblage_sampled_name, sample_tissue_taxonomic_name
             order by characteristic_name';
        
        create_table('result_nr_sum_swap_', p_table_suffix, sql_suffix);

    end create_result_nr_sum;

    procedure create_qwportal_summary(p_table_suffix in user_tables.table_name%type) is
        sql_suffix varchar2(4000 char);
    begin

        if upper(p_table_suffix) = 'NWIS' or
           upper(p_table_suffix) = 'STORET' then

            sql_suffix := q'!(data_source_id, fips_state_code, fips_county_code, fips_state_and_county, huc8, min_date, max_date,
                    samples_past_12_months, samples_past_60_months, samples_all_time)
            select /*+ parallel(4) */ data_source_id,
                   regexp_substr(state_code, '[^:]+', 1, 2) state_fips_code,
                   regexp_substr(county_code, '[^:]+', 1, 3) county_fips_code,
                   regexp_substr(state_code, '[^:]+', 1, 2)||regexp_substr(county_code, '[^:]+', 1, 3) fips_state_and_county,
                   huc_8,
                   min(case when event_date between to_date('01-JAN-1875', 'DD-MON-YYYY') and to_date('19-FEB-2015', 'DD-MON-YYYY') then event_date else null end) min_date,
                   max(case when event_date between to_date('01-JAN-1875', 'DD-MON-YYYY') and to_date('19-FEB-2015', 'DD-MON-YYYY') then event_date else null end) max_date,
                   count(distinct case when months_between(to_date('19-FEB-2015', 'DD-MON-YYYY'), event_date) between 0 and 12 then activity else null end) samples_past_12_months,
                   count(distinct case when months_between(to_date('19-FEB-2015', 'DD-MON-YYYY'), event_date) between 0 and 60 then activity else null end) samples_past_60_months,
                   count(distinct activity) samples_all_time
              from result_swap_!' || p_table_suffix || q'!
             where state_code between 'US:01' and 'US:56'
                group by data_source_id, regexp_substr(state_code, '[^:]+', 1, 2), regexp_substr(county_code, '[^:]+', 1, 3), huc_8!';
                
        	create_table('qwportal_summary_swap_', p_table_suffix, sql_suffix);

		end if;

 	end create_qwportal_summary;

 	procedure create_indexes(p_table_suffix in user_tables.table_name%type) is
 	begin

	 	create_station_sum_indexes(p_table_suffix);
	 	create_result_sum_indexes(p_table_suffix);
	 	create_result_ct_sum_indexes(p_table_suffix);
	 	create_result_nr_sum_indexes(p_table_suffix);

	 end create_indexes;

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
        table_name := dbms_assert.sql_object_name(upper('result_sum_swap_' || p_table_suffix));

        stmt := 'create bitmap index rs_' || p_table_suffix || '_analytical on ' || table_name || '(analytical_method) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rs_' || p_table_suffix || '_assemblage on ' || table_name || '(assemblage_sampled_name) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rs_' || p_table_suffix || '_char_name on ' || table_name || '(characteristic_name) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rs_' || p_table_suffix || '_char_type on ' || table_name || '(characteristic_type) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rs_' || p_table_suffix || '_country on ' || table_name || '(country_code) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rs_' || p_table_suffix || '_county on ' || table_name || '(county_code) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rs_' || p_table_suffix || '_event_date on ' || table_name || '(event_date) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rs_' || p_table_suffix || '_huc10 on ' || table_name || '(huc_10) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rs_' || p_table_suffix || '_huc12 on ' || table_name || '(huc_12) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rs_' || p_table_suffix || '_huc2 on ' || table_name || '(huc_2) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rs_' || p_table_suffix || '_huc4 on ' || table_name || '(huc_4) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rs_' || p_table_suffix || '_huc6 on ' || table_name || '(huc_6) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rs_' || p_table_suffix || '_huc8 on ' || table_name || '(huc_8) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rs_' || p_table_suffix || '_organization on ' || table_name || '(organization) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rs_' || p_table_suffix || '_p_code on ' || table_name || '(p_code) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rs_' || p_table_suffix || '_project on ' || table_name || '(project_id) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rs_' || p_table_suffix || '_sample_media on ' || table_name || '(sample_media) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rs_' || p_table_suffix || '_site on ' || table_name || '(site_id) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rs_' || p_table_suffix || '_site_type on ' || table_name || '(site_type) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rs_' || p_table_suffix || '_state on ' || table_name || '(state_code) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rs_' || p_table_suffix || '_station on ' || table_name || '(station_id) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rs_' || p_table_suffix || '_taxa_name on ' || table_name || '(sample_tissue_taxonomic_name) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

    end create_result_sum_indexes;

	procedure create_result_ct_sum_indexes(p_table_suffix in user_tables.table_name%type) is
        stmt            varchar2(32000);
        table_name		user_tables.table_name%type;
   	begin
	
        dbms_output.put_line('creating result_ct_sum indexes...');
        table_name := dbms_assert.sql_object_name(upper('result_ct_sum_swap_' || p_table_suffix));

        stmt := 'create bitmap index rcts_' || p_table_suffix || '_analytical on ' || table_name || '(analytical_method) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rcts_' || p_table_suffix || '_assemblage on ' || table_name || '(assemblage_sampled_name) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rcts_' || p_table_suffix || '_char_name on ' || table_name || '(characteristic_name) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rcts_' || p_table_suffix || '_char_type on ' || table_name || '(characteristic_type) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rcts_' || p_table_suffix || '_country on ' || table_name || '(country_code) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rcts_' || p_table_suffix || '_county on ' || table_name || '(county_code) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rcts_' || p_table_suffix || '_huc10 on ' || table_name || '(huc_10) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rcts_' || p_table_suffix || '_huc12 on ' || table_name || '(huc_12) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rcts_' || p_table_suffix || '_huc2 on ' || table_name || '(huc_2) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rcts_' || p_table_suffix || '_huc4 on ' || table_name || '(huc_4) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rcts_' || p_table_suffix || '_huc6 on ' || table_name || '(huc_6) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rcts_' || p_table_suffix || '_huc8 on ' || table_name || '(huc_8) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rcts_' || p_table_suffix || '_organization on ' || table_name || '(organization) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rcts_' || p_table_suffix || '_p_code on ' || table_name || '(p_code) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rcts_' || p_table_suffix || '_project on ' || table_name || '(project_id) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rcts_' || p_table_suffix || '_sample_media on ' || table_name || '(sample_media) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rcts_' || p_table_suffix || '_site on ' || table_name || '(site_id) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rcts_' || p_table_suffix || '_site_type on ' || table_name || '(site_type) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rcts_' || p_table_suffix || '_state on ' || table_name || '(state_code) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rcts_' || p_table_suffix || '_station on ' || table_name || '(station_id) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rcts_' || p_table_suffix || '_taxa_name on ' || table_name || '(sample_tissue_taxonomic_name) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

    end create_result_ct_sum_indexes;

	procedure create_result_nr_sum_indexes(p_table_suffix in user_tables.table_name%type) is
        stmt            varchar2(32000);
        table_name		user_tables.table_name%type;
   	begin
	
        table_name := dbms_assert.sql_object_name(upper('result_nr_sum_swap_' || p_table_suffix));
        dbms_output.put_line('creating result_nr_sum indexes...');

        stmt := 'create bitmap index rnrs_' || p_table_suffix || '_analytical on ' || table_name || '(analytical_method) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rnrs_' || p_table_suffix || '_assemblage on ' || table_name || '(assemblage_sampled_name) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rnrs_' || p_table_suffix || '_char_name on ' || table_name || '(characteristic_name) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rnrs_' || p_table_suffix || '_char_type on ' || table_name || '(characteristic_type) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rnrs_' || p_table_suffix || '_p_code on ' || table_name || '(p_code) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rnrs_' || p_table_suffix || '_project on ' || table_name || '(project_id) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rnrs_' || p_table_suffix || '_sample_media on ' || table_name || '(sample_media) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rnrs_' || p_table_suffix || '_station on ' || table_name || '(station_id) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rnrs_' || p_table_suffix || '_taxa_name on ' || table_name || '(sample_tissue_taxonomic_name) local parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;
        
	end create_result_nr_sum_indexes;

	procedure analyze_tables(p_table_suffix in user_tables.table_name%type) is
        suffix user_tables.table_name%type;
    begin

	    suffix := dbms_assert.simple_sql_name(upper(p_table_suffix));
		
	    dbms_output.put_line('analyze result_ct_sum...');
	    dbms_stats.gather_table_stats(ownname => 'WQP_CORE', tabname => 'RESULT_CT_SUM_SWAP_' || suffix, method_opt => 'FOR ALL INDEXED COLUMNS');
	    
	    dbms_output.put_line('analyze result_nr_sum...');
	    dbms_stats.gather_table_stats(ownname => 'WQP_CORE', tabname => 'RESULT_NR_SUM_SWAP_' || suffix, method_opt => 'FOR ALL INDEXED COLUMNS');
	    
	    dbms_output.put_line('analyze result_sum...');
	    dbms_stats.gather_table_stats(ownname => 'WQP_CORE', tabname => 'RESULT_SUM_SWAP_' || suffix, method_opt => 'FOR ALL INDEXED COLUMNS');
	    
	    dbms_output.put_line('analyze station_sum...');
	    dbms_stats.gather_table_stats(ownname => 'WQP_CORE', tabname => 'STATION_SUM_SWAP_' || suffix, method_opt => 'FOR ALL INDEXED COLUMNS');

	end analyze_tables;

	function validate_transformation(p_table_suffix in user_tables.table_name%type)
        return boolean is
        end_job     boolean := false;
    begin

	    if (upper(p_table_suffix) = 'STORET' or upper(p_table_suffix) = 'NWIS') then
		    end_job := etl_helper_main.validate_table('qwportal_summary', 'summary_', p_table_suffix);
		end if;

		return end_job;

	end validate_transformation;

	procedure install(p_table_suffix in user_tables.table_name%type) is
        suffix user_tables.table_name%type;
    begin

	    suffix := dbms_assert.simple_sql_name(p_table_suffix);
		
	   	dbms_output.put_line('station_sum');
		execute immediate 'alter table station_sum exchange partition station_sum_' || suffix ||
	                      ' with table station_sum_swap_' || suffix || ' including indexes';
	    
		dbms_output.put_line('result_sum');
		execute immediate 'alter table result_sum exchange partition result_sum_' || suffix ||
	                      ' with table result_sum_swap_' || suffix || ' including indexes';
	    
		dbms_output.put_line('result_ct_sum');
		execute immediate 'alter table result_ct_sum exchange partition rcts_' || suffix ||
	                      ' with table result_ct_sum_swap_' || suffix || ' including indexes';
	    
		dbms_output.put_line('result_nr_sum');
		execute immediate 'alter table result_nr_sum exchange partition res_nr_sum_' || suffix ||
	                      ' with table result_nr_sum_swap_' || suffix || ' including indexes';

	    if (suffix = 'storet' or suffix = 'nwis') then
			dbms_output.put_line('qwportal_summary');
			execute immediate 'alter table qwportal_summary exchange partition summary_' || suffix ||
	                          ' with table qwportal_summary_swap_' || suffix || ' including indexes';
		end if;

	end install;

end etl_helper_summary;
