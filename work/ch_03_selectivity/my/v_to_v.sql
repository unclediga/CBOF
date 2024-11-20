create or replace function value_to_varchar(i_raw in raw)
return varchar2 deterministic as
	m_n		VARCHAR2(100);
begin
	dbms_stats.convert_raw_value(i_raw,m_n);
	return m_n;
end;
.
/
