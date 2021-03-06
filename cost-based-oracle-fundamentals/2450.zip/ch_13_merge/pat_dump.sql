rem
rem	Script:		pat_dump.sql
rem	Author:		Jonathan Lewis
rem	Dated:		Sep 2004
rem	Purpose:	Example for "Cost Based Oracle"
rem
rem	Last tested:
rem		10.1.0.4
rem		 9.2.0.6
rem	Not relevant to
rem		 8.1.7.4
rem
rem	Called from a script generated by either
rem	pat_nocpu_dump.sql or pat_cpu_dump.sql
rem
rem	Uses the data set generated by sort_demo_01.sql
rem

alter session set events '10053 trace name context forever, level 2';
alter session set events '10032 trace name context forever';
alter session set events '10033 trace name context forever';

alter system set pga_aggregate_target = &2 scope = memory;
alter session set tracefile_identifier = 'pat_&1._&2';

select
	/*+ pga_aggregate_target &2 */
	sortcode
from
	(select * from t1 where rownum <= 300000)
--	(select * from t1 where rownum <= 65536)
order by
	sortcode
;

alter session set events '10053 trace name context off';
alter session set events '10032 trace name context off';
alter session set events '10033 trace name context off';
