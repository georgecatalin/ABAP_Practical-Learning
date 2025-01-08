*&---------------------------------------------------------------------*
*& Report zgc_interactive_rpt
*&---------------------------------------------------------------------*
*& Author: George Calin
*& Date: 2025-06-01
*&---------------------------------------------------------------------*
REPORT zgc_interactive_rpt.

TYPES: BEGIN OF lty_data,
        ordernumber TYPE zgcdeono_1,
        orderdate TYPE zgcdeodate_1,
        paymentmode TYPE zgcdepaym_1,
        currency TYPE zgcdecurr_1,
       END OF lty_data.

DATA: lt_data TYPE TABLE OF lty_data,
      ls_data TYPE lty_data.

TYPES: BEGIN OF lty_data1,
         ordernumber TYPE zgcdeono_1,
         orderitemnumber TYPE zgcdeoitmno_1,
         itemdescription TYPE zgcdeodesc_1,
         itemcost TYPE zgcdeoicost_1,
       END OF lty_data1.

DATA: lt_data1 TYPE TABLE OF lty_data1,
      ls_data1 TYPE lty_data1.

DATA: lv_order TYPE zgcdeono_1.

SELECT-OPTIONS: s_order  FOR lv_order.


START-OF-SELECTION.

  SELECT ordernumber, orderdate, paymentmode, currency FROM zgcorderh_1 INTO TABLE @lt_data
   WHERE ordernumber IN @s_order.

  LOOP AT lt_data INTO ls_data.
    WRITE: / |{ ls_data-ordernumber ALPHA = OUT }|, ls_data-orderdate, ls_data-paymentmode, ls_data-currency.
  " use the following line in case you use saving the lines in the HIDE memory area
    HIDE:  ls_data-ordernumber, ls_data-orderdate, ls_data-paymentmode, ls_data-currency.
" *********************************
  ENDLOOP.

 AT LINE-SELECTION.

* SELECT ordernumber, orderitemnumber, itemdescription, itemcost FROM zgcorderi_1 INTO TABLE @lt_data1
*   WHERE ordernumber = @sy-lisel+0(13).

SELECT ordernumber, orderitemnumber, itemdescription, itemcost FROM zgcorderi_1 INTO TABLE @lt_data1
WHERE ordernumber = @ls_data-ordernumber.

  LOOP AT lt_data1 INTO ls_data1.
    WRITE: / |{ ls_data1-ordernumber ALPHA = OUT }|, ls_data1-orderitemnumber, ls_data1-itemdescription, ls_data1-itemcost.
  ENDLOOP.
