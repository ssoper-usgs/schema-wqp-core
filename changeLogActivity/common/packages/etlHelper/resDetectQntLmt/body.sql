create or replace package body etl_helper_res_detect_qnt_lmt as

    procedure drop_indexes(p_table_suffix in user_tables.table_name%type) is
        table_name user_tables.table_name%type;
    begin

        table_name := dbms_assert.sql_object_name(upper('res_detect_qnt_lmt_swap_' || p_table_suffix));
        etl_helper_main.drop_indexes(table_name);	

    end drop_indexes;

    procedure create_indexes(p_table_suffix in user_tables.table_name%type) is
        stmt            varchar2(32000);
        table_name      user_tables.table_name%type;
    begin

        dbms_output.put_line('creating res_detect_qnt_lmt indexes...');
        table_name := dbms_assert.sql_object_name(upper('res_detect_qnt_lmt_swap_' || p_table_suffix));

        stmt := 'create bitmap index rdql_' || p_table_suffix || '_activity on ' || table_name || '(activity) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rdql_' || p_table_suffix || '_analytical on ' || table_name || '(analytical_method) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rdql_' || p_table_suffix || '_assemblage on ' || table_name || '(assemblage_sampled_name) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rdql_' || p_table_suffix || '_char_name on ' || table_name || '(characteristic_name) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rdql_' || p_table_suffix || '_char_type on ' || table_name || '(characteristic_type) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rdql_' || p_table_suffix || '_country on ' || table_name || '(country_code) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rdql_' || p_table_suffix || '_county on ' || table_name || '(county_code) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rdql_' || p_table_suffix || '_event_date on ' || table_name || '(event_date) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rdql_' || p_table_suffix || '_huc10 on ' || table_name || '(huc_10) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rdql_' || p_table_suffix || '_huc12 on ' || table_name || '(huc_12) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rdql_' || p_table_suffix || '_huc2 on ' || table_name || '(huc_2) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rdql_' || p_table_suffix || '_huc4 on ' || table_name || '(huc_4) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rdql_' || p_table_suffix || '_huc6 on ' || table_name || '(huc_6) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rdql_' || p_table_suffix || '_huc8 on ' || table_name || '(huc_8) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rdql_' || p_table_suffix || '_organization on ' || table_name || '(organization) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rdql_' || p_table_suffix || '_p_code on ' || table_name || '(p_code) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rdql_' || p_table_suffix || '_project on ' || table_name || '(project_id) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rdql_' || p_table_suffix || '_result on ' || table_name || '(result_id) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rdql_' || p_table_suffix || '_sample_media on ' || table_name || '(sample_media) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rdql_' || p_table_suffix || '_site on ' || table_name || '(site_id) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rdql_' || p_table_suffix || '_site_type on ' || table_name || '(site_type) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rdql_' || p_table_suffix || '_state on ' || table_name || '(state_code) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rdql_' || p_table_suffix || '_station on ' || table_name || '(station_id) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index rdql_' || p_table_suffix || '_taxa_name on ' || table_name || '(sample_tissue_taxonomic_name) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

    end create_indexes;

    procedure analyze_tables(p_table_suffix in user_tables.table_name%type) is
        suffix user_tables.table_name%type;
    begin

        suffix := dbms_assert.simple_sql_name(upper(p_table_suffix));

        dbms_output.put_line('analyze res_detect_qnt_lmt...');
        dbms_stats.gather_table_stats(ownname => 'WQP_CORE', tabname => 'RES_DETECT_QNT_LMT_SWAP_' || suffix, method_opt => 'FOR ALL INDEXED COLUMNS');

    end analyze_tables;

    function validate_transformation(p_table_suffix in user_tables.table_name%type)
        return boolean is
        end_job     boolean := false;
    begin

        end_job := etl_helper_main.validate_table('result', 'result_', p_table_suffix);

        return end_job;

    end validate_transformation;

    procedure install(p_table_suffix in user_tables.table_name%type) is
        suffix user_tables.table_name%type;
    begin

        suffix := dbms_assert.simple_sql_name(p_table_suffix);

        dbms_output.put_line('result');
        execute immediate 'alter table res_detect_qnt_lmt exchange partition res_detect_qnt_lmt_' || suffix ||
                          ' with table res_detect_qnt_lmt_swap_' || suffix || ' including indexes';

    end install;

end etl_helper_res_detect_qnt_lmt;
