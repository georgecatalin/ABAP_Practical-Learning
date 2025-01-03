*&---------------------------------------------------------------------*
*& Report zgc_event_handling_abap
*&---------------------------------------------------------------------*
*& Author: George Calin
*&---------------------------------------------------------------------*
REPORT zgc_ev_h_abap_modif_id_func LINE-COUNT 10(2)  .

TYPES: BEGIN OF lty_data,
        ordernumber TYPE zgcdeono_1,
        orderdate TYPE zgcdeodate_1,
        paymentmode TYPE zgcdepaym_1,
        currency TYPE zgcdecurr_1,
       END OF lty_data.

DATA: lt_data TYPE TABLE OF lty_data,
      ls_data TYPE lty_data.


DATA: lv_odate TYPE zgcdeodate_1.
DATA: lv_payment TYPE zgcdepaym_1.
DATA: lv_currency TYPE zgcdecurr_1.

SELECT-OPTIONS: s_odate FOR lv_odate NO-EXTENSION.
SELECT-OPTIONS: s_paym FOR lv_payment NO INTERVALS.
SELECT-OPTIONS: s_curr FOR lv_currency NO INTERVALS MODIF ID CUR.

PARAMETERS: p_view TYPE C AS CHECKBOX USER-COMMAND DO_IT.

INITIALIZATION. " This event executes before rendering the input screen

s_odate-sign = 'I'.
s_odate-option = 'BT'.
s_odate-low = sy-datum - 300.
s_odate-high = sy-datum.
APPEND s_odate. " as the s_odte is a table with header line, it includes a work area in itself with the same name as the table


AT SELECTION-SCREEN OUTPUT. " This event is executed every time the input screen is displayed , unlike INITIALIZATION which is triggered only once
IF p_view = ' '.
    LOOP AT screen.
        IF  screen-group1 = 'CUR'.
            screen-active = 0.
            MODIFY screen.
        ENDIF.
    ENDLOOP.
ENDIF.

IF p_view = 'X'.
    LOOP AT screen.
        IF  screen-group1 = 'CUR'.
            screen-active = 1.
            MODIFY screen.
        ENDIF.
    ENDLOOP.
ENDIF.




AT SELECTION-SCREEN. " This event executes after the user selects the input values and presses the execute button or ENTER key

IF s_paym-low IS NOT INITIAL.
  IF s_paym-low <> 'C' AND s_paym-low <> 'D'.
    MESSAGE E001(ZMSG_2).
  ENDIF.
ENDIF.

START-OF-SELECTION.

SELECT ordernumber, orderdate, paymentmode, currency FROM zgcorderh_1 INTO TABLE @lt_data
 WHERE orderdate IN @s_odate AND paymentmode IN @s_paym AND currency IN @s_curr.

 LOOP AT lt_data INTO ls_data.
    WRITE: / ls_data-ordernumber UNDER TEXT-003, ls_data-orderdate UNDER TEXT-004, ls_data-paymentmode UNDER TEXT-005, ls_data-currency UNDER TEXT-006.
 ENDLOOP.

END-OF-SELECTION. " this is executed at the end of selection, when all the data related actions have been executed
WRITE: / TEXT-001.

TOP-OF-PAGE. " This event is executed when the 1st WRITE command is processed and it adds a title or a header on each page
WRITE: / TEXT-002, sy-pagno.
WRITE:/ TEXT-003, 15 TEXT-004, 27 TEXT-005, 47 TEXT-006.

END-OF-PAGE. " This event is executed when the last WRITE command on the page or report is processed
WRITE: / TEXT-007, sy-pagno.
