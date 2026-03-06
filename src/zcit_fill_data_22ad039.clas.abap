CLASS zcit_fill_data_22ad039 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun. " Required to display output in Eclipse [cite: 65, 66]
ENDCLASS.

CLASS zcit_fill_data_22ad039 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    DATA lt_subjects TYPE TABLE OF zstud_22ad039.

    " Data matching your specific field names from the screenshot
    lt_subjects = VALUE #(
      ( student_id = '1' subject_name = 'Data Structures'     credits = 4 grade_point = 9 )
      ( student_id = '1' subject_name = 'Database Systems'    credits = 3 grade_point = 8 )
      ( student_id = '1' subject_name = 'Computer Networks'   credits = 3 grade_point = 9 )
      ( student_id = '1' subject_name = 'ABAP Cloud'          credits = 4 grade_point = 10 )
      ( student_id = '1' subject_name = 'Web Development Lab' credits = 2 grade_point = 9 )
    ).

    " Clear existing data for 22AD039 to avoid duplicates
    DELETE FROM zstud_22ad039.

    " Insert the data into your database table [cite: 68-73]
    INSERT zstud_22ad039 FROM TABLE @lt_subjects.

    IF sy-subrc = 0.
      out->write( 'Successfully inserted 5 records for Roll No: 22AD039.' ).
    ELSE.
      out->write( 'Data insertion failed.' ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.
