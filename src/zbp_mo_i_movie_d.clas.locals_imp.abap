CLASS lhc_MovieD DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR MovieD RESULT result.



    METHODS Resume FOR MODIFY
      IMPORTING keys FOR ACTION MovieD~Resume.

ENDCLASS.

CLASS lhc_MovieD IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.



  METHOD Resume.
  ENDMETHOD.

ENDCLASS.
