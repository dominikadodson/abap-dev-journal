CLASS zcl_99_bottles_song DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

        DATA number_1 TYPE i VALUE 99.
        DATA number_2 TYPE i.

        interfaces if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_99_bottles_song IMPLEMENTATION.

method if_oo_adt_classrun~main.

    out->write( |99 BOTTLES SONG| ).

    WHILE number_1 > 0.
        out->write( |{ number_1 } bottles of beer on the wall, { number_1 } bottles of beer. Take one down and pass it around, { number_2 } bottles of beer on the wall.| ).
        number_1 = number_1 - 1.
        number_2 = number_1 - 1.
    ENDWHILE.

    out->write( |END OF THE 99 BOTTLES SONG| ).

endmethod.

ENDCLASS.
