CLASS zcit_cgpa_calc_22ad039 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun. " Required for console output [cite: 5, 12]
ENDCLASS.

CLASS zcit_cgpa_calc_22ad039 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    " 1. Create structure for Subject details [cite: 8]
    TYPES: BEGIN OF ty_subject_22ad039,
             subject_name TYPE string,
             credits      TYPE i,
             grade_point  TYPE i,
           END OF ty_subject_22ad039.

    " 2. Internal table and calculation variables [cite: 9, 10]
    DATA: lt_subjects      TYPE TABLE OF ty_subject_22ad039,
          lv_total_credits TYPE i VALUE 0,
          lv_total_points  TYPE i VALUE 0,
          lv_cgpa          TYPE p LENGTH 8 DECIMALS 2.

    " 3. Insert 5 subjects into the internal table [cite: 9, 15-22, 62]
    lt_subjects = VALUE #(
      ( subject_name = 'Data Structures and Algorithms' credits = 4 grade_point = 9 )
      ( subject_name = 'Database Management Systems'    credits = 3 grade_point = 8 )
      ( subject_name = 'Computer Networks'             credits = 3 grade_point = 9 )
      ( subject_name = 'ABAP Cloud Programming'        credits = 4 grade_point = 10 )
      ( subject_name = 'Web Development Lab'           credits = 2 grade_point = 9 )
    ).

    out->write( '--- AIDS Semester Course - 22AD039 ---' ).

    " 4. Loop to display subjects and sum totals [cite: 10, 12]
    LOOP AT lt_subjects INTO DATA(ls_sub).
      out->write( |Course: { ls_sub-subject_name }| ).
      out->write( |Credits: { ls_sub-credits } Grade Point: { ls_sub-grade_point }| ).

      lv_total_credits += ls_sub-credits.
      lv_total_points  += ( ls_sub-credits * ls_sub-grade_point ).
    ENDLOOP.

    " 5. Calculate CGPA & Handle division by zero [cite: 10, 11]
    IF lv_total_credits > 0.
      lv_cgpa = lv_total_points / lv_total_credits.
    ELSE.
      lv_cgpa = 0.
    ENDIF.

    " 6. Display final results [cite: 23-26]
    out->write( |Total Attempted Credits: { lv_total_credits }| ).
    out->write( |Total Earned Points:    { lv_total_points }| ).
    out->write( |Final CGPA:             { lv_cgpa }| ).

  ENDMETHOD.
ENDCLASS.
