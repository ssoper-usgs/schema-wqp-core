create or replace package body pkg_dynamic_list as
	function get_table (p_char in typ_vctbl)
		return typ_vctbl pipelined is
	begin
		for i in 1..p_char.count loop
			pipe row (p_char (i));
		end loop;

		return;
	end get_table;

	function url_escape (url in character varying , escape_reserved in character varying )
		return character varying  is
	begin
		return utl_url.escape(url, (upper(escape_reserved) = 'TRUE'));
	end url_escape;

end pkg_dynamic_list;
