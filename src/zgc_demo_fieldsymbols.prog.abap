*&---------------------------------------------------------------------*
*& Report zgc_demo_fieldsymbols
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zgc_demo_fieldsymbols.


DATA: LV_DATA(2) TYPE N  VALUE 1978.

FIELD-SYMBOLS: <fs_symbol> TYPE N.

ASSIGN LV_DATA TO <fs_symbol>.

IF <fs_symbol> IS ASSIGNED.
WRITE: / 'INITIAL VALUE', <fs_symbol>.
<fs_symbol> = 1953.
WRITE: / 'VALUE AFTER MODIFICATION ', <fs_symbol>.

ENDIF.

DATA: lv_value1(50) TYPE C VALUE 'Welcome to Galati'.
FIELD-SYMBOLS: <fs_symbol_1>.

ASSIGN lv_value1+8(2) TO <fs_symbol_1>.

IF <fs_symbol_1> IS ASSIGNED.
<fs_symbol_1> = 'at'.
WRITE: / lv_value1.
ENDIF.
