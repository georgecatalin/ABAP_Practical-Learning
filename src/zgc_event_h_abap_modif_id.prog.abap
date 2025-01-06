*&---------------------------------------------------------------------*
*& Report zgc_event_handling_abap
*&---------------------------------------------------------------------*
*& Author: George Calin
*&---------------------------------------------------------------------*
REPORT zgc_event_h_abap_modif_id LINE-COUNT 10(2)  .

TYPES: BEGIN OF lty_data,
        ordernumber TYPE zgcdeono_1,
        orderdate TYPE zgcdeodate_1,
        paymentmode TYPE zgcdepaym_1,
        currency TYPE zgcdecurr_1,
       END OF lty_data.

TYPES: BEGIN OF lty_paym_value,
        pm TYPE zgcdepaym_1,
        desc TYPE desc40,
       END OF lty_paym_value.

TYPES: BEGIN OF lty_curr_value,
        curr TYPE zgcdecurr_1,
        desc TYPE desc40,
       END OF lty_curr_value.

DATA: lt_paym_value TYPE TABLE OF lty_paym_value,
      ls_paym_value TYPE lty_paym_value.

DATA: lt_curr_value TYPE TABLE OF lty_curr_value,
      ls_curr_value TYPE lty_curr_value.

DATA: lt_data TYPE TABLE OF lty_data,
      ls_data TYPE lty_data.


DATA: lv_odate TYPE zgcdeodate_1.
DATA: lv_payment TYPE zgcdepaym_1.
DATA: lv_currency TYPE zgcdecurr_1.

SELECT-OPTIONS: s_odate FOR lv_odate NO-EXTENSION.
SELECT-OPTIONS: s_paym FOR lv_payment NO INTERVALS.
SELECT-OPTIONS: s_curr FOR lv_currency NO INTERVALS MODIF ID CUR.

DATA: lt_links TYPE TABLE OF tline. " to be used in the event on help request

PARAMETERS: p_view TYPE C AS CHECKBOX .

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

AT SELECTION-SCREEN ON VALUE-REQUEST FOR s_paym-low.


ls_paym_value-pm = 'C'.
ls_paym_value-desc = 'Credit payment Type'.
APPEND ls_paym_value TO lt_paym_value.
CLEAR ls_paym_value.

ls_paym_value-pm = 'D'.
ls_paym_value-desc = 'Debit payment Type'.
APPEND ls_paym_value TO lt_paym_value.
CLEAR ls_paym_value.

CALL FUNCTION 'F4IF_INT_TABLE_VALUE_REQUEST'
  EXPORTING
*   DDIC_STRUCTURE         = ' '
    retfield               = 'pm'
*   PVALKEY                = ' '
  DYNPPROG               = sy-repid
   DYNPNR                 = sy-dynnr
   DYNPROFIELD            = 's_paym-low'
*   STEPL                  = 0
*     WINDOW_TITLE           = 'Values helper'
*   VALUE                  = ' '
   VALUE_ORG              = 'S'
*   MULTIPLE_CHOICE        = ' '
*   DISPLAY                = ' '
*   CALLBACK_PROGRAM       = ' '
*   CALLBACK_FORM          = ' '
*   CALLBACK_METHOD        =
*   MARK_TAB               =
* IMPORTING
*   USER_RESET             =
  tables
    value_tab              =  lt_paym_value
*   FIELD_TAB              =
*   RETURN_TAB             =
*   DYNPFLD_MAPPING        =
 EXCEPTIONS
   PARAMETER_ERROR        = 1
   NO_VALUES_FOUND        = 2
   OTHERS                 = 3
          .
IF sy-subrc <> 0.
* Implement suitable error handling here
ENDIF.


AT SELECTION-SCREEN ON VALUE-REQUEST FOR s_curr-low.

ls_curr_value-curr = 'USD'.
ls_curr_value-desc = 'US Dollar'.
APPEND ls_curr_value TO lt_curr_value.
CLEAR ls_curr_value.

ls_curr_value-curr = 'EUR'.
ls_curr_value-desc = 'Euro'.
APPEND ls_curr_value TO lt_curr_value.
CLEAR ls_curr_value.

ls_curr_value-curr = 'RON'.
ls_curr_value-desc = 'Romanian Leu'.
APPEND ls_curr_value TO lt_curr_value.
CLEAR ls_curr_value.

CALL FUNCTION 'F4IF_INT_TABLE_VALUE_REQUEST'
  EXPORTING
* DDIC_STRUCTURE         = ' '
    retfield               = 'curr'
*   PVALKEY                = ' '
    DYNPPROG               = sy-repid
    DYNPNR                 = sy-dynnr
    DYNPROFIELD            = 's_curr-low'
*   STEPL                  = 0
*     WINDOW_TITLE           = 'Values helper'
*   VALUE                  = ' '
    VALUE_ORG              = 'S'
*   MULTIPLE_CHOICE        = ' '
*   DISPLAY                = ' '
*   CALLBACK_PROGRAM       = ' '
*   CALLBACK_FORM          = ' '
*   CALLBACK_METHOD        =
*   MARK_TAB               =
    TABLES
    value_tab              =  lt_curr_value
*   FIELD_TAB              =
*   RETURN_TAB             =
*   DYNPFLD_MAPPING        =
    EXCEPTIONS
    PARAMETER_ERROR        = 1
    NO_VALUES_FOUND        = 2
    OTHERS                 = 3
            .


AT SELECTION-SCREEN ON HELP-REQUEST FOR s_paym-low.
CALL FUNCTION 'HELP_OBJECT_SHOW'
  EXPORTING
    dokclass                            = 'TX'
*   DOKLANGU                            = SY-LANGU
    dokname                             = 'ZLOGIN_SCREEN_INFO'
*   DOKTITLE                            = ' '
*   CALLED_BY_PROGRAM                   = ' '
*   CALLED_BY_DYNP                      = ' '
*   CALLED_FOR_TAB                      = ' '
*   CALLED_FOR_FIELD                    = ' '
*   CALLED_FOR_TAB_FLD_BTCH_INPUT       = ' '
*   MSG_VAR_1                           = ' '
*   MSG_VAR_2                           = ' '
*   MSG_VAR_3                           = ' '
*   MSG_VAR_4                           = ' '
*   CALLED_BY_CUAPROG                   = ' '
*   CALLED_BY_CUASTAT                   =
*   SHORT_TEXT                          = ' '
*   CLASSIC_SAPSCRIPT                   = ' '
*   MES_PROGRAM_NAME                    = ' '
*   MES_INCLUDE_NAME                    = ' '
*   MES_LINE_NUMBER                     =
*   MES_EXCEPTION                       = ' '
TABLES
  LINKS                               = lt_links  " this internal table is not used, but it must be specified
 EXCEPTIONS
   OBJECT_NOT_FOUND                    = 1
   SAPSCRIPT_ERROR                     = 2
   OTHERS                              = 3
          .
IF sy-subrc <> 0.
* Implement suitable error handling here
ENDIF.




AT SELECTION-SCREEN. " This event executes after the user selects the input values and presses the execute button or ENTER key

IF s_paym-low IS NOT INITIAL.
  GET CURSOR FIELD s_paym.
  IF s_paym-low <> 'C' AND s_paym-low <> 'D'.
    MESSAGE E001(ZMSG_2).
  ENDIF.
ENDIF.

AT SELECTION-SCREEN ON s_curr.
 IF s_curr-low IS NOT INITIAL.
   IF s_curr-low = 'GBP'.
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
