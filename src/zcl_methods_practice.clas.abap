CLASS zcl_methods_practice DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS get_flight_price
        RETURNING VALUE(r_flight_price) TYPE /dmo/flight_price.

    METHODS discount_price
        IMPORTING i_discount_factor TYPE p
        CHANGING c_flight_price TYPE /dmo/flight_price.

    DATA price TYPE /dmo/flight_price.

    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.

CLASS zcl_methods_practice IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    price = get_flight_price( ).

  out->write( |Original flight price: { price }| ).
*comment
  discount_price(
    EXPORTING i_discount_factor = '0.80'
    CHANGING  c_flight_price    = price
                                                   ).

  out->write( |Discounted flight price: { price }| ).

  ENDMETHOD.

  METHOD get_flight_price.

  SELECT SINGLE
    FROM /dmo/flight
    FIELDS price
    WHERE carrier_id = 'LH'
    AND connection_id = '0400'
    INTO @r_flight_price.

  ENDMETHOD.


  METHOD discount_price.
    c_flight_price = c_flight_price * i_discount_factor.
  ENDMETHOD.

ENDCLASS.
