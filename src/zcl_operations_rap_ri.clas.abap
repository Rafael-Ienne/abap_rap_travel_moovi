CLASS zcl_operations_rap_ri DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_operations_rap_ri IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

*    MODIFY ENTITY zi_travel_mri
*    CREATE FROM VALUE #( ( %cid = 'cid'
*                           %data-BeginDate = '20250630'
*                           %control-BeginDate = if_abap_behv=>mk-on ) )
*                           FAILED DATA(lt_failed)
*                           REPORTED DATA(lt_reported)
*                           MAPPED DATA(lt_mapped).
*
*    IF lt_failed IS INITIAL AND lt_reported IS INITIAL.
*      COMMIT ENTITIES.
*    ENDIF.

*    MODIFY ENTITIES OF zi_travel_mri
*    ENTITY zi_travel_mri
*    CREATE FROM VALUE #( (  %cid = 'cid'
*                         %data-BeginDate = '20250706'
*                         %control-BeginDate = if_abap_behv=>mk-on ) )
*                         CREATE BY \_Booking
*                         FROM VALUE #( ( %cid_ref = 'cid'
*                                         %target = VALUE #( (  %cid = 'cidBook'
*                                                               %data-bookingDate = '20250706'
*                                                               %control-bookingDate = if_abap_behv=>mk-on ) ) ) )
*                                                               FAILED DATA(lt_failed)
*                                                               REPORTED DATA(lt_reported)
*                                                               MAPPED DATA(lt_mapped).
*
*    IF lt_failed IS INITIAL AND lt_reported IS INITIAL.
*      COMMIT ENTITIES.
*    ENDIF.

*    MODIFY ENTITY zi_travel_mri
*        DELETE FROM VALUE #( (  %key-TravelId = '00004138' ) )
*                                                                   FAILED DATA(lt_failed)
*                                                                   REPORTED DATA(lt_reported)
*                                                                   MAPPED DATA(lt_mapped).
*
*    IF lt_failed IS INITIAL AND lt_reported IS INITIAL.
*      COMMIT ENTITIES.
*    ENDIF.

*    MODIFY ENTITY zi_travel_mri
*    UPDATE FROM VALUE #( ( %key-TravelId = '00004139'
*                            %data-BeginDate = '20250101'
*                            %control-BeginDate = if_abap_behv=>mk-on  ) )
*                            FAILED DATA(lt_failed)
*                                                                   REPORTED DATA(lt_reported)
*                                                                   MAPPED DATA(lt_mapped).
*
*    IF lt_failed IS INITIAL AND lt_reported IS INITIAL.
*      COMMIT ENTITIES.
*    ENDIF.

    MODIFY ENTITY zi_travel_mri
   UPDATE FIELDS ( BeginDate )
   WITH VALUE #( ( %key-TravelId = '00004139'
                           %data-BeginDate = '20250102' ) )
                           FAILED DATA(lt_failed)
                           REPORTED DATA(lt_reported)
                           MAPPED DATA(lt_mapped).

    IF lt_failed IS INITIAL AND lt_reported IS INITIAL.
      COMMIT ENTITIES.
    ENDIF.

  ENDMETHOD.

ENDCLASS.
