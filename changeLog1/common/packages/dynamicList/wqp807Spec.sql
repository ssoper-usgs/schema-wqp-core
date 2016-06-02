create or replace package pkg_dynamic_list as
	function get_table (p_char in typ_vctbl)
		return typ_vctbl pipelined;
end pkg_dynamic_list;
