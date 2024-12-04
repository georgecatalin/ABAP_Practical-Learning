*&---------------------------------------------------------------------*
*& Report zgc_strings_compare_ca_na
*&---------------------------------------------------------------------*
*& Author: George Calin
*& Subject: Compare two strings in ABAP with CA and NA
*&---------------------------------------------------------------------*
REPORT zgc_strings_compare_ca_na.


* -----------------------------------------------------------------------
* CA operator
* -----------------------------------------------------------------------

WRITE: / 'CA operator'.

* The CA operator is used to compare two strings. It is case-sensitive. This is an example for True.
DATA: lv_string_ca_1 TYPE string VALUE 'ABAP@12345',
      lv_string_ca_2 TYPE string VALUE '0123456789'.

IF lv_string_ca_1 CA lv_string_ca_2.
    WRITE: 'String ', lv_string_ca_1, ' CA ', lv_string_ca_2, ' is true and sy-fdpos=', sy-fdpos. " if true, the sy-fdpos is the position of the first character of the match
 ELSE.
    WRITE: 'String ', lv_string_ca_1, ' CA ', lv_string_ca_2, ' is false and sy-fdpos=', sy-fdpos. " if false, the sy-fdpos is the length of the first string
ENDIF.


ULINE.
* the CA operator is case-sensitive. This is an example for False.
DATA: lv_string_ca_3 TYPE string VALUE 'ABAP@12345',
      lv_string_ca_4 TYPE string VALUE 'abcdefghijklmnoprstvyxz'.

IF lv_string_ca_3 CA lv_string_ca_4.
    WRITE: 'String ', lv_string_ca_3, ' CA ', lv_string_ca_4, ' is true and sy-fdpos=', sy-fdpos. " if true, the sy-fdpos is the position of the first character of the match
ELSE.
    WRITE: 'String ', lv_string_ca_3, ' CA ', lv_string_ca_4, ' is false and sy-fdpos=', sy-fdpos. " if false, the sy-fdpos is the length of the first string
ENDIF.


* -----------------------------------------------------------------------
* NA operator
* -----------------------------------------------------------------------

ULINE.
WRITE: / 'NA operator'.

* The NA operator is used to compare two strings. It is case-sensitive. This is an example for True.
DATA: lv_string_na_1 TYPE string VALUE 'ABAP@12345',
      lv_string_na_2 TYPE string VALUE '0123456789'.

 IF lv_string_na_1 NA lv_string_na_2.
     WRITE: 'String ', lv_string_na_1, ' NA ', lv_string_na_2, ' is true and sy-fdpos=', sy-fdpos. " if true, the sy-fdpos is the length of the first string
 ELSE.
     WRITE: 'String ', lv_string_na_1, ' NA ', lv_string_na_2, ' is false and sy-fdpos=', sy-fdpos. " if false, the sy-fdpos is the position of the first character of the match
 ENDIF.


ULINE.
* the NA operator is case-sensitive. This is an example for true and proves case-sensitivityness.

 DATA: lv_string_na_3 TYPE string VALUE 'ABAP@12345',
      lv_string_na_4 TYPE string VALUE 'abcdefghijklmnoprstvyxz'.

 IF lv_string_na_3 NA lv_string_na_4.
     WRITE: 'String ', lv_string_na_3, ' NA ', lv_string_na_4, ' is true and sy-fdpos=', sy-fdpos. " if true, the sy-fdpos is the length of the first string
 ELSE.
     WRITE: 'String ', lv_string_na_3, ' NA ', lv_string_na_4, ' is false and sy-fdpos=', sy-fdpos. " if false, the sy-fdpos is the position of the first character of the match
 ENDIF.

 ULINE.
* The NA operator is case-sensitive. This is an example for False.

DATA: lv_string_na_5 TYPE string VALUE 'ABAP@12345',
      lv_string_na_6 TYPE string VALUE 'abap@12345'.

IF lv_string_na_5 NA lv_string_na_6.
    WRITE: 'String ', lv_string_na_5, ' NA ', lv_string_na_6, ' is true and sy-fdpos=', sy-fdpos. " if true, the sy-fdpos is the length of the first string -> string numbering starts from 0 in ABAP, sy-fdpos is 4 here as @ matches
ELSE.
    WRITE: 'String ', lv_string_na_5, ' NA ', lv_string_na_6, ' is false and sy-fdpos=', sy-fdpos. " if false, the sy-fdpos is the position of the first character of the match
ENDIF.
