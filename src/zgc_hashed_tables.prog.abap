*&---------------------------------------------------------------------*
*& Report zgc_hashed_tables
*&---------------------------------------------------------------------*
*& Author: George Calin
*& Description: This report demonstrates the use of hashed tables
*&---------------------------------------------------------------------*
REPORT zgc_hashed_tables.

TYPES: BEGIN OF lty_order,
           order_id TYPE vbeln,
           payment_type(1) TYPE c ,
       END OF lty_order.

DATA: lt_order TYPE HASHED TABLE OF lty_order WITH UNIQUE KEY order_id,
      ls_order TYPE lty_order.

ls_order-order_id = '1001'.
ls_order-payment_type = 'C'.
INSERT ls_order INTO TABLE lt_order.
CLEAR ls_order.

ls_order-order_id = '1002'.
ls_order-payment_type = 'B'.
INSERT ls_order INTO TABLE lt_order.
CLEAR ls_order.

ls_order-order_id = '1003'.
ls_order-payment_type = 'C'.
INSERT ls_order INTO TABLE lt_order.
CLEAR ls_order.

ls_order-order_id = '1004'.
ls_order-payment_type = 'C'.
INSERT ls_order INTO TABLE lt_order.
CLEAR ls_order.

LOOP AT lt_order INTO ls_order.
  WRITE: / ls_order-order_id, ls_order-payment_type.
ENDLOOP.

* NOTES: The use of the SORT statement doesn not have any effect on the hashed table because the records in the hashed table are only accessed by the hash algorithm and not by any index.
* The performance of the hashed tables is not depending upon the size of the table, as the records are accessed by the hash algorithm and not by any index.

* If a record is being added the second time, then it will be ignored that time. Only the 1st time will remain.


* How to read a record from the hashed table. This works only with the 'WITH KEY' addition, as there is no index to read the record.
READ TABLE lt_order INTO ls_order WITH KEY order_id = '1003'.
IF sy-subrc = 0.
  WRITE: / 'Record found:', ls_order-order_id, ls_order-payment_type.
ELSE.
  WRITE: / 'Record not found'.
ENDIF.
