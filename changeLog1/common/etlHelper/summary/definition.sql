create or replace package etl_helper_summary as

	procedure create_tables(p_table_suffix in user_tables.table_name%type);
	
	procedure create_station_sum(p_table_suffix in user_tables.table_name%type);
	
	procedure create_result_sum(p_table_suffix in user_tables.table_name%type);
	
	procedure create_result_ct_sum(p_table_suffix in user_tables.table_name%type);
	
	procedure create_result_nr_sum(p_table_suffix in user_tables.table_name%type);
	
    procedure create_qwportal_summary(p_table_suffix in user_tables.table_name%type);

	procedure create_indexes(p_table_suffix in user_tables.table_name%type);

	procedure create_station_sum_indexes(p_table_suffix in user_tables.table_name%type);

	procedure create_result_sum_indexes(p_table_suffix in user_tables.table_name%type);

	procedure create_result_ct_sum_indexes(p_table_suffix in user_tables.table_name%type);

	procedure create_result_nr_sum_indexes(p_table_suffix in user_tables.table_name%type);

	procedure analyze_tables(p_table_suffix in user_tables.table_name%type);
	
	function validate_transformation(p_table_suffix in user_tables.table_name%type)
    	return boolean;

	procedure install(p_table_suffix in user_tables.table_name%type);

end etl_helper_summary;
