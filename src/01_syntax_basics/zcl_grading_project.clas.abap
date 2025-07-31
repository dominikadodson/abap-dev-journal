CLASS zcl_grading_project DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.



    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.

    DATA grades TYPE TABLE OF REF TO zcl_grades.
    DATA grade_ref TYPE ref to zcl_grades.
METHODS: fill_grades.

ENDCLASS.


CLASS zcl_grading_project IMPLEMENTATION.

METHOD fill_grades.

  DATA grade TYPE REF TO zcl_grades.

* Test 1
  grade = new #(  ).
  grade->student_name = 'Dominika'.
  grade->test_name = 'Quiz 1'.
  grade->test_score = 75.

  APPEND grade to grades.

* Test 2
  grade = new #(  ).
  grade->student_name = 'Dominika'.
  grade->test_name = 'Quiz 2'.
  grade->test_score = 50.

  APPEND grade to grades.

* Test 3
  grade = new #(  ).
  grade->student_name = 'Dominika'.
  grade->test_name = 'Quiz 3'.
  grade->test_score = 100.

  APPEND grade to grades.

* Test 4
  grade = new #(  ).
  grade->student_name = 'Rich'.
  grade->test_name = 'Quiz 1'.
  grade->test_score = 100.

  APPEND grade to grades.

* Test 5
  grade = new #(  ).
  grade->student_name = 'Rich'.
  grade->test_name = 'Quiz 4'.
  grade->test_score = 100.

  APPEND grade to grades.

ENDMETHOD.


  METHOD if_oo_adt_classrun~main.


  DATA total_score TYPE i.
  DATA counter TYPE i.

ME->fill_grades(  ).


* Loop through the table
  LOOP AT grades INTO grade_ref.
      IF grade_ref->student_name = 'Rich'.
        total_score = total_score + grade_ref->test_score.
        counter = counter + 1.
        DATA(last_used_name) = grade_ref->student_name.
      ELSE.
        CONTINUE.
      ENDIF.
    ENDLOOP.

* Write into the console
IF counter > 0.
      DATA(average_score) = CONV f( total_score ) / counter.
      out->write( |Score for { last_used_name }| ).
      out->write( |Average Score: { average_score }| ).
      out->write( |Total Score: { total_score }| ).
      IF average_score > 75.
        out->write( 'Congrats, you passed!' ).
      ELSE.
        out->write( 'Sorry, you did not pass :(' ).
      ENDIF.

    ELSE.
      out->write( 'No test results found for this student.' ).
    ENDIF.



  ENDMETHOD.
ENDCLASS.
