create or replace package body etl_helper_main as

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

		stmt := 'alter table result_swap_' || suffix || ' add constraint r_station_fk_' || suffix ||
                ' foreign key (data_source_id, station_id) references station_swap_' || suffix ||
                ' (data_source_id, station_id) rely enable novalidate';
        dbms_output.put_line(stmt);
        execute immediate stmt;
       
		stmt := 'alter table result_sum_swap_' || suffix || ' add constraint rs_station_fk' || suffix ||
                ' foreign key (data_source_id, station_id) references station_sum_swap_' || suffix ||
                ' (data_source_id, station_id) rely enable novalidate';
        dbms_output.put_line(stmt);
        execute immediate stmt;
       
		stmt := 'alter table result_ct_sum_swap_' || suffix || ' add constraint rcts_station_fk' || suffix ||
                ' foreign key (data_source_id, station_id) references station_sum_swap_' || suffix ||
                ' (data_source_id, station_id) rely enable novalidate';
        dbms_output.put_line(stmt);
        execute immediate stmt;
       
		stmt := 'alter table result_nr_sum_swap_' || suffix || ' add constraint rnrs_station_fk' || suffix ||
                ' foreign key (data_source_id, station_id) references station_sum_swap_' || suffix ||
                ' (data_source_id, station_id) rely enable novalidate';
        dbms_output.put_line(stmt);
        execute immediate stmt;
        
	end add_ri;

	procedure analyze_tables(p_table_suffix in user_tables.table_name%type) is
    begin
    
    	etl_helper_code.analyze_tables(p_table_suffix);
    	etl_helper_summary.analyze_tables(p_table_suffix);
       	etl_helper_station.analyze_tables(p_table_suffix);
        etl_helper_result.analyze_tables(p_table_suffix);
        
    end analyze_tables;

	procedure validate_transformation(p_table_suffix in user_tables.table_name%type) is
        end_job boolean := false;
    begin
    
    	end_job := etl_helper_summary.validate_transformation(p_table_suffix) or
       			   etl_helper_station.validate_transformation(p_table_suffix) or
	        	   etl_helper_result.validate_transformation(p_table_suffix);
        
   		if end_job then
	    	raise_application_error(-20666, 'Failed to pass one or more validation checks.');
	  	end if;

    end validate_transformation;

	function validate_table(p_table_name in user_tables.table_name%type,
                             p_partition_prefix in user_tables.table_name%type,
                             p_table_suffix in user_tables.table_name%type)
        return boolean is
        min_rows		etl_threshold.min_rows%type;
        max_diff		etl_threshold.max_diff%type;
        suffix			data_source.text%type;
        ds_id			data_source.data_source_id%type;
        l_table_name  	user_tables.table_name%type;
 		old_rows    	int;
        new_rows    	int;
        pass_fail   	varchar2(15);
        end_job     	boolean := false;
    begin

        l_table_name := dbms_assert.sql_object_name(upper(p_table_name));

		dbms_output.put_line('validating...' || l_table_name);
	
	    select data_source_id, text
	      into ds_id, suffix
	      from data_source
	     where text = upper(p_table_suffix);

		select min_rows, max_diff
		  into min_rows, max_diff
		 from etl_threshold
		where data_source_id = ds_id and
		      table_name = l_table_name;

		execute immediate 'select count(*) from ' || l_table_name || ' partition (' || dbms_assert.simple_sql_name(p_partition_prefix) || suffix || ')' into old_rows;
		execute immediate 'select count(*) from ' || l_table_name || '_swap_' || suffix into new_rows;

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
	    dbms_output.put_line(pass_fail || ': table comparison for ' || l_table_name || ': was ' || trim(to_char(old_rows, '999,999,999')) || ', now ' || trim(to_char(new_rows, '999,999,999')));

		return end_job;
        
	end validate_table;

	procedure install(p_table_suffix in user_tables.table_name%type) is
        suffix user_tables.table_name%type;
    begin

	    suffix := dbms_assert.simple_sql_name(p_table_suffix);
		
		dbms_output.put_line('station');
	    execute immediate 'alter table station exchange partition station_' || suffix ||
	                      ' with table station_swap_' || suffix || ' including indexes';
	    
	    dbms_output.put_line('result');
	   	execute immediate 'alter table result exchange partition result_' || suffix ||
	                      ' with table result_swap_' || suffix || ' including indexes';
	    
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
	
	    if (suffix = 'storet' or suffix = 'nwis') then
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

end etl_helper_main;
