rem
rem	Script:		sas_nocpu_harness.sql
rem	Author:		Jonathan Lewis
rem	Dated:		Sep 2004
rem	Purpose:	Example for "Cost Based Oracle"
rem
rem	Last tested:
rem		10.1.0.4
rem		 9.2.0.6
rem		 8.1.7.4
rem
rem	Harness to generate string of calls to the 
rem	sas_dump.sql script, after setting up for the 
rem	old-style costing (no cpu, using sort_area_size)
rem
rem	Uses the data set generated by sort_demo_01.sql
rem

start setenv

set pagesize 0
set feedback off

begin
	begin		execute immediate 'purge recyclebin';
	exception	when others then null;
	end;

	begin		execute immediate 'begin dbms_stats.delete_system_stats; end;';
	exception 	when others then null;
	end;

	begin		execute immediate 'alter session set "_optimizer_cost_model"=io';
	exception	when others then null;
	end;

	begin		execute immediate 'alter session set workarea_size_policy = manual';
	exception	when others then null;
	end;
end;
/

alter system flush shared_pool;

spool temp1.sql

prompt	set termout off

select
	'start sas_dump nocpu ' || lpad(65536 * rownum ,10,'0')
from 
	all_objects
where
	rownum = 1
--	rownum <= 20
--	rownum <= 512
;

spool off

accept x prompt 'Press return to execute script temp1.sql - or press ctrl-C'

start temp1


