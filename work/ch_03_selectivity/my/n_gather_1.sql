begin
    DBMS_STATS.gather_table_stats('ABS','NDFL6_CERT',method_opt => 'for all columns size 1');
end;
/