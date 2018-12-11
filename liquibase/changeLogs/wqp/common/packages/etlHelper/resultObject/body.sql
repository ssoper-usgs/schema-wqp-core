create or replace package body etl_helper_result_object as

    procedure drop_indexes(p_table_suffix in user_tables.table_name%type) is
        table_name user_tables.table_name%type;
    begin

        table_name := dbms_assert.sql_object_name(upper('result_object_swap_' || p_table_suffix));
        etl_helper_main.drop_indexes(table_name);

    end drop_indexes;

    procedure create_indexes(p_table_suffix in user_tables.table_name%type) is
        stmt            character varying (32000);
        table_name      user_tables.table_name%type;
    begin

        dbms_output.put_line('creating result_object indexes...');
        table_name := dbms_assert.sql_object_name(upper('result_object_swap_' || p_table_suffix));

        stmt := 'create bitmap index robject_' || p_table_suffix || '_organization on ' || table_name || '(organization) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index robject_' || p_table_suffix || '_activity on ' || table_name || '(activity) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index robject_' || p_table_suffix || '_source on ' || table_name || '(data_source) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index robject_' || p_table_suffix || '_result on ' || table_name || '(result_id) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create unique index robject_' || p_table_suffix || '_pk on ' || table_name || '(data_source_id, object_id) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

    end create_indexes;

    procedure analyze_tables(p_table_suffix in user_tables.table_name%type) is
        suffix user_tables.table_name%type;
    begin

        suffix := dbms_assert.simple_sql_name(upper(p_table_suffix));

        dbms_output.put_line('analyze result_object...');
        dbms_stats.gather_table_stats(ownname => '${dataOwner}', tabname => 'RESULT_OBJECT_SWAP_' || suffix, method_opt => 'FOR ALL INDEXED COLUMNS');

    end analyze_tables;

    function validate_transformation(p_table_suffix in user_tables.table_name%type)
        return boolean is
        end_job boolean := false;
    begin

        end_job := etl_helper_main.validate_table('result_object', 'result_object_', p_table_suffix);

        return end_job;

    end validate_transformation;

    procedure install(p_table_suffix in user_tables.table_name%type) is
        suffix user_tables.table_name%type;
    begin

        suffix := dbms_assert.simple_sql_name(p_table_suffix);

        dbms_output.put_line('result_object');
        execute immediate 'alter table result_object exchange partition result_object_' || suffix ||
                          ' with table result_object_swap_' || suffix || ' including indexes';

    end install;

end etl_helper_result_object;
