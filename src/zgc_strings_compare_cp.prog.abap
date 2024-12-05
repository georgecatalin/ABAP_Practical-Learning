*&---------------------------------------------------------------------*
*& Report zgc_strings_compare_cp
*&---------------------------------------------------------------------*
*& Author: George Calin
*& Description: Compare things with CP
*&---------------------------------------------------------------------*
REPORT zgc_strings_compare_cp.


ULINE.

WRITE: / 'Compare strings with CP.This example returns true'.
DATA: lv_string_cp_1(20) TYPE c VALUE 'System Application Programming',
      lv_string_cp_2(20) TYPE c VALUE '*App*'.


IF lv_string_cp_1 CP lv_string_cp_2.
    WRITE: / 'True =', lv_string_cp_1, 'CP', lv_string_cp_2, ' sy-fdpos=', sy-fdpos. " sy-fdpos=7 returns the offset of the first character of the match from lv_string_cp_2 in lv_string_cp_1
ELSE.
      WRITE: / 'False =', lv_string_cp_1, 'CP', lv_string_cp_2, ' sy-fdpos=', sy-fdpos." sy-fdpos returns the length of the string
ENDIF.


ULINE.
WRITE: / 'Compare strings with CP.This example returns false'.
DATA: lv_string_cp_3(20) TYPE c VALUE 'System Application Programming',
      lv_string_cp_4(20) TYPE c VALUE 'App*'.

IF lv_string_cp_3 CP lv_string_cp_4.
    WRITE: / 'True =', lv_string_cp_3, 'CP', lv_string_cp_4, ' sy-fdpos=', sy-fdpos.
ELSE.
      WRITE: / 'False =', lv_string_cp_3, 'CP', lv_string_cp_4, ' sy-fdpos=', sy-fdpos.
ENDIF.


ULINE.
WRITE: / 'Compare strings with CP.This example returns true and proves CP is case insensitive'.
DATA: lv_string_cp_5(20) TYPE c VALUE 'System Application Programming',
      lv_string_cp_6(20) TYPE c VALUE '*app*'.

IF lv_string_cp_5 CP lv_string_cp_6.
    WRITE: / 'True =', lv_string_cp_5, 'CP', lv_string_cp_6, ' sy-fdpos=', sy-fdpos.
ELSE.
      WRITE: / 'False =', lv_string_cp_5, 'CP', lv_string_cp_6, ' sy-fdpos=', sy-fdpos.
ENDIF.

ULINE.
WRITE: / 'Compare strings with CP.This example returns false'.
DATA: lv_string_cp_7(20) TYPE c VALUE 'System Application Programming',
      lv_string_cp_8(20) TYPE c VALUE '*Welcome*'.

IF lv_string_cp_7 CP lv_string_cp_8.
    WRITE: / 'True =', lv_string_cp_7, 'CP', lv_string_cp_8, ' sy-fdpos=', sy-fdpos.
ELSE.
      WRITE: / 'False =', lv_string_cp_7, 'CP', lv_string_cp_8, ' sy-fdpos=', sy-fdpos.
ENDIF.

ULINE.
WRITE: / 'Compare strings with CP.This example uses # to interpret a certain character exactly'.
WRITE: / 'This example proves how to enforce case sensitivity with CP => returns true'.

DATA: lv_string_cp_9(20) TYPE c VALUE 'System Application Programming',
      lv_string_cp_10(20) TYPE c VALUE '*#App**'.


IF lv_string_cp_9 CP lv_string_cp_10.
    WRITE: / 'True =', lv_string_cp_9, 'CP', lv_string_cp_10, ' sy-fdpos=', sy-fdpos.
ELSE.
      WRITE: / 'False =', lv_string_cp_9, 'CP', lv_string_cp_10, ' sy-fdpos=', sy-fdpos.
ENDIF.

ULINE.
WRITE: / 'Compare strings with CP.This example uses # to interpret a certain character exactly'.
WRITE: / 'This example proves how to enforce case sensitivity with CP => returns false'.

DATA: lv_string_cp_11(20) TYPE c VALUE 'System Application Programming',
      lv_string_cp_12(20) TYPE c VALUE '*#app*'.

IF lv_string_cp_11 CP lv_string_cp_12.
    WRITE: / 'True =', lv_string_cp_11, 'CP', lv_string_cp_12, ' sy-fdpos=', sy-fdpos.
ELSE.
    WRITE: / 'False =', lv_string_cp_11, 'CP', lv_string_cp_12, ' sy-fdpos=', sy-fdpos.
ENDIF.

ULINE.
WRITE: / 'Compare strings with CP.This example uses # to escape special characters like * or +'.
WRITE: / 'This example => returns true'.

DATA: lv_string_cp_13(20) TYPE c VALUE 'System*Application Programming',
      lv_string_cp_14(20) TYPE c VALUE '*#*App*'.


IF lv_string_cp_13 CP lv_string_cp_14.
  WRITE: / 'True =', lv_string_cp_13, 'CP', lv_string_cp_14, ' sy-fdpos=', sy-fdpos.
ELSE.
  WRITE: / 'False =', lv_string_cp_13, 'CP', lv_string_cp_14, ' sy-fdpos=', sy-fdpos.
ENDIF.

ULINE.
WRITE: / 'Compare strings with CP.This example uses + to replace a single character'.
WRITE: / 'This example => returns true'.

DATA: lv_string_cp_15(20) TYPE c VALUE 'System Application Programming',
      lv_string_cp_16(20) TYPE c VALUE '*App+ication*'.

IF lv_string_cp_15 CP lv_string_cp_16.
    WRITE: / 'True =', lv_string_cp_15, 'CP', lv_string_cp_16, ' sy-fdpos=', sy-fdpos.
ELSE.
    WRITE: / 'False =', lv_string_cp_15, 'CP', lv_string_cp_16, ' sy-fdpos=', sy-fdpos.
ENDIF.

ULINE.
WRITE: / 'Compare strings with CP.This example uses + to replace a single character'.
WRITE: / 'This example => returns false'.

DATA: lv_string_cp_17(20) TYPE c VALUE 'System Application Programming',
      lv_string_cp_18(20) TYPE c VALUE '*App+lication*'.

IF lv_string_cp_17 CP lv_string_cp_18.
    WRITE: / 'True =', lv_string_cp_17, 'CP', lv_string_cp_18, ' sy-fdpos=', sy-fdpos.
ELSE.
    WRITE: / 'False =', lv_string_cp_17, 'CP', lv_string_cp_18, ' sy-fdpos=', sy-fdpos.
ENDIF.
