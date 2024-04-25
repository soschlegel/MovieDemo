@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Draft Movie View'
@Search.searchable: true

define root view entity ZMO_I_MOVIE_D
  as select from zmo_a_movie
  association [0..1] to ZMO_I_GENRE as _Genre on $projection.GenreId = _Genre.Id
{
  key guid            as Guid,  
      @Search.defaultSearchElement: true

      title           as Title,
      release_year    as ReleaseYear,
      director        as Director,
      genre_id        as GenreId,
      _Genre.Name     as GenreName,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at as LastChangedAt,
      _Genre
}
