create or replace package etl_helper_code as

	procedure create_tables(p_table_suffix in user_tables.table_name%type);

	procedure create_assemblage(p_table_suffix in user_tables.table_name%type);

	procedure create_char_name(p_table_suffix in user_tables.table_name%type);

	procedure create_char_type(p_table_suffix in user_tables.table_name%type);

	procedure create_country(p_table_suffix in user_tables.table_name%type);

	procedure create_county(p_table_suffix in user_tables.table_name%type);

	procedure create_organization(p_table_suffix in user_tables.table_name%type);

	procedure create_project_dim(p_table_suffix in user_tables.table_name%type);

	procedure create_project(p_table_suffix in user_tables.table_name%type);

	procedure create_sample_media(p_table_suffix in user_tables.table_name%type);

	procedure create_site_type(p_table_suffix in user_tables.table_name%type);

	procedure create_state(p_table_suffix in user_tables.table_name%type);

	procedure create_taxa_name(p_table_suffix in user_tables.table_name%type);

	procedure analyze_tables(p_table_suffix in user_tables.table_name%type);

	procedure install(p_table_suffix in user_tables.table_name%type);

end etl_helper_code;
