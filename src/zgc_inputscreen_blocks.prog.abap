
*& Report ZGC_INPUTSCREEN_BLOCKS
*&---------------------------------------------------------------------*
*& Author: George Calin
*& Description: This program demonstrates how to create input screens
*&---------------------------------------------------------------------*
REPORT ZGC_INPUTSCREEN_BLOCKS.


* Parameters are used to pass single values to a program.


SELECTION-SCREEN: BEGIN OF BLOCK B1 WITH FRAME TITLE text-000.


PARAMETERS p_ono TYPE vbeln DEFAULT 120. " parameter object names can only have up to including 8 characters

PARAMETERS p_ono_1 TYPE vbeln OBLIGATORY.


SELECTION-SCREEN: BEGIN OF LINE.

PARAMETERS p_r1 TYPE c RADIOBUTTON GROUP g1 DEFAULT 'X'.
SELECTION-SCREEN: COMMENT 3(3) text-001.

PARAMETERS p_r2 TYPE c RADIOBUTTON GROUP g1.
SELECTION-SCREEN: COMMENT 9(12) text-002.

PARAMETERS p_r3 TYPE c RADIOBUTTON GROUP g1.
SELECTION-SCREEN: COMMENT 30(10) text-003.

SELECTION-SCREEN: END OF LINE.


SELECTION-SCREEN: BEGIN OF LINE.

PARAMETERS: p_c1 TYPE c AS CHECKBOX,
            p_c2 TYPE c AS CHECKBOX,
            p_c3 TYPE c AS CHECKBOX.

SELECTION-SCREEN: END OF LINE.

SELECTION-SCREEN: END OF BLOCK B1.
