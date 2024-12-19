*&---------------------------------------------------------------------*
*& Report zgc_classicrpt_innerjoin
*&---------------------------------------------------------------------*
*& Author: George Calin
*& Description: Classic Report with INNER JOIN
*&---------------------------------------------------------------------*
REPORT zgc_clsrpt_innerjoin_txtsym.

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

WRITE: / text-000 , 14  text-001 , 26 text-002 , 40 text-003 , 50 text-003 ,  60 TEXT-004 .

  LOOP AT lt_final INTO ls_final.
    WRITE: / |{ ls_final-ordernumber ALPHA = OUT }| UNDER text-000, ls_final-orderdate UNDER text-001 , ls_final-paymentmode UNDER text-002,
         ls_final-currency UNDER text-003, ls_final-orderitemnumber UNDER text-004, ls_final-itemcost UNDER text-005.
  ENDLOOP.
