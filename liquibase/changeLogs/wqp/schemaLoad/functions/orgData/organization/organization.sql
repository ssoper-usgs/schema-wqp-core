create or replace function build_org_data_organization_index(wqp_data_source character varying, schema_name character varying)
returns void
language plpgsql
as $$
begin
	execute 'create index if not exists ' || quote_ident('org_data_swap_' || wqp_data_source || '_organization')
		|| ' on ' || quote_ident(schema_name) || '.' || quote_ident('org_data_swap_' || wqp_data_source) || '(organization) with (fillfactor = 100)';
end
$$
