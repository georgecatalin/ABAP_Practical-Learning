*&---------------------------------------------------------------------*
*& Report zgc_internal_tables_collect
*&---------------------------------------------------------------------*
*& Author: George Calin
*& Description: Use of COLLECT to sum up numeric field values associated with unique character-field values
*&---------------------------------------------------------------------*
REPORT zgc_internal_tables_collect.


TYPES: BEGIN OF lty_data,
        company_name(3) TYPE c,
        department(2) TYPE c,
        amount_expense TYPE p DECIMALS 2,
       END OF lty_data.

DATA: lt_data TYPE TABLE OF lty_data,
      ls_data TYPE lty_data.

DATA: lt_temp_data TYPE TABLE OF lty_data.


ls_data-company_name = 'ABC'.
ls_data-department = 'HR'.
ls_data-amount_expense = '1000.23'.
APPEND ls_data TO lt_data.
CLEAR ls_data.

ls_data-company_name = 'ABC'.
ls_data-department = 'LG'.
ls_data-amount_expense = '5000.67'.
APPEND ls_data TO lt_data.
CLEAR ls_data.

ls_data-company_name = 'ABC'.
ls_data-department = 'HR'.
ls_data-amount_expense = '2000.8'.
APPEND ls_data TO lt_data.
CLEAR ls_data.

ls_data-company_name = 'ABC'.
ls_data-department = 'EN'.
ls_data-amount_expense = '3000.81'.
APPEND ls_data TO lt_data.
CLEAR ls_data.

ls_data-company_name = 'ABC'.
ls_data-department = 'LG'.
ls_data-amount_expense = '2000.3'.
APPEND ls_data TO lt_data.
CLEAR ls_data.

ls_data-company_name = 'ACD'.
ls_data-department = 'EN'.
ls_data-amount_expense = '3000.81'.
APPEND ls_data TO lt_data.
CLEAR ls_data.

ULINE.
WRITE: / 'The big non-unique values table is '.



LOOP AT lt_data INTO ls_data.
    WRITE: / ls_data-company_name , '|', ls_data-department, '|', ls_data-amount_expense.
    COLLECT ls_data INTO lt_temp_data. " at all times use a different internal table based on the same structure to collect the records by unique values
ENDLOOP.


WRITE: / 'The collector-unique values table is '.

LOOP AT lt_temp_data INTO ls_data.
    WRITE: / ls_data-company_name , '|', ls_data-department, '|', ls_data-amount_expense.
ENDLOOP.
