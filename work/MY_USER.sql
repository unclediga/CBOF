CREATE USER test_user IDENTIFIED BY test_user TABLESPACE USER;
GRANT CONNECT, RESOURCE TO test_user;
GRANT CREATE VIEW TO test_user;
grant ANALYZE ANY DICTIONARY to test_user;
grant ANALYZE ANY to test_user;
Grant SELECT ANY TABLE to test_user;

-- SYS
--CREATE PUBLIC SYNONYM dbms_stats for SYS.Dbms_Stats;
GRANT EXECUTE ON dbms_stats TO test_user;

CREATE PUBLIC SYNONYM dbms_stats for SYS.Dbms_Stats;
GRANT EXECUTE ON dbms_stats TO test_user;

-- Чтобы пароль не заставлял менять

ALTER PROFILE DEFAULT LIMIT 
     failed_login_attempts UNLIMITED
     password_life_time UNLIMITED;

-- https://blogs.oracle.com/sql/post/how-to-fix-ora-28002-the-password-will-expire-in-7-days-errors
-- reset password_grace_time
ALTER USER test_user IDENTIFIED BY test_user;



--Из книжки \CBOF\work\c_ts_test.sql --------------

alter user test_user quota unlimited on test_2k;
alter user test_user quota unlimited on test_4k;
alter user test_user quota unlimited on test_8k;
alter user test_user quota unlimited on test_8_assm; -- ERROR :(
alter user test_user quota unlimited on test_16k;

alter user test_user default tablespace test_8k;
---------------------------------------------

