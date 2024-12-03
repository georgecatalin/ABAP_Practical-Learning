*&---------------------------------------------------------------------*
*& Report zgc_string_ops
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zgc_string_ops.

DATA: lv_string_1(10) TYPE C VALUE 'Hello',
      lv_string_2(10) TYPE C VALUE 'World'.

DATA: lv_string_output TYPE string.

* CONCATENATE
CONCATENATE lv_string_1 lv_string_2 INTO lv_string_output SEPARATED BY '$$'.

WRITE : 'Concatenation example -> ', lv_string_output.

* SPLIT

DATA: lv_split_1(10) TYPE C,
      lv_split_2(10) TYPE C.

ULINE.

SPLIT lv_string_output AT '$$' INTO lv_split_1 lv_split_2.

WRITE: 'Split example : ' , lv_string_output, '->', lv_split_1, lv_split_2.

* CONDENSE

ULINE.

DATA: lv_condense_1 TYPE string VALUE ' Hello      from      Galati'.

DATA lv_length TYPE i.

lv_length = STRLEN( lv_condense_1 ).

WRITE: 'Length before CONDENSE was applied is -> ', lv_length, ' and the string is ->', lv_condense_1.

WRITE: /.

CONDENSE lv_condense_1.
lv_length = STRLEN( lv_condense_1 ).
WRITE: 'Length after CONDENSE was applied is -> ', lv_length, ' and the string is ->', lv_condense_1.

WRITE: /.


CONDENSE lv_condense_1 NO-GAPS. " ALL SPACES ARE TO BE REMOVED IN THE STRING by using the NO-GAPS addition
lv_length = STRLEN( lv_condense_1 ).
WRITE: 'Length after CONDENSE NO-GAPS  was applied is -> ', lv_length, ' and the string is ->', lv_condense_1.


**********************************************************************
* FIND
**********************************************************************

ULINE.

WRITE: /.

DATA lv_find(50) TYPE c VALUE 'Hello for Learning SAP'.

FIND 'SAP' IN lv_find.
IF sy-subrc = 0.
    WRITE: 'Found successful "SAP" in ', lv_find.
ELSE.
  WRITE: 'Found unsuccessful  "SAP" in ', lv_find.
ENDIF.

WRITE: /.

FIND 'sap' IN lv_find.
IF sy-subrc = 0.
    WRITE: 'Found successful "sap" in ', lv_find.
ELSE.
  WRITE: 'Found unsuccessful  "sap" in ', lv_find.
ENDIF.


WRITE: /.

FIND 'SAP' IN lv_find IGNORING CASE.
IF sy-subrc = 0.
    WRITE: 'Found successful "sap" in ', lv_find, ' using addition IGNORE-CASE'.
ELSE.
  WRITE: 'Found unsuccessful  "sap" in ', lv_find,  ' using addition IGNORE-CASE'.
ENDIF.

**********************************************************************
* TRANSLATE
**********************************************************************
ULINE.

DATA lv_translate_1(50) TYPE c VALUE 'Hello World Again'.
DATA lv_tranSlate_2(50) TYPE c VALUE 'hello world again'.

WRITE: /.
WRITE: 'Initial string:', lv_translate_1.

TRANSLATE lv_translate_1 TO UPPER CASE.
WRITE: / 'TRANSLATE lv_translate_1 TO UPPER CASE. string:', lv_translate_1.
TRANSLATE lv_translate_1 TO LOWER CASE.
WRITE: / 'TRANSLATE lv_translate_1 TO UPPER CASE. string:', lv_translate_1.

DATA lv_pattern(10) TYPE c VALUE 'hHwWgG'. " switch H to h, W to h, A to g
TRANSLATE lv_translate_2 USING lv_pattern.
WRITE: / ' TRANSLATE lv_translate_1 USING lv_pattern. ', lv_translate_2.


* *******************************************************************************
* SHIFT
* *******************************************************************************

DATA: lv_shift_1(10) TYPE c VALUE '0123456789',
      lv_shift_2(10) TYPE c VALUE '0123456789',
      lv_shift_3(10) TYPE c VALUE '0123456789'.

ULINE.
WRITE : /.

WRITE: / 'Initial string:', lv_shift_1.
SHIFT lv_shift_1 BY 5 PLACES. " if nothing is specified then it is considered as SHIFT LEFT
WRITE: / 'AFTER SHIFT 5 PLACES LEFT', lv_shift_1.

WRITE: / 'Initial string:', lv_shift_2.
SHIFT lv_shift_2 BY 4 PLACES RIGHT. " 4 Leading spaces will be added
WRITE: / 'AFTER SHIFT 5 PLACES RIGHT', lv_shift_2.

WRITE: / 'Initial string:', lv_shift_3.
SHIFT lv_shift_3 BY 4 PLACES CIRCULAR. " 3 Chars from the leading part will go at the end part of the string
WRITE: / 'AFTER SHIFT 4 PLACES CIRCULAR', lv_shift_3.


ULINE.
WRITE: /.
WRITE: / 'A use-case of the SHIFT for removing trailing and leading zeroes in practical projects'.
WRITE: /.

DATA: lv_practical_shift_1(10) TYPE c VALUE '7000000000',
      lv_practical_shift_2(10) TYPE c VALUE '0000000007'.

WRITE: / 'Initial string:', lv_practical_shift_1.
SHIFT lv_practical_shift_1 RIGHT DELETING TRAILING '0'.
WRITE: / 'Final string after applying SHIFT :', lv_practical_shift_1.


WRITE: / 'Initial string:', lv_practical_shift_2.
SHIFT lv_practical_shift_2 LEFT DELETING LEADING '0'.
WRITE: / 'Final string after applying SHIFT :', lv_practical_shift_2.

**********************************************************************************************
* SUBSTRINGS
**********************************************************************************************

DATA: lv_phone_number(30)  TYPE C VALUE '40-722-764836'.


DATA: lv_country_code(2) TYPE c,
      lv_operator_code(2) TYPE c,
      lv_phone(6) TYPE c.

lv_country_code = lv_phone_number+0(2). " start from position 0 in 40-722-764836 which is 4 and take 2 chars
lv_operator_code = lv_phone_number+3(3).
lv_phone = lv_phone_number+7(6).

ULINE.
WRITE: /.
WRITE: / 'Country code:', lv_country_code.
WRITE: / 'Operator code:', lv_operator_code.
WRITE: / 'Actual Phone:', lv_phone.
