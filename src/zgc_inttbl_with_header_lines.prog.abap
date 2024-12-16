*&---------------------------------------------------------------------*
*& Report zgc_inttbl_with_header_lines
*&---------------------------------------------------------------------*
*& Author: George Calin
*& Description: Internal table with header lines (obsolete as of now )
*&---------------------------------------------------------------------*
REPORT zgc_inttbl_with_header_lines.

TYPES: BEGIN OF lty_order,
        order_id TYPE vbeln,
        payment_type(1) TYPE c,
       END OF lty_order.


DATA: lt_order TYPE TABLE OF lty_order WITH HEADER LINE. "obsolete

* **********************************************************************
* An internal table with header line contains an implicit( internal ) work area which can be used as it is without the need to declare a separate work area.
* The name of the work area is the same as the name of the internal table.
* **********************************************************************

lt_order-order_id = '1001'.
lt_order-payment_type = 'C'.
APPEND lt_order.
CLEAR lt_order. " clears the work area

lt_order-order_id = '1002'.
lt_order-payment_type = 'A'.
APPEND lt_order.
CLEAR lt_order.

lt_order-order_id = '1003'.
lt_order-payment_type = 'B'.
APPEND lt_order.

WRITE:/ 'The internal table has been populated'.

LOOP AT lt_order.
  WRITE:/ lt_order-order_id, lt_order-payment_type.
ENDLOOP.

CLEAR lt_order[]. " clears the internal table

WRITE:/ 'The internal table has been cleared'.

LOOP AT lt_order.
  WRITE:/ lt_order-order_id, lt_order-payment_type.
ENDLOOP.

* **********************************************************************
* We learn the concept of internal tables with header line for the sake of understanding old ABAP code where this was utilized.
* **********************************************************************
