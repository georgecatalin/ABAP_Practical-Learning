*&---------------------------------------------------------------------*
*& Report zgc_inputscreens_parameters
*&---------------------------------------------------------------------*
*& Author: George Calin
*& Description: This program demonstrates how to create input screens
*&---------------------------------------------------------------------*
REPORT zgc_inputscreens_parameters.


* Parameters are used to pass single values to a program.

PARAMETERS p_ono TYPE vbeln DEFAULT 120. " parameter object names can only have up to including 8 characters

PARAMETERS p_ono_1 TYPE vbeln OBLIGATORY.

PARAMETERS: p_r1 TYPE c RADIOBUTTON GROUP g1 DEFAULT 'X',
            p_r2 TYPE c RADIOBUTTON GROUP g1,
            p_r3 TYPE c RADIOBUTTON GROUP g1.

PARAMETERS: p_c1 TYPE c AS CHECKBOX,
            p_c2 TYPE c AS CHECKBOX,
            p_c3 TYPE c AS CHECKBOX.
