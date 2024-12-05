*&---------------------------------------------------------------------*
*& Report zgc_internal_tables_work_areas
*&---------------------------------------------------------------------*
*& Author: George Calin
*& Description: This report shows how to work with internal tables and work areas
*&---------------------------------------------------------------------*
REPORT zgc_internal_tables_work_areas.


TYPES: BEGIN OF lty_data,
        order_number TYPE ZDEONUMBER,
        payment_method TYPE ZDEPAYM,
       END OF lty_data.

DATA: lt_data TYPE TABLE OF lty_data, " internal table
      ls_data TYPE lty_data. " work area
