create or replace package etl_helper_org_data as

    procedure drop_indexes(p_table_suffix in user_tables.table_name%type);

    procedure create_indexes(p_table_suffix in user_tables.table_name%type);

    procedure analyze_tables(p_table_suffix in user_tables.table_name%type);

    function validate_transformation(p_table_suffix in user_tables.table_name%type)
        return boolean;

    procedure install(p_table_suffix in user_tables.table_name%type);

end etl_helper_org_data;
