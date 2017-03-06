create or replace package pkg_dynamic_list as
	function get_table (p_char in typ_vctbl)
		return typ_vctbl pipelined;
	function url_escape (url in varchar2, escape_reserved in varchar2)
		return varchar2;
end pkg_dynamic_list;
