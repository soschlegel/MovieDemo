CLASS zmo_lsc_create_db_values DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS insert_into_table IMPORTING i_out TYPE REF TO if_oo_adt_classrun_out.
    METHODS delete_table IMPORTING i_out TYPE REF TO if_oo_adt_classrun_out.
    METHODS read_values IMPORTING i_out TYPE REF TO if_oo_adt_classrun_out.
ENDCLASS.



CLASS zmo_lsc_create_db_values IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    delete_table( out ).
    insert_Into_Table( out ).
    read_values( out ).
  ENDMETHOD.

  METHOD delete_table.
    DELETE FROM zmo_a_genre.
    DELETE FROM zmo_a_movie.
    i_out->write( |=======================| ).
    i_out->write( |DB Genre und Movie deleted| ).
  ENDMETHOD.

  METHOD insert_into_table.
    DATA lt_genres TYPE TABLE OF zmo_a_genre.
    DATA lt_movies TYPE TABLE OF zmo_a_movie.

    lt_genres = VALUE #( ( id = '1' name = 'Action' )
                         ( id = '2' name = 'Comedy' )
                         ( id = '3' name = 'Drama' )
                         ( id = '4' name = 'Sci-Fi' )
                         ( id = '5' name = 'Fantasy' )
                         ( id = '6' name = 'Crime' )
                         ( id = '7' name = 'War' ) ).
    INSERT zmo_a_genre FROM TABLE @lt_genres.
    i_out->write( |=======Genre Data added===========| ).

    DATA(system_uuid) = cl_uuid_factory=>create_system_uuid( ).

    lt_movies = VALUE #(
        ( guid =  system_uuid->create_uuid_x16( )  title = 'Inception' release_year = '2010' director = 'Christopher Nolan' genre_id = '4' )
        ( guid         = system_uuid->create_uuid_x16( )
          title        = 'Der Herr der Ringe: Die Gefährten'
          release_year = '2001'
          director     = 'Peter Jackson'
          genre_id     = '5' )
        ( guid =  system_uuid->create_uuid_x16( )  title = 'Pulp Fiction' release_year = '1994' director = 'Quentin Tarantino' genre_id = '6' )
        ( guid =  system_uuid->create_uuid_x16( )  title = 'Matrix' release_year = '1999' director = 'Lana Wachowski' genre_id = '4' )
        ( guid =  system_uuid->create_uuid_x16( )  title = 'Forrest Gump' release_year = '1994' director = 'Robert Zemeckis' genre_id = '3' )
        ( guid =  system_uuid->create_uuid_x16( )  title = 'The Dark Knight' release_year = '2008' director = 'Christopher Nolan' genre_id = '1' )
        ( guid =  system_uuid->create_uuid_x16( )  title = 'Fight Club' release_year = '1999' director = 'David Fincher' genre_id = '3' )
        ( guid =  system_uuid->create_uuid_x16( )  title = 'Star Wars: Episode IV - Eine neue Hoffnung' release_year = '1977' director = 'George Lucas' genre_id = '4' )
*        ( id = '9' title = 'Inglourious Basterds' release_year = '2009' director = 'Quentin Tarantino' genre_id = '7' )
*        ( id = '10' title = 'The Shawshank Redemption' release_year = '1994' director = 'Frank Darabont' genre_id = '3' )
*        ( id = '11' title = 'Hangover' release_year = '2009' director = 'Todd Phillips' genre_id = '2' )
*        ( id = '12' title = 'Good Boys' release_year = '2019' director = 'Gene Stupnitsky' genre_id = '2' ) ).
).
    INSERT zmo_a_movie FROM TABLE @lt_movies.
    i_out->write( |=======Movie Data added===========| ).
  ENDMETHOD.

  METHOD read_values.
    i_out->write( |=======DB Genre===========| ).
    SELECT * FROM zmo_a_genre INTO TABLE @DATA(lt_genres).
    LOOP AT lt_genres INTO DATA(ls_genre).
      i_out->write( |id: { ls_genre-id }  Name: { ls_genre-name } | ).
    ENDLOOP.

    i_out->write( |=======DB Movie===========| ).
    SELECT * FROM zmo_a_movie INTO TABLE @DATA(lt_movies).
    LOOP AT lt_movies INTO DATA(ls_movie).
      i_out->write( |id: { ls_movie-guid }  Title: { ls_movie-title } | ).
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
