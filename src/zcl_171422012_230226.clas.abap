CLASS zcl_171422012_230226 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_171422012_230226 IMPLEMENTATION.
    METHOD if_oo_adt_classrun~main.
    "Print Hello!
    out->write( 'Hello' ).

    "Data Declarations - Variables
    DATA: lv_integer TYPE i, "i:Integer
          lv_string TYPE string, "string: String
          lv_character TYPE c LENGTH 7, "c: Character
          lv_date TYPE d, "d: Date
          lv_packed TYPE p LENGTH 3 DECIMALS 3. "p: Packed Number LENGTH: Length of Digits Before Decimal Point and Decimal Point
          "                                      DECIMALS: Length of Decimal Places
   lv_integer = 6.
   lv_integer += 3.
   out->write( lv_integer ).

    ENDMETHOD.
ENDCLASS.
