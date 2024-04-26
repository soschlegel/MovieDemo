CLASS lhc_Movie DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Movie RESULT result.
    METHODS checkgenre FOR VALIDATE ON SAVE
      IMPORTING keys FOR movie~checkgenre.



ENDCLASS.

CLASS lhc_Movie IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD checkGenre.

    READ ENTITIES OF zmo_i_movie IN LOCAL MODE
        ENTITY Movie
        ALL FIELDS WITH CORRESPONDING #( keys )
        RESULT DATA(movie_read).

    LOOP AT movie_read INTO DATA(movie).

      IF movie-GenreId IS INITIAL.

        APPEND INITIAL LINE TO failed-movie ASSIGNING FIELD-SYMBOL(<movie_failed>).
        <movie_failed>-%key = movie-%key.

        APPEND INITIAL LINE TO reported-movie ASSIGNING FIELD-SYMBOL(<movie_reported>).
        <movie_reported>-%key = movie-%key.
        <movie_reported>-%msg = new_message_with_text(
                                  severity = if_abap_behv_message=>severity-error
                                  text     = 'Genre muss gepflegt sein'
                                ).
        CONTINUE.
      ENDIF.

      SELECT SINGLE FROM zmo_i_genre
          FIELDS 'X'
          WHERE id = @movie-GenreId
          INTO @DATA(found).

      IF found NE abap_true.

        APPEND INITIAL LINE TO failed-movie ASSIGNING <movie_failed>.
*        USE TKY!!!!
        <movie_failed>-%tky = movie-%tky.

        APPEND INITIAL LINE TO reported-movie ASSIGNING <movie_reported>.
        <movie_reported>-%tky = movie-%tky.
        <movie_reported>-%msg = new_message_with_text(
                                  severity = if_abap_behv_message=>severity-error
                                  text     = |Genre { movie-GenreId } ist unbekannt|
                                ).
        CONTINUE.

      ENDIF.


    ENDLOOP.



  ENDMETHOD.

ENDCLASS.
