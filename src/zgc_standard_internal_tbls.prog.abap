*&---------------------------------------------------------------------*
*& Report zgc_standard_internal_tbls
*&---------------------------------------------------------------------*
*& Author: George Calin
*& Description: This report will show you the standard internal tables and the operations that can be performed on them.
*&---------------------------------------------------------------------*
REPORT zgc_standard_internal_tbls.

TYPES: BEGIN OF lty_data,
         orderid TYPE ZGCDEONO_1,
         payment_mode(1) TYPE c,
         total_amount TYPE p DECIMALS 2,
       END OF lty_data.


DATA: lt_data TYPE TABLE OF lty_data,
      ls_data TYPE lty_data.

* Fill the internal table using the APPEND statement
ls_data-orderid = '1001'.
ls_data-payment_mode = 'C'.
ls_data-total_amount = '100.56'.
APPEND ls_data TO lt_data.
CLEAR ls_data. " Clear the work area as a good practice

ls_data-orderid = '1002'.
ls_data-payment_mode = 'D'.
ls_data-total_amount = '200.78'.
APPEND ls_data TO lt_data.
CLEAR ls_data.

ls_data-orderid = '1003'.
ls_data-payment_mode = 'N'.
ls_data-total_amount = '300.90'.
APPEND ls_data TO lt_data.
CLEAR ls_data.

ls_data-orderid = '1004'.
ls_data-payment_mode = 'C'.
ls_data-total_amount = '400.12'.
APPEND ls_data TO lt_data.
CLEAR ls_data.

ls_data-orderid = '1005'.
ls_data-payment_mode = 'D'.
ls_data-total_amount = '500.34'.
APPEND ls_data TO lt_data.
CLEAR ls_data.

* insert the data into the internal table using the INSERT statement

ls_data-orderid = '1006'.
ls_data-payment_mode = 'N'.
ls_data-total_amount = '600.56'.
INSERT ls_data INTO TABLE lt_data.
CLEAR ls_data.

ls_data-orderid = '1007'.
ls_data-payment_mode = 'C'.
ls_data-total_amount = '700.78'.
INSERT ls_data INTO TABLE lt_data.
CLEAR ls_data.

* INSERT the data at a specific position
ls_data-orderid = '1008'.
ls_data-payment_mode = 'D'.
ls_data-total_amount = '800.90'.
INSERT ls_data INTO lt_data INDEX 3.
CLEAR ls_data.


* Display the data in the internal table
LOOP AT lt_data INTO ls_data.
  WRITE: / ls_data-orderid, ls_data-payment_mode, ls_data-total_amount.
ENDLOOP.

ULINE.

* READ the data from the internal table at index 3
READ TABLE lt_data INTO ls_data INDEX 3.
IF sy-subrc = 0.
    WRITE: / 'Data at index 3: ', ls_data-orderid, ls_data-payment_mode, ls_data-total_amount.
ELSE.
    WRITE: / 'Data not found at index 3'.
ENDIF.

ULINE.
* READ the data from the internal table with key
READ TABLE lt_data INTO ls_data WITH KEY orderid = '1005'.
IF sy-subrc = 0.
    WRITE: / 'Data with key 1005: ', ls_data-orderid, ls_data-payment_mode, ls_data-total_amount.
ELSE.
    WRITE: / 'Data not found with key 1005'.
ENDIF.

ULINE.
* MODIFY the data in the internal table
MODIFY lt_data FROM ls_data INDEX 3.
IF sy-subrc = 0.
 WRITE: / 'Data at index 3 modified: ', ls_data-orderid, ls_data-payment_mode, ls_data-total_amount.
ELSE.
  WRITE: / 'Data not found at index 3'.
ENDIF.

ULINE.
* Modify the data in the internal table based on value
 ls_data-orderid = '1006'.
 ls_data-payment_mode = 'F'.
 ls_data-total_amount = '900.90'.
 MODIFY lt_data FROM ls_data TRANSPORTING payment_mode WHERE orderid = '1006'.
IF sy-subrc = 0.
  WRITE: / 'Data with key 1006 modified: ', ls_data-orderid, ls_data-payment_mode, ls_data-total_amount.
ELSE.
  WRITE: / 'Data not found with key 1006'.
ENDIF.

ULINE.
* DELETE the data from the internal table
DELETE lt_data INDEX 3.
IF sy-subrc = 0.
  WRITE: / 'Data at index 3 deleted'.
ELSE.
  WRITE: / 'Data not found at index 3'.
ENDIF.

ULINE.
* DELETE the data from the internal table with key
DELETE lt_data WHERE orderid = '1007'.
IF sy-subrc = 0.
  WRITE: / 'Data with key 1007 deleted'.
ELSE.
  WRITE: / 'Data not found with key 1007'.
ENDIF.
ULINE.

* sort the data in the internal table
SORT lt_data BY orderid.
LOOP AT lt_data INTO ls_data.
  WRITE: / ls_data-orderid, ls_data-payment_mode, ls_data-total_amount.
ENDLOOP.


* Response time of the internal table depends upon the number of records in the internal table. It can be dramatically reduced by using the SORT statement and binary search.
* Search can be performed in internal tables using both, linear( sequential) search and binary search , but this requires the internal table to be sorted at first

* How to use binary search with an internal table

SORT lt_data by orderid.
READ TABLE lt_data into ls_data WITH KEY orderid = '1006' BINARY SEARCH.
