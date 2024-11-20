@env
set autotrace traceonly exp

select count(*) from ndfl6_cert where tyear > 2023
/

select count(*) from ndfl6_cert where tyear between 2020 and 2021
/


set autotrace off