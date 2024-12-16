*&---------------------------------------------------------------------*
*& Report zgc_sorted_tables
*&---------------------------------------------------------------------*
*& Author: George Calin
*& Description: Sorted Tables in ABAP
*&---------------------------------------------------------------------*
REPORT zgc_sorted_tables.

TYPES: BEGIN OF lty_order,
         order_id(3) TYPE n,
         payment_type(1) TYPE c,
      END OF lty_order.

DATA: lt_order TYPE SORTED TABLE OF lty_order WITH UNIQUE KEY order_id,   " how to define a sorted table with  unique key
      ls_order TYPE lty_order.

DATA: lt_order_1 TYPE SORTED TABLE OF lty_order WITH NON-UNIQUE KEY order_id, " how to define a sorted table with non-unique key
      ls_order_1 TYPE lty_order.

DATA: lt_order_2 TYPE SORTED TABLE OF lty_order WITH UNIQUE KEY order_id payment_type, " how to define a sorted table with unique  keys comprised by multiple fields
      ls_order_2 TYPE lty_order.

DATA: lt_order_3 TYPE SORTED TABLE OF lty_order WITH NON-UNIQUE KEY order_id payment_type, " how to define a sorted table with non-unique keys comprised by multiple fields
      ls_order_3 TYPE lty_order.


* ****************************************************************************************************
* Sorted internal tables are automatically sorted. There is no longer need to sort them explicitly. Sorted tables are always sorted by the key fields.
* Sorted internal tables are also index based tables
* Records are added to the sorted internal tables by using the INSERT statement. The INSERT statement automatically sorts the table.
* If one would add records to the sorted internal table by using the APPEND statement, the program would crash if the data added is not sorted.
* ****************************************************************************************************

ULINE.
WRITE: / ' Working with a sorted table with unique key'.

* Working with a sorted table with unique key

ls_order-order_id = '001'.
ls_order-payment_type = 'A'.
INSERT ls_order INTO TABLE lt_order.
CLEAR ls_order.

ls_order-order_id = '002'.
ls_order-payment_type = 'B'.
INSERT ls_order INTO TABLE lt_order.
CLEAR ls_order.

ls_order-order_id = '003'.
ls_order-payment_type = 'C'.
INSERT ls_order INTO TABLE lt_order.
CLEAR ls_order.

ls_order-order_id = '004'.
ls_order-payment_type = 'D'.
INSERT ls_order INTO TABLE lt_order.
CLEAR ls_order.

ls_order-order_id = '005'.
ls_order-payment_type = 'E'.
INSERT ls_order INTO TABLE lt_order.
CLEAR ls_order.

LOOP AT lt_order INTO ls_order.
  WRITE: / ls_order-order_id, ls_order-payment_type.
ENDLOOP.

ULINE.
WRITE: / ' Working with a sorted table with non-unique key'.

* Working with a sorted table with non-unique key
ls_order_1-order_id = '001'.
ls_order_1-payment_type = 'A'.
INSERT ls_order_1 INTO TABLE lt_order_1.
CLEAR ls_order_1.

ls_order_1-order_id = '002'.
ls_order_1-payment_type = 'B'.
INSERT ls_order_1 INTO TABLE lt_order_1.
CLEAR ls_order_1.

ls_order_1-order_id = '001'.
ls_order_1-payment_type = 'C'.
INSERT ls_order_1 INTO TABLE lt_order_1.
CLEAR ls_order_1.

ls_order_1-order_id = '004'.
ls_order_1-payment_type = 'D'.
INSERT ls_order_1 INTO TABLE lt_order_1.
CLEAR ls_order_1.

ls_order_1-order_id = '005'.
ls_order_1-payment_type = 'E'.
INSERT ls_order_1 INTO TABLE lt_order_1.
CLEAR ls_order_1.

LOOP AT lt_order_1 INTO ls_order_1.
  WRITE: / ls_order_1-order_id, ls_order_1-payment_type.
ENDLOOP.


ULINE.
WRITE: / ' Working with a sorted table with unique keys comprised by multiple fields'.

* Working with a sorted table with unique keys comprised by multiple fields

ls_order_2-order_id = '001'.
ls_order_2-payment_type = 'A'.
INSERT ls_order_2 INTO TABLE lt_order_2.
CLEAR ls_order_2.

