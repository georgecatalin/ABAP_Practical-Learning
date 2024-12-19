*&---------------------------------------------------------------------*
*& Report zgc_classicrpt_innerjoin
*&---------------------------------------------------------------------*
*& Author: George Calin
*& Description: Classic Report with INNER JOIN
*&---------------------------------------------------------------------*
REPORT zgc_classicrpt_innerjoin.

DATA: lv_ono TYPE zgcdeono_1.
SELECT-OPTIONS: s_ono FOR lv_ono.

TYPES: BEGIN OF lty_final,
         ordernumber     TYPE zgcdeono_1,
         orderdate       TYPE zgcdeodate_1,
         paymentmode     TYPE zgcdepaym_1,
         currency        TYPE zgcdecurr_1,
         orderitemnumber TYPE zgcdeoitmno_1,
         itemcost        TYPE zgcdeoicost_1,
       END OF lty_final.

DATA: lt_final TYPE TABLE OF lty_final,
      ls_final TYPE lty_final.

START-OF-SELECTION.

* We use SQL JOINS when working with HANA databases, for performance reasons, but also for the sake of simplicity.
* For native other databases, we can use the ABAP Open SQL with FOR ALL ENTRIES IN clause, to avoid multiple table loads

  SELECT header~ordernumber, header~orderdate, header~paymentmode, header~currency, item~orderitemnumber, item~itemcost
    FROM zgcorderh_1 AS header
    INNER JOIN zgcorderi_1 AS item ON header~ordernumber = item~ordernumber
    INTO TABLE @lt_final
    WHERE header~ordernumber IN @s_ono.

WRITE: / 'Order Number', 14 'Order Date', 26 'Payment Mode', 40 'Currency', 50 'Order Item Number',  60 'Item Cost'.

  LOOP AT lt_final INTO ls_final.
    WRITE: / |{ ls_final-ordernumber ALPHA = OUT }| UNDER 'Order Number', ls_final-orderdate UNDER 'Order Date' , ls_final-paymentmode UNDER 'Payment Mode',
         ls_final-currency UNDER 'Currency', ls_final-orderitemnumber UNDER 'Order Item Number', ls_final-itemcost UNDER 'Item Cost'.
  ENDLOOP.
