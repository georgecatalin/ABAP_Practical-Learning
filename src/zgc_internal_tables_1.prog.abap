*&---------------------------------------------------------------------*
*& Report zgc_internal_tables_1
*&---------------------------------------------------------------------*
*& Author: George Calin
*& Description: Internal tables in ABAP
*&---------------------------------------------------------------------*
REPORT zgc_internal_tables_1.

TYPES: BEGIN OF lty_data,
        order_number TYPE ZDEONUMBER,
        payment_method TYPE ZDEPAYM,
       END OF lty_data.

DATA: lt_data TYPE TABLE OF lty_data, " internal table
      ls_data TYPE lty_data. " work area



* Populate the internal table
ls_data-order_number = '1'.
ls_data-payment_method = 'C'.
APPEND ls_data TO lt_data.
CLEAR ls_data. " it is a good practice to reset the content of the work area after each use

ls_data-order_number = '1'.
ls_data-payment_method = 'N'.
APPEND ls_data TO lt_data.
CLEAR ls_data.

ls_data-order_number = '2'.
ls_data-payment_method = 'D'.
APPEND ls_data TO lt_data.
CLEAR ls_data.

ls_data-order_number = '3'.
ls_data-payment_method = 'C'.
APPEND ls_data TO lt_data.
CLEAR ls_data.

ls_data-order_number = '4'.
ls_data-payment_method = 'N'.
APPEND ls_data TO lt_data.
CLEAR ls_data.

* Display the internal table
LOOP AT lt_data INTO ls_data.
  WRITE: / ls_data-order_number, ls_data-payment_method.
ENDLOOP.

* Delete from the internal table
DELETE lt_data WHERE order_number = '2'.
DELETE lt_data INDEX 2. " Delete by index number . Index starts from 1 in ABAP internal tables

* Modify from the internal table
LOOP AT lt_data INTO ls_data.
    IF ls_data-order_number = '1'.
        ls_data-payment_method = 'N'.
        MODIFY lt_DATA FROM ls_data TRANSPORTING payment_method. "never forget to specify which columns to modify by using TRANSPORTING keyword
    ENDIF.
ENDLOOP.


* READ from an internal tables: returns only the first match

READ TABLE lt_data INTO ls_data INDEX 2.
IF sy-subrc = 0.
    WRITE: / ls_data-order_number, ls_data-payment_method.
ENDIF.

READ TABLE lt_data INTO ls_data WITH KEY payment_method = 'N'.
IF sy-subrc = 0.
    WRITE: / ls_data-order_number, ls_data-payment_method.
ELSE.
    WRITE: / 'Unsuccessful attempt.'.
ENDIF.

* CLEAR and REFRESH clear the internal table
CLEAR lt_data.
REFRESH lt_data.

* DESCRIBE Table LINES nolines -> returns the number of lines of the internal table in the variable nolines
DATA lv_lines TYPE i.
DESCRIBE TABLE lt_data LINES lv_lines.
WRITE: / 'The table has ', lv_lines, ' records now.'.

* SORT thistable BY column DESCENDING
SORT lt_data BY order_number. " when the type of sorting is not specified, it is considered by default ASCENDING.
SORT lt_data BY order_number DESCENDING.

SORT lt_data BY order_number payment_method DESCENDING. " This sorts by order_number ASCENDING because it is not specified, hence considered ASCENDING, then subsorts by payment_method DESCENDING
SORT lt_data BY order_number DESCENDING payment_method DESCENDING. " This sorts by order number DESCENDING, then subsorts by payment method DESCENDING