ls_order_2-order_id = '002'.
ls_order_2-payment_type = 'B'.
INSERT ls_order_2 INTO TABLE lt_order_2.
CLEAR ls_order_2.

ls_order_2-order_id = '003'.
ls_order_2-payment_type = 'C'.
INSERT ls_order_2 INTO TABLE lt_order_2.
CLEAR ls_order_2.

ls_order_2-order_id = '004'.
ls_order_2-payment_type = 'D'.
INSERT ls_order_2 INTO TABLE lt_order_2.
CLEAR ls_order_2.

ls_order_2-order_id = '005'.
ls_order_2-payment_type = 'E'.
INSERT ls_order_2 INTO TABLE lt_order_2.
CLEAR ls_order_2.

LOOP AT lt_order_2 INTO ls_order_2.
  WRITE: / ls_order_2-order_id, ls_order_2-payment_type.
ENDLOOP.


ULINE.

WRITE: / ' Working with a sorted table with non-unique keys comprised by multiple fields'.

* Working with a sorted table with non-unique keys comprised by multiple fields

ls_order_3-order_id = '001'.
ls_order_3-payment_type = 'A'.
INSERT ls_order_3 INTO TABLE lt_order_3.
CLEAR ls_order_3.

ls_order_3-order_id = '002'.
ls_order_3-payment_type = 'B'.
INSERT ls_order_3 INTO TABLE lt_order_3.
CLEAR ls_order_3.

ls_order_3-order_id = '001'.
ls_order_3-payment_type = 'C'.
INSERT ls_order_3 INTO TABLE lt_order_3.
CLEAR ls_order_3.

ls_order_3-order_id = '004'.
ls_order_3-payment_type = 'D'.
INSERT ls_order_3 INTO TABLE lt_order_3.
CLEAR ls_order_3.

ls_order_3-order_id = '005'.
ls_order_3-payment_type = 'E'.
INSERT ls_order_3 INTO TABLE lt_order_3.
CLEAR ls_order_3.

LOOP AT lt_order_3 INTO ls_order_3.
  WRITE: / ls_order_3-order_id, ls_order_3-payment_type.
ENDLOOP.

ULINE.

WRITE: / 'Adding records that are non-uniquely identified to a sorted table with unique key'.

ls_order-order_id = '001'.
ls_order-payment_type = 'A'.
INSERT ls_order INTO TABLE lt_order.
CLEAR ls_order.

ls_order-order_id = '002'.
ls_order-payment_type = 'B'.
INSERT ls_order INTO TABLE lt_order.
CLEAR ls_order.

ls_order-order_id = '001'.
ls_order-payment_type = 'C'.
INSERT ls_order INTO TABLE lt_order.   "The program will not crash, but this record will not be added to the table
CLEAR ls_order.

ls_order-order_id = '004'.
ls_order-payment_type = 'D'.
INSERT ls_order INTO TABLE lt_order.
CLEAR ls_order.

ls_order-order_id = '005'.
ls_order-payment_type = 'E'.
INSERT ls_order INTO TABLE lt_order.
CLEAR ls_order.

LOOP AT lt_order INTO ls_order.
  WRITE: / ls_order-order_id, ls_order-payment_type.
ENDLOOP.

ULINE.
WRITE: / 'How to read a record from a sorted table using the key'.


READ TABLE lt_order INTO ls_order WITH KEY order_id = '002'. " Binary search is used with sorted tables ,  there is no need to specify explicitly
IF sy-subrc = 0.
  WRITE: / ls_order-order_id, ls_order-payment_type.
ELSE.
  WRITE: / 'Record not found'.
ENDIF.

ULINE.
WRITE: / 'How to modify a record from a sorted table using the INDEX'.
READ TABLE lt_order INTO ls_order INDEX 3.
IF sy-subrc = 0.
  WRITE : / ls_order-order_id, ls_order-payment_type.
ELSE.
  WRITE: / 'Record not found'.
ENDIF.


ULINE.
WRITE: / 'Conclusion: Sorted tables are faster that standard tables, due to its use of binary search when accessing the data. Although standard tables can be sorted at ease and binary search also utilized'.
WRITE: / 'The main reason for using sorted internal tables in practical scenarios is that they will not allow duplicate data to be entered when it is deeemed so'.
