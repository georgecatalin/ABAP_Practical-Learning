*&---------------------------------------------------------------------*
*& Report ZGC_INPUTSCREEN_SELECTOPTIONS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZGC_INPUTSCREEN_SELECTOPTIONS.


DATA: lv_ono TYPE zgcdeono_1,
      lv_ono_1 TYPE zgcdeono_1,
      lv_ono_2 TYPE zgcdeono_1,
      lv_ono_3 TYPE zgcdeono_1,
      lv_ono_4 TYPE zgcdeono_1,
      lv_ono_5 TYPE zgcdeono_1.


SELECT-OPTIONS: s_ono FOR lv_ono.

WRITE: / 'how to enter default low value and high value'.
SELECT-OPTIONS: s_ono1 FOR lv_ono_1 DEFAULT 1978 to 2025. " how to enter default low value and high value
WRITE: / 'how to ensure the range of values is mandatory'.
SELECT-OPTIONS: s_ono2 FOR lv_ono_2 OBLIGATORY. " how to ensure the range of values is mandatory
WRITE: /'How to display only low value and multiple values button'.
SELECT-OPTIONS: s_ono3 FOR lv_ono_3 NO INTERVALS. " How to display only low value and multiple values button
WRITE: / 'How to display only low value , but no multiple values button'.
SELECT-OPTIONS: s_ono4 FOR lv_ono_4 NO INTERVALS NO-EXTENSION. " How to display only low value , but no multiple values button.
WRITE: / 'How to display the low and the high, but no multiple values button'.
SELECT-OPTIONS: s_ono5 FOR lv_ono_5 NO-EXTENSION. " How to display the low and the high, but no multiple values button
