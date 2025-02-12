*&---------------------------------------------------------------------*
*& Report zgc_append_fieldsymbols
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zgc_append_fieldsymbols.

TYPES: BEGIN OF lty_data,
        order_number TYPE ZDEONUMBER,
        payment_method TYPE ZDEPAYM,
       END OF lty_data.

DATA: lt_data TYPE TABLE OF lty_data, " internal table
      ls_data TYPE lty_data. " work area

FIELD-SYMBOLS: <fs_data> TYPE lty_data.

APPEND INITIAL LINE TO lt_data ASSIGNING <fs_data>.
IF <fs_data> IS ASSIGNED.
    <fs_data>-order_number = 100.
    <fs_data>-payment_method = 'C'.
ENDIF.
UNASSIGN <fs_data>.

APPEND INITIAL LINE TO lt_data ASSIGNING <fs_data>.
IF <fs_data> IS ASSIGNED.
    <fs_data>-order_number = 101.
    <fs_data>-payment_method = 'D'.
ENDIF.
UNASSIGN <fs_data>.

APPEND INITIAL LINE TO lt_data ASSIGNING <fs_data>.
IF <fs_data> IS ASSIGNED.
    <fs_data>-order_number = 102.
    <fs_data>-payment_method = 'C'.
ENDIF.
UNASSIGN <fs_data>.

APPEND INITIAL LINE TO lt_data ASSIGNING <fs_data>.
IF <fs_data> IS ASSIGNED.
    <fs_data>-order_number = 103.
    <fs_data>-payment_method = 'D'.
ENDIF.
UNASSIGN <fs_data>.

* Display the internal table using Field Symbol
LOOP AT lt_data ASSIGNING <fs_data>.
IF <fs_data> IS ASSIGNED.
    WRITE: / <fs_data>-order_number, ' , ', <fs_data>-payment_method.
ENDIF.
ENDLOOP.
