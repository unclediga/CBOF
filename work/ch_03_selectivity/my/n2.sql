PROMPT user_tab_col_statistics 

select NUM_DISTINCT,
NDFL6_value_to_number(LOW_VALUE) LOW_VALUE,
NDFL6_value_to_number(HIGH_VALUE) HIGH_VALUE,
DENSITY,
NUM_NULLS from user_tab_col_statistics
 where table_name = 'NDFL6_CERT' and COLUMN_NAME='TYEAR'
/

PROMPT user_tab_columns

select NUM_DISTINCT,
NDFL6_value_to_number(LOW_VALUE) LOW_VALUE,
NDFL6_value_to_number(HIGH_VALUE) HIGH_VALUE,
DENSITY,
NUM_NULLS from user_tab_columns
 where table_name = 'NDFL6_CERT' and COLUMN_NAME='TYEAR'
/
