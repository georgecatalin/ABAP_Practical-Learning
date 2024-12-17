*&---------------------------------------------------------------------*
*& Report zgc_basic_report
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zgc_basic_report.

DATA lv_output TYPE NUMC2.

PARAMETERS: p_input1 TYPE NUMC2,
            p_input2 TYPE NUMC2.


lv_output = p_input1 + p_input2.

WRITE lv_output.
