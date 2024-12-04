*&---------------------------------------------------------------------*
*& Report zgc_strings_compare_cs_ns
*&---------------------------------------------------------------------*
*& Author: George Calin
*& Description: This report demonstrates how to compare two strings using CS and NS
*&---------------------------------------------------------------------*
REPORT zgc_strings_compare_cs_ns.

* -------------------------------------------------------------------------------------
* CS is case insensitive comparison
* -------------------------------------------------------------------------------------
ULINE.
WRITE: /'CS is case insensitive comparison'.

* This is case insensitive comparison, and returns TRUE
DATA: lv_string_cs_1 TYPE string VALUE 'System Application Programming',
      lv_string_cs_2 TYPE string VALUE 'System'.

 IF lv_string_cs_1 CS lv_string_cs_2.
     WRITE: /'The string ', lv_string_cs_1, ' CS ', lv_string_cs_2, '= TRUE and sy-fypos=', sy-fdpos. " sy-fdpos= the offset of the first character from the 2nd string in the 1st string (here it is 0) --> this result is expected
 ELSE.
    WRITE: /'The string ', lv_string_cs_1, ' CS ', lv_string_cs_2, '= FALSE and sy-fypos=', sy-fdpos. " sy-fdpos= length of the 1st string
 ENDIF.

ULINE.
WRITE: / 'This is case insensitive comparison, and returns FALSE'.
DATA: lv_string_cs_3 TYPE string VALUE 'System Application Programming',
      lv_string_cs_4 TYPE string VALUE 'Welcome'.

 IF lv_string_cs_3 CS lv_string_cs_4.
     WRITE: /'The string ', lv_string_cs_3, ' CS ', lv_string_cs_4, '= TRUE and sy-fypos=', sy-fdpos. " sy-fdpos= the offset of the first character from the 2nd string in the 1st string (here it is 0)
 ELSE.
    WRITE: /'The string ', lv_string_cs_3, ' CS ', lv_string_cs_4, '= FALSE and sy-fdpos=', sy-fdpos. " sy-fdpos= length of the 1st string --> this result is expected
 ENDIF.

 ULINE.
* This returns TRUE due to case insensitive comparison
WRITE: / 'This is case insensitive comparison, and returns TRUE'.
DATA: lv_string_cs_5 TYPE string VALUE 'System Application Programming',
      lv_string_cs_6 TYPE string VALUE 'sYsTeM'.

 IF lv_string_cs_5 CS lv_string_cs_6.
     WRITE: /'The string ', lv_string_cs_5, ' CS ', lv_string_cs_6, '= TRUE and sy-fypos=', sy-fdpos. " sy-fdpos= the offset of the first character from the 2nd string in the 1st string (here it is 0) --> this result is expected
 ELSE.
    WRITE: /'The string ', lv_string_cs_5, ' CS ', lv_string_cs_6, '= FALSE and sy-fdpos=', sy-fdpos. " sy-fdpos= length of the 1st string
 ENDIF.

 ULINE.

* -------------------------------------------------------------------------------------
* Comparing CS contains string  with CO contains only
* -------------------------------------------------------------------------------------

WRITE: /'Comparing CS contains string  with CO contains only'.
DATA: lv_string_compare_1(50) TYPE c VALUE 'Madam',
      lv_string_compare_2(50) TYPE c VALUE 'damaM'.

IF lv_string_compare_1 CS lv_string_compare_2.
    WRITE: /'The string ', lv_string_compare_1, ' CS ', lv_string_compare_2, '= TRUE and sy-fypos=', sy-fdpos. " sy-fdpos= the offset of the first character from the 2nd string in the 1st string (here it is 0) --> this result is expected
ELSE.
   WRITE: /'The string ', lv_string_compare_1, ' CS ', lv_string_compare_2, '= FALSE and sy-fdpos=', sy-fdpos. " sy-fdpos= length of the 1st string
ENDIF.


IF lv_string_compare_1 CO lv_string_compare_2.
    WRITE: /'The string ', lv_string_compare_1, ' CO ', lv_string_compare_2, '= TRUE and sy-fypos=', sy-fdpos. " sy-fdpos= the offset of the first character from the 2nd string in the 1st string (here it is 0) --> this result is expected
ELSE.
   WRITE: /'The string ', lv_string_compare_1, ' CO ', lv_string_compare_2, '= FALSE and sy-fdpos=', sy-fdpos. " sy-fdpos= length of the 1st string
ENDIF.

ULINE.

* -------------------------------------------------------------------------------------
* NS is case in-sensitive comparison
* -------------------------------------------------------------------------------------
WRITE: /'NS is case in-sensitive comparison and the following example returns FALSE'.

* This is case in-sensitive comparison, and returns FALSE
DATA: lv_string_ns_1(50) TYPE c VALUE 'System Application Programming',
      lv_string_ns_2(50) TYPE c VALUE 'System'.

IF lv_string_ns_1 NS lv_string_ns_2.
    WRITE: /'The string ', lv_string_ns_1, ' NS ', lv_string_ns_2, '= TRUE and sy-fypos=', sy-fdpos. " sy-fdpos is the length of the 1st string
ELSE.
       WRITE: /'The string ', lv_string_ns_1, ' NS ', lv_string_ns_2, '= FALSE and sy-fdpos=', sy-fdpos. " sy-fdpos is the offset of the first character from the 2nd string in the 1st string (here it is 0) --> this result is expected
ENDIF.


ULINE.
WRITE: /'This is case in-sensitive comparison, and the following example returns TRUE'.

* This is case in-sensitive comparison, and returns TRUE
DATA: lv_string_ns_3(50) TYPE c VALUE 'System Application Programming',
      lv_string_ns_4(50) TYPE c VALUE 'Welcome'.

IF lv_string_ns_3 NS lv_string_ns_4.
    WRITE: /'The string ', lv_string_ns_3, ' NS ', lv_string_ns_4, '= TRUE and sy-fypos=', sy-fdpos. " sy-fdpos is the length of the 1st string --> this result is expected
ELSE.
    WRITE: /'The string ', lv_string_ns_3, ' NS ', lv_string_ns_4, '= FALSE and sy-fdpos=', sy-fdpos. " sy-fdpos is the offset of the first character from the 2nd string in the 1st string (here it is 0)
ENDIF.
