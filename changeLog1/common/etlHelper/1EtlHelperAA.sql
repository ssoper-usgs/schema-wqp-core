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
