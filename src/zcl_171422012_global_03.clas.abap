CLASS zcl_171422012_global_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_171422012_global_03 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA connection TYPE REF TO lcl_connection.
    DATA connections TYPE TABLE OF REF TO lcl_connection.
    DATA: carrier_id     TYPE /dmo/carrier_id,
          connection_id  TYPE /dmo/connection_id,
          status         TYPE i,
          flight_date    TYPE dats.

    " Create first connection
    TRY.
        connection = NEW #( i_carrier_id    = 'IH'
                            i_connection_id = '0400'
                            i_status        = 1
                            i_flight_date   = '20260315' ).

        APPEND connection TO connections.
      CATCH cx_ABAP_INVALID_VALUE.
        out->write( 'Method call failed' ).
    ENDTRY.

    " Create second connection
    TRY.
        connection = NEW #( i_carrier_id    = 'AA'
                            i_connection_id = '0017'
                            i_status        = 2
                            i_flight_date   = '20260320' ).

        APPEND connection TO connections.
      CATCH cx_ABAP_INVALID_VALUE.
        out->write( 'Method call failed' ).
    ENDTRY.

    " Loop over connections and print attributes
    LOOP AT connections INTO connection.
      connection->get_attributes(
          IMPORTING
              e_carrier_id    = carrier_id
              e_connection_id = connection_id
              e_status        = status
              e_flight_date   = flight_date ).

      out->write( |Flight connection { carrier_id } { connection_id } |
                  && |Status: { status } |
                  && |Flight Date: { flight_date }| ).
    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
