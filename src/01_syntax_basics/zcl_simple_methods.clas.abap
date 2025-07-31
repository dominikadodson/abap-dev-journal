CLASS zcl_simple_methods DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES tt_flight type standard table of /dmo/flight with empty key.

    METHODS get_flight_info

        RETURNING VALUE(rt_flight_info) TYPE tt_flight.

    METHODS discount_price
        IMPORTING i_discount_factor TYPE p
        CHANGING c_flight_price TYPE /dmo/flight_price.

    DATA price TYPE /dmo/flight_price.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_simple_methods IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA: lt_flights TYPE STANDARD TABLE OF /dmo/flight,
          ls_flight  TYPE /dmo/flight,
          lv_discounted_price TYPE /dmo/flight_price.

    lt_flights = get_flight_info( ).

    LOOP AT lt_flights INTO ls_flight.

      lv_discounted_price = ls_flight-price.

      discount_price(
        EXPORTING i_discount_factor = '0.80'
        CHANGING  c_flight_price = lv_discounted_price
      ).

      out->write( |Flight { ls_flight-carrier_id } { ls_flight-connection_id } | &&
                  | Original Price: { ls_flight-price } | &&
                  | Discounted Price: { lv_discounted_price }| ).

    ENDLOOP.

  ENDMETHOD.

  METHOD get_flight_info.

  SELECT *
    FROM /dmo/flight
  "  WHERE carrier_id = 'LH'
  "  AND connection_id = '0400'
    INTO TABLE @rt_flight_info.

  ENDMETHOD.

  METHOD discount_price.
    c_flight_price = c_flight_price * i_discount_factor.
  ENDMETHOD.

ENDCLASS.
