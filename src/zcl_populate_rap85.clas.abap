CLASS zcl_populate_rap85 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_POPULATE_RAP85 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    INSERT zrap_travel_mri FROM ( SELECT *
    FROM /dmo/travel ).

    IF sy-subrc IS INITIAL.
      COMMIT WORK.
    ELSE.
      ROLLBACK WORK.
    ENDIF.

    INSERT zrap_booking_mri FROM ( SELECT *
    FROM /dmo/booking ).

    IF sy-subrc IS INITIAL.
      COMMIT WORK.
    ELSE.
      ROLLBACK WORK.
    ENDIF.

    INSERT zrap_book_su_mri FROM ( SELECT *
    FROM /dmo/book_suppl ).

    IF sy-subrc IS INITIAL.
      COMMIT WORK.
    ELSE.
      ROLLBACK WORK.
    ENDIF.


  ENDMETHOD.
ENDCLASS.
