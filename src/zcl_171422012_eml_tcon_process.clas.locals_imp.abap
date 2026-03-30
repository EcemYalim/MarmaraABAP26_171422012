CLASS lcl_connection_eml DEFINITION.

  PUBLIC SECTION.
    CLASS-METHODS:
*      insert_data,
*      read_data.
*        update_data.
        delete_data.

ENDCLASS.


CLASS lcl_connection_eml IMPLEMENTATION.
*    METHOD insert_data.
*      DATA: lt_create TYPE TABLE FOR CREATE zr_tcon_171422012.
*      lt_create = VALUE #(
*      ( %cid = 'C1'
*      Carrid = 'LH'
*      Connid = '0400'
*      AirportFrom = 'FRA'
*      CityFrom = 'Frankfurt'
*      CountryFrom = 'DE'
*      AirportTo = 'JFK'
*      CityTo = 'New York'
*      CountryTo = 'US' )

*      ( %cid ='C2'
*      Carrid = 'TK'
*      Connid = '1923'
*      AirportFrom = 'IST'
*      CityFrom = 'Istanbul'
*      CountryFrom = 'TR'
*      AirportTo = 'TKJ'
*      CityTo = 'Izmir'
*      CountryTo = 'TR' )
*       ).

*    MODIFY ENTITIES OF zr_tcon_171422012
*    ENTITY ZrTcon171422012
*    CREATE FIELDS (
*    Carrid
*    Connid
*    AirportFrom
*    CityFrom
*    CountryFrom
*    AirportTo
*    CityTo
*    CountryTo ) WITH lt_create
*    FAILED DATA(ls_failed).

*    IF ls_failed IS INITIAL.
*      COMMIT ENTITIES.
*    ENDIF.
*    ENDMETHOD.

*    METHOD read_data.
*    DATA read_keys TYPE TABLE FOR READ IMPORT zr_tcon_171422012.
*    DATA connections TYPE TABLE FOR READ RESULT zr_tcon_171422012.
*
*    read_keys = VALUE #( ( uuid = '2E4B1E2B65EC1FE18B85DBC321A525F1' ) ) .
*
*    READ ENTITIES OF zr_tcon_171422012
*    ENTITY ZrTcon171422012
*    ALL FIELDS
*    WITH CORRESPONDING #( read_keys )
*    RESULT connections.
*
*    ENDMETHOD.

*      METHOD update_data.
*
*    DATA lt_update TYPE TABLE FOR UPDATE zr_tcon_171422012.
*
*    SELECT uuid
*      FROM ztcon_171422012
*      where uuid = '2E4B1E2B65EC1FE18B85DBC321A525F1'
*      INTO TABLE @DATA(lt_keys)
*      UP TO 1 ROWS.
*
*    LOOP AT lt_keys INTO DATA(ls_key).
*
*      lt_update = VALUE #(
*        (
*          uuid = ls_key-uuid
*          CityTo = 'Paris'
*          %control-CityTo = if_abap_behv=>mk-on
*        )
*      ).
*
*    ENDLOOP.
*
*    MODIFY ENTITIES OF zr_tcon_171422012
*      ENTITY ZrTcon171422012
*      UPDATE FROM lt_update
*      FAILED   DATA(ls_failed).
*
*    IF ls_failed IS INITIAL.
*      COMMIT ENTITIES.
*    ENDIF.
*
*  ENDMETHOD.

 METHOD delete_data.

    DATA lt_delete TYPE TABLE FOR DELETE zr_tcon_171422012.

    lt_delete = VALUE #( ( uuid = '2E4B1E2B65EC1FE18B85DBC321A525F1' ) ).

    MODIFY ENTITIES OF zr_tcon_171422012
      ENTITY ZrTcon171422012
      DELETE FROM lt_delete
      FAILED   DATA(ls_failed).

    IF ls_failed IS INITIAL.
      COMMIT ENTITIES.
    ENDIF.

  ENDMETHOD.

ENDCLASS.
