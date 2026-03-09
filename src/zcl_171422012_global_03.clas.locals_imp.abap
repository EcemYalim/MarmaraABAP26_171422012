CLASS lcl_connection DEFINITION.

  PUBLIC SECTION.

    CLASS-DATA conn_counter TYPE i.

    CLASS-METHODS class_constructor.

    METHODS constructor
      IMPORTING
        i_carrier_id    TYPE /dmo/carrier_id
        i_connection_id TYPE /dmo/connection_id
        i_status        TYPE i OPTIONAL
        i_flight_date   TYPE dats OPTIONAL
      RAISING
        cx_ABAP_INVALID_VALUE.

    METHODS set_attributes
      IMPORTING
        i_carrier_id    TYPE /dmo/carrier_id OPTIONAL
        i_connection_id TYPE /dmo/connection_id OPTIONAL
        i_status        TYPE i OPTIONAL
        i_flight_date   TYPE dats OPTIONAL.

    METHODS get_attributes
      EXPORTING
        e_carrier_id    TYPE /dmo/carrier_id
        e_connection_id TYPE /dmo/connection_id
        e_status        TYPE i
        e_flight_date   TYPE dats.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA carrier_id     TYPE /dmo/carrier_id.
    DATA connection_id  TYPE /dmo/connection_id.
    DATA status         TYPE i.       " Durum
    DATA flight_date    TYPE dats.    " Uçuş Tarihi

ENDCLASS.

CLASS lcl_connection IMPLEMENTATION.

  METHOD class_constructor.
  ENDMETHOD.

  METHOD constructor.
    " Basic validation
    IF i_carrier_id IS INITIAL OR i_connection_id IS INITIAL.
      RAISE EXCEPTION TYPE cx_abap_invalid_value.
    ENDIF.

    me->carrier_id    = i_carrier_id.
    me->connection_id = i_connection_id.

    " Set new fields if provided
    IF i_status IS NOT INITIAL.
      me->status = i_status.
    ENDIF.
    IF i_flight_date IS NOT INITIAL.
      me->flight_date = i_flight_date.
    ENDIF.

    conn_counter = conn_counter + 1.
  ENDMETHOD.

  METHOD set_attributes.
    IF i_carrier_id IS NOT INITIAL.
      carrier_id = i_carrier_id.
    ENDIF.
    IF i_connection_id IS NOT INITIAL.
      connection_id = i_connection_id.
    ENDIF.
    IF i_status IS NOT INITIAL.
      status = i_status.
    ENDIF.
    IF i_flight_date IS NOT INITIAL.
      flight_date = i_flight_date.
    ENDIF.
  ENDMETHOD.

  METHOD get_attributes.
    e_carrier_id    = carrier_id.
    e_connection_id = connection_id.
    e_status        = status.
    e_flight_date   = flight_date.
  ENDMETHOD.

ENDCLASS.
