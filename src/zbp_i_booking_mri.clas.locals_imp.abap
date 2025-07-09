CLASS lhc_zi_booking_mri DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS earlynumbering_cba_Booking_sup FOR NUMBERING
      IMPORTING entities FOR CREATE zi_booking_mri\_Booking_suppl.

ENDCLASS.

CLASS lhc_zi_booking_mri IMPLEMENTATION.

  METHOD earlynumbering_cba_Booking_sup.

    READ ENTITIES OF zi_travel_mri IN LOCAL MODE
      ENTITY zi_booking_mri BY \_Booking_Suppl
      FROM CORRESPONDING #( entities )
      LINK DATA(lt_linked_data).

    DATA(lv_id) = REDUCE #( INIT lv_maximo = CONV /dmo/booking_supplement_id( '0' )
                          FOR ls_linked_data IN lt_linked_data
                           NEXT lv_maximo = COND #( WHEN lv_maximo < ls_linked_data-target-BookingSupplementId THEN ls_linked_data-target-BookingSupplementId ELSE lv_maximo ) ).

    LOOP AT entities ASSIGNING FIELD-SYMBOL(<fl_entity>).
      LOOP AT <fl_entity>-%target ASSIGNING FIELD-SYMBOL(<fl_booking_su>).
        APPEND CORRESPONDING #( <fl_booking_su> ) TO mapped-zi_book_su_mri ASSIGNING FIELD-SYMBOL(<fl_mapped>).
        IF <fl_mapped> IS ASSIGNED AND <fl_mapped>-BookingSupplementId IS INITIAL.
          <fl_mapped>-BookingSupplementId = lv_id + 1.
        ENDIF.
      ENDLOOP.
    ENDLOOP.


  ENDMETHOD.

ENDCLASS.

*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
