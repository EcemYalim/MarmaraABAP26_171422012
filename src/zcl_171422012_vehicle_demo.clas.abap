CLASS zcl_171422012_vehicle_demo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_171422012_vehicle_demo IMPLEMENTATION.

    METHOD if_oo_adt_classrun~main.
        DATA(lo_car) = NEW zcl_car(
         iv_brand = 'BMW'
         iv_model = '320'
         iv_doors = 4 ).

         DATA(lo_truck) = NEW zcl_truck(
         iv_brand = 'Volvo'
         iv_model = 'FH16'
         iv_capacity = 25 ).

         DATA(lo_bus) = NEW zcl_bus(
         iv_brand = 'ABC'
         iv_model = '3230'
         iv_passengers = 6 ).

         DATA(lo_motorcycle) = NEW zcl_motorcycle(
         iv_brand = 'ABCD'
         iv_model = '3231230'
         iv_engine_cc = 1000 ).

         TYPES tt_vehicles TYPE STANDARD TABLE OF REF TO zcl_vehicle WITH EMPTY KEY.

         DATA(lt_vehicles) = VALUE tt_vehicles(
         ( lo_car )
         ( lo_truck )
         ( lo_bus )
         ( lo_motorcycle ) ).

         LOOP AT lt_vehicles INTO DATA(lo_vehicle).
            out->write( |Type: { lo_vehicle->get_type(  ) }| ).
            out->write( lo_vehicle->get_description( ) ).
            out->write( '------------' ).
         ENDLOOP.

      ENDMETHOD.



ENDCLASS.
