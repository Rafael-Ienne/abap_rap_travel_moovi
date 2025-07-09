CLASS lhc_ZI_TRAVEL_MRI DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zi_travel_mri RESULT result.
    METHODS earlynumbering_cba_booking FOR NUMBERING
      IMPORTING entities FOR CREATE zi_travel_mri\_booking.
    METHODS earlynumbering_create FOR NUMBERING
      IMPORTING entities FOR CREATE zi_travel_mri.

ENDCLASS.

CLASS lhc_ZI_TRAVEL_MRI IMPLEMENTATION.

  METHOD get_instance_authorizations.

  ENDMETHOD.

  METHOD earlynumbering_create.

    SELECT SINGLE MAX( travel_id )
      FROM zrap_travel_mri
      INTO @DATA(lv_id).

    lv_id = lv_id + '1'.

    LOOP AT entities ASSIGNING FIELD-SYMBOL(<fl_entity>).
      APPEND VALUE #( %cid = <fl_entity>-%cid
                      travelid = lv_id ) TO mapped-zi_travel_mri.
    ENDLOOP.

  ENDMETHOD.

  METHOD earlynumbering_cba_Booking.

    READ ENTITIES OF zi_travel_mri IN LOCAL MODE
    ENTITY zi_travel_mri BY \_Booking
    FROM CORRESPONDING #( entities )
    LINK DATA(lt_linked_data).

    DATA(lv_id) = REDUCE #( INIT lv_maximo = CONV /dmo/booking_id( '0' )
                          FOR ls_linked_data IN lt_linked_data
                           NEXT lv_maximo = COND #( WHEN lv_maximo < ls_linked_data-target-BookingId THEN ls_linked_data-target-BookingId ELSE lv_maximo ) ).

    LOOP AT entities ASSIGNING FIELD-SYMBOL(<fl_entity>).
      LOOP AT <fl_entity>-%target ASSIGNING FIELD-SYMBOL(<fl_booking>).
        APPEND CORRESPONDING #( <fl_booking> ) TO mapped-zi_booking_mri ASSIGNING FIELD-SYMBOL(<fl_mapped>).
        IF <fl_mapped> IS ASSIGNED AND <fl_mapped>-BookingId IS INITIAL.
          <fl_mapped>-BookingId = lv_id + 1.
        ENDIF.
      ENDLOOP.
    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
