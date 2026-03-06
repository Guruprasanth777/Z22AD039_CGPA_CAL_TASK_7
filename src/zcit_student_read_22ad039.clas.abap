CLASS zcit_student_read_22ad039 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.

CLASS zcit_student_read_22ad039 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    " Step 7: Fetch Data into Internal Table [cite: 67-68]
    " This selects all records from your custom table zstud_22ad070 [cite: 70-72]
    SELECT * FROM zstud_22ad039
      INTO TABLE @DATA(lt_students). "

    " Step 8: Display Data in Console [cite: 74]
    out->write( '--- Student Grade Report: 22AD039 ---' ). " [cite: 93]

    IF lt_students IS NOT INITIAL.
      LOOP AT lt_students INTO DATA(ls_row). "

        " Display Student ID and Subject Name [cite: 94, 97, 99]
        out->write( |Student ID : { ls_row-student_id } | &&
                    |\| Subject: { ls_row-subject_name } | ).

        " Display Credits and Grade Point [cite: 95, 98, 100]
        out->write( |Credits    : { ls_row-credits } | &&
                    |Grade   : { ls_row-grade_point }| ).

        out->write( '-------------------------------------------' ).
      ENDLOOP.
    ELSE.
      out->write( 'No data found. Ensure you ran the Step 5 insertion class first.' ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
