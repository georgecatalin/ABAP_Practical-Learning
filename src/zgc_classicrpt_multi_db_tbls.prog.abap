*&---------------------------------------------------------------------*
*& Report zgc_classicrpt_multi_db_tbls
*&---------------------------------------------------------------------*
*& Author: George Calin
*& Description: This report demonstrates how to create a classic report with data from multiple database tables (independent table -header and dependent table-item)
*&---------------------------------------------------------------------*
REPORT zgc_classicrpt_multi_db_tbls.


DATA: lv_ono TYPE zgcdeono_1.
SELECT-OPTIONS: s_ono FOR lv_ono OBLIGATORY.


TYPES: BEGIN OF lty_header,
         ordernumber TYPE zgcdeono_1, " order number
         orderdate   TYPE zgcdeodate_1,  " order date
         paymentmode TYPE zgcdepaym_1,   " payment mode
         currency    TYPE zgcdecurr_1,  " currency
       END OF lty_header.


DATA: lt_header TYPE TABLE OF lty_header,
      ls_header TYPE lty_header.

TYPES: BEGIN OF lty_item,
         ordernumber     TYPE zgcdeono_1, " order number
         orderitemnumber TYPE zgcdeoitmno_1,  " order item number
         itemcost        TYPE zgcdeoicost_1, " item cost
       END OF lty_item.

DATA: lt_item TYPE TABLE OF lty_item,
      ls_item TYPE lty_item.


TYPES: BEGIN OF lty_complete,
         ordernumber     TYPE zgcdeono_1, " order number
         orderdate       TYPE zgcdeodate_1,  " order date
         paymentmode     TYPE zgcdepaym_1,   " payment mode
         currency        TYPE zgcdecurr_1,  " currency
         orderitemnumber TYPE zgcdeoitmno_1,  " order item number
         itemcost        TYPE zgcdeoicost_1, " item cost
       END OF lty_complete.

DATA: lt_complete TYPE TABLE OF lty_complete,
      ls_complete TYPE lty_complete.


START-OF-SELECTION.

  SELECT ordernumber, orderdate, paymentmode, currency
    INTO TABLE @lt_header
    FROM zgcorderh_1
    WHERE ordernumber IN @s_ono.

* There are two possibilities to check the success of the SELECT statement:
* 1. Check IF sy-subrc = 0
* 2. Check the number of lines in the internal table IF lt_header IS NOT INITIAL

  IF lt_header IS NOT INITIAL.
    SELECT ordernumber, orderitemnumber, itemcost
      INTO TABLE @lt_item
      FROM zgcorderi_1
      FOR ALL ENTRIES IN @lt_header
      WHERE ordernumber = @lt_header-ordernumber.
  ENDIF.


* Fill in the lt_complete internal tables that contains all the data in the application layer which will be sent to the screen in the presentation layer

  LOOP AT lt_header INTO ls_header.
    LOOP AT lt_item INTO ls_item WHERE ordernumber = ls_header-ordernumber.
      ls_complete-ordernumber = ls_header-ordernumber.
      ls_complete-orderdate = ls_header-orderdate.
      ls_complete-paymentmode = ls_header-paymentmode.
      ls_complete-currency = ls_header-currency.
      ls_complete-orderitemnumber = ls_item-orderitemnumber.
      ls_complete-itemcost = ls_item-itemcost.
      APPEND ls_complete TO lt_complete.
      CLEAR ls_complete.
    ENDLOOP.
  ENDLOOP.


* Display data on the screen (presentation layer)
  LOOP AT lt_complete INTO ls_complete.
    WRITE: / |{ ls_complete-ordernumber ALPHA = OUT }|, ls_complete-orderdate, ls_complete-paymentmode ,  ls_complete-currency, ls_complete-orderitemnumber ,  ls_complete-itemcost.
  ENDLOOP.

* note: the ALPHA = OUT is used to display the order number without leading zeros in the output screen
* by default, WRITE only display 9 characters from the ordernumber, but we need all of 13 characters to be displayed to identify the order number correctly
