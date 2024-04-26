CLASS lhc_MovieD DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Movie RESULT result.


    METHODS checkGenre FOR VALIDATE ON SAVE
      IMPORTING keys FOR Movie~checkGenre.
    METHODS precheck_create FOR PRECHECK
      IMPORTING entities FOR CREATE Movie.
*
    METHODS precheck_update FOR PRECHECK
      IMPORTING entities FOR UPDATE Movie.

ENDCLASS.

CLASS lhc_MovieD IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD checkGenre.

    READ ENTITIES OF zmo_i_movie_d IN LOCAL MODE
       ENTITY Movie
       ALL FIELDS WITH CORRESPONDING #( keys )
       RESULT DATA(movie_read).

    LOOP AT movie_read INTO DATA(movie).

      IF movie-GenreId IS INITIAL.

        APPEND INITIAL LINE TO failed-movie ASSIGNING FIELD-SYMBOL(<movie_failed>).
*        USE TKY!!!!
        <movie_failed>-%tky = movie-%tky.

        APPEND INITIAL LINE TO reported-movie ASSIGNING FIELD-SYMBOL(<movie_reported>).
        <movie_reported>-%tky = movie-%tky.
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

  METHOD precheck_create.
  ENDMETHOD.

  METHOD precheck_update.

    LOOP AT entities INTO DATA(movie)
                        WHERE %control-GenreId EQ if_abap_behv=>mk-on.

      IF movie-GenreId IS INITIAL.

        APPEND INITIAL LINE TO failed-movie ASSIGNING FIELD-SYMBOL(<movie_failed>).
*        USE TKY!!!!
        <movie_failed>-%tky = movie-%tky.

        APPEND INITIAL LINE TO reported-movie ASSIGNING FIELD-SYMBOL(<movie_reported>).
        <movie_reported>-%tky = movie-%tky.
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
