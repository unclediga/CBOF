create or replace function NDFL6_value_to_number(i_raw in raw)
return number deterministic as
	m_n		number(6);
begin
	dbms_stats.convert_raw_value(i_raw,m_n);
	return m_n;
end;
.
/
