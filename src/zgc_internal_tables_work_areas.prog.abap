*&---------------------------------------------------------------------*
*& Report zgc_internal_tables_work_areas
*&---------------------------------------------------------------------*
*& Author: George Calin
*& Description: This report shows how to work with internal tables and work areas
*&---------------------------------------------------------------------*
REPORT zgc_internal_tables_work_areas.

* This is the first means of declaring and using an internal table and a work area
* -----------------------------------------------------------------------------------------
TYPES: BEGIN OF lty_data,
        order_number TYPE ZDEONUMBER,
        payment_method TYPE ZDEPAYM,
       END OF lty_data.

DATA: lt_data TYPE TABLE OF lty_data, " internal table
      ls_data TYPE lty_data. " work area

* This is the second means of declaring and using an internal table and a work area
* -----------------------------------------------------------------------------------------

TYPES: ltty_data TYPE TABLE OF lty_data. " internal table

DATA: lt_data_2 TYPE ltty_data.

* This is the third means of declaring and using an internal table and a work area using SE11 TRANSACTION
* -----------------------------------------------------------------------------------------

DATA: lt_data_3 TYPE TABLE OF ZGC_TY_DATA, " Where ZGC_TY_DATA is a structure defined in SE11
      ls_data_3 TYPE ZGC_TY_DATA. " Where ZGC_TY_DATA is a structure defined in SE11

* This is the fourth means of declaring and using an internal table and a work area using SE11 TRANSACTION
* -----------------------------------------------------------------------------------------

DATA: lt_data_4 TYPE ZGC_TY_DATA. " Where ZGC_TY_DATA is a table type defined in SE11
