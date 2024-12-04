*&---------------------------------------------------------------------*
*& Report zgc_strings_comparison
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zgc_strings_comparison.

* ****************************************************************************
* CO contains only
* ****************************************************************************

DATA: lv_compare_strings_1(50) TYPE c VALUE 'System',
      lv_compare_strings_2(50) TYPE c VALUE 'System Application Programming'.

IF lv_compare_strings_1 CO lv_compare_strings_2. " CO contains only operator checks if the first string contains the second string > case sensitive EXAMPLE FOR TRUE
    WRITE: / 'String compared successful with CO operator -> sy-fdpos=', sy-fdpos.
ELSE.
    WRITE: / 'String compared failed with CO operator -> sy-fdpos=', sy-fdpos.
ENDIF.

ULINE.

DATA: lv_compare_strings_3(50) TYPE c VALUE 'system', " case sensitive EXAMPLE FOR TRUE also because s is small but exists in the second string as well , even in not the first position
      lv_compare_strings_4(50) TYPE c VALUE 'System Application Programming'.

IF lv_compare_strings_3 CO lv_compare_strings_4.
    WRITE: / 'String compared successful with CO operator -> sy-fdpos=', sy-fdpos.
ELSE.
    WRITE: / 'String compared failed with CO operator -> sy-fdpos=', sy-fdpos.
ENDIF.

ULINE.


DATA: lv_compare_strings_5(50) TYPE c VALUE 'SysteM', " case sensitive EXAMPLE FOR FALSE, because of the M in the end does not exist in the second string
      lv_compare_strings_6(50) TYPE c VALUE 'System Application Programming'.

IF lv_compare_strings_5 CO lv_compare_strings_6.
    WRITE: / 'String compared successful with CO operator -> sy-fdpos=', sy-fdpos. " when true, sy-fdpos returns the length of the first string
ELSE.
    WRITE: / 'String compared failed with CO operator -> sy-fdpos=', sy-fdpos. " when false, sy-fdpos returns the position of the first character that does not match
ENDIF.


* ****************************************************************************
* CN contains NOT ONLY
* ****************************************************************************

* CN contains not only operator checks if the first string contains the second string and it is case sensitive. This example is for false cause the first string does not contain other characters than the second string
DATA: lv_compare_strings_7(50) TYPE c VALUE 'System',
      lv_compare_strings_8(50) TYPE c VALUE 'System Application Programming'.

IF lv_compare_strings_7 CN lv_compare_strings_8.
    WRITE: / 'String compared successful with CN operator -> sy-fdpos=', sy-fdpos. " when true, sy-fdpos returns the position of the first character that does not match
ELSE.
    WRITE: / 'String compared failed with CN operator -> sy-fdpos=', sy-fdpos. " when false, sy-fdpos returns the length of the first string
ENDIF.

ULINE.
* This example will return true because the first string contains also characters that are not in the second string
DATA: lv_compare_strings_9(50) TYPE c VALUE 'System Application Programming',
      lv_compare_strings_10(50) TYPE c VALUE 'System'.

IF lv_compare_strings_9 CN lv_compare_strings_10.
    WRITE: / 'String compared successful with CN operator -> sy-fdpos=', sy-fdpos.
ELSE.
    WRITE: / 'String compared failed with CN operator -> sy-fdpos=', sy-fdpos.
ENDIF.
