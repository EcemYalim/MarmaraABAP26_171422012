CLASS zcl_171422012_vehicle_demo_4 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_171422012_vehicle_demo_4 IMPLEMENTATION.

    METHOD if_oo_adt_classrun~main.
        DATA:
            lt_insert TYPE TABLE OF zvhc_171422012.
            DELETE FROM zvhc_171422012.
            DATA lv_ts TYPE timestampl.
            GET TIME STAMP FIELD lv_ts.


            lt_insert = VALUE #( (
            client = sy-mandt
            id = 1
            type = 'CAR'
            brand = 'BMW'
            model = '320'
            doors = 4
            capacity = 0
            passengers = 0
            engine_cc = 0
            local_created_by = sy-uname
            local_created_at = lv_ts )

            (
            client = sy-mandt
            id = 2
            type = 'TRUCK'
            brand = 'BMQSF'
            model = '320123'
            doors = 0
            capacity = 4
            passengers = 0
            engine_cc = 0
            local_created_by = sy-uname
            local_created_at = lv_ts )

            (
            client = sy-mandt
            id = 3
            type = 'BUS'
            brand = 'BMqfsşW'
            model = '321230'
            doors = 0
            capacity = 0
            passengers = 20
            engine_cc = 0
            local_created_by = sy-uname
            local_created_at = lv_ts )

            (
            client = sy-mandt
            id = 4
            type = 'MOTORCYCLE'
            brand = 'BMW'
            model = '3202'
            doors = 0
            capacity = 0
            passengers = 0
            engine_cc = 1000
            local_created_by = sy-uname
            local_created_at = lv_ts ) ).

            INSERT zvhc_171422012 FROM TABLE @lt_insert.

            out->write( 'DATA INSERTED' ).

    ENDMETHOD.
ENDCLASS.
