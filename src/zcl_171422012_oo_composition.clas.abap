CLASS zcl_171422012_oo_composition DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
      INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_171422012_oo_composition IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.

DATA(lo_order_manager) = NEW zcl_order_management( io_out = out ).

DATA(ls_order) = VALUE zcl_order_management=>ty_order(
order_id = 'SO-2026-0001'
customer   = 'Ahmet Yılmaz'
product    = 'Endüstriyel Pompa'
quantity   = 3
      unit_price = '4500.00'
      tax_rate   = '0.20'
      ).

      lo_order_manager->create_order( ls_order ).
      ENDMETHOD.
ENDCLASS.
