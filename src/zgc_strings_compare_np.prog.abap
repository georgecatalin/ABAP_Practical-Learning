*&---------------------------------------------------------------------*
*& Report zgc_strings_compare_np
*&---------------------------------------------------------------------*
*& Author: George Calin
*& Description: This report compares two strings using NP
*&---------------------------------------------------------------------*
REPORT zgc_strings_compare_np.


ULINE.
WRITE: / 'Compare two strings using NP.This returns true'.
WRITE: / .

DATA: lv_string_np_1 TYPE string VALUE 'System Application Product',
      lv_string_np_2 TYPE string VALUE '*Welcome*'.

IF lv_string_np_1 NP lv_string_np_2.
  WRITE: / lv_string_np_1, 'NP', lv_string_np_2, '= TRUE and sy-fdpos=', sy-fdpos . " sy-fdpos= length of the first string
ELSE.
    WRITE: / lv_string_np_1, 'NP', lv_string_np_2, '= FALSE and sy-fdpos=', sy-fdpos . " the offset of the first match from string 2 in string 1
ENDIF.

ULINE.
WRITE: / 'Compare two strings using NP.This returns false'.
WRITE: / .

DATA: lv_string_np_3 TYPE string VALUE 'System Application Product',
      lv_string_np_4 TYPE string VALUE '*App*'.

IF lv_string_np_3 NP lv_string_np_4.
  WRITE: / lv_string_np_3, 'NP', lv_string_np_4, '= TRUE and sy-fdpos=', sy-fdpos . " sy-fdpos= length of the first string
ELSE.
  WRITE: / lv_string_np_3, 'NP', lv_string_np_4, '= FALSE and sy-fdpos=', sy-fdpos . " the offset of the first match from string 2 in string 1
ENDIF.


ULINE.
WRITE: / 'Compare two strings using NP.This returns false and proves case insensitivity'.
WRITE: / .

DATA: lv_string_np_5 TYPE string VALUE 'System Application Product',
      lv_string_np_6 TYPE string VALUE '*app*'.

IF lv_string_np_3 NP lv_string_np_4.
  WRITE: / lv_string_np_5, 'NP', lv_string_np_6, '= TRUE and sy-fdpos=', sy-fdpos . " sy-fdpos= length of the first string
ELSE.
  WRITE: / lv_string_np_5, 'NP', lv_string_np_6, '= FALSE and sy-fdpos=', sy-fdpos . " the offset of the first match from string 2 in string 1
ENDIF.
