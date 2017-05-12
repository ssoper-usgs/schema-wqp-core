create or replace package body etl_helper_station as

    procedure drop_indexes(p_table_suffix in user_tables.table_name%type) is
        table_name user_tables.table_name%type;
    begin

        table_name := dbms_assert.sql_object_name(upper('station_swap_' || p_table_suffix));
        etl_helper_main.drop_indexes(table_name);

    end drop_indexes;

    procedure create_indexes(p_table_suffix in user_tables.table_name%type) is
        stmt            varchar2(32000);
        table_name      user_tables.table_name%type;
    begin

        dbms_output.put_line('creating station indexes...');
        table_name := dbms_assert.sql_object_name(upper('station_swap_' || p_table_suffix));

        stmt := 'create bitmap index s_' || p_table_suffix || '_country on ' || table_name || '(country_code) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index s_' || p_table_suffix || '_county on ' || table_name || '(county_code) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create index s_' || p_table_suffix || '_geom on ' || table_name || q'!(geom) indextype is mdsys.spatial_index parameters ('SDO_INDX_DIMS=2 LAYER_GTYPE="POINT"')!';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index s_' || p_table_suffix || '_huc10 on ' || table_name || '(huc_10) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index s_' || p_table_suffix || '_huc12 on ' || table_name || '(huc_12) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index s_' || p_table_suffix || '_huc2 on ' || table_name || '(huc_2) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index s_' || p_table_suffix || '_huc4 on ' || table_name || '(huc_4) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index s_' || p_table_suffix || '_huc6 on ' || table_name || '(huc_6) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index s_' || p_table_suffix || '_huc8 on ' || table_name || '(huc_8) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index s_' || p_table_suffix || '_organization on ' || table_name || '(organization) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create unique index s_' || p_table_suffix || '_pk on ' || table_name || '(data_source_id, station_id) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index s_' || p_table_suffix || '_site on ' || table_name || '(site_id) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index s_' || p_table_suffix || '_site_type on ' || table_name || '(site_type) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index s_' || p_table_suffix || '_state on ' || table_name || '(state_code) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

        stmt := 'create bitmap index s_' || p_table_suffix || '_station on ' || table_name || '(station_id) parallel 4 nologging';
        dbms_output.put_line(stmt);
        execute immediate stmt;

    end create_indexes;

    procedure analyze_tables(p_table_suffix in user_tables.table_name%type) is
        suffix user_tables.table_name%type;
    begin

        suffix := dbms_assert.simple_sql_name(upper(p_table_suffix));

        dbms_output.put_line('analyze station...');
        dbms_stats.gather_table_stats(ownname => '${dataOwner}', tabname => 'STATION_SWAP_' || suffix, method_opt => 'FOR ALL INDEXED COLUMNS');

    end analyze_tables;

    function validate_transformation(p_table_suffix in user_tables.table_name%type)
        return boolean is
        end_job boolean := false;
    begin

        end_job := etl_helper_main.validate_table('station', 'station_', p_table_suffix);

        return end_job;

    end validate_transformation;

    procedure install(p_table_suffix in user_tables.table_name%type) is
        suffix user_tables.table_name%type;
    begin

        suffix := dbms_assert.simple_sql_name(p_table_suffix);

        dbms_output.put_line('station');
        execute immediate 'alter table station exchange partition station_' || suffix ||
                          ' with table station_swap_' || suffix || ' including indexes';

    end install;

end etl_helper_station;
