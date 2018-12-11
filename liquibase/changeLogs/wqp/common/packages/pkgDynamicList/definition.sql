create or replace package pkg_dynamic_list as
	function get_table (p_char in typ_vctbl)
		return typ_vctbl pipelined;

	function url_escape (url in character varying , escape_reserved in character varying )
		return character varying ;
end pkg_dynamic_list;
