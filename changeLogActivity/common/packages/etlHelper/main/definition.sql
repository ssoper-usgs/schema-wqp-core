create or replace package etl_helper_main as

    procedure drop_ri(p_table_suffix in user_tables.table_name%type);

    procedure drop_indexes(p_table_name in user_indexes.table_name%type);

    procedure add_ri(p_table_suffix in user_tables.table_name%type);

    procedure analyze_tables(p_table_suffix in user_tables.table_name%type);

    procedure validate_transformation(p_table_suffix in user_tables.table_name%type);

    function validate_table(p_table_name in user_tables.table_name%type,
                            p_partition_prefix in user_tables.table_name%type,
                            p_table_suffix in user_tables.table_name%type)
        return boolean;

    procedure install(p_table_suffix in user_tables.table_name%type);

    procedure update_last_etl(p_data_source_id in last_etl.data_source_id%type);

end etl_helper_main;
