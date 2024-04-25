@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Movie View - CDS Data Model'
define root view entity ZMO_I_MOVIE
  as select from zmo_a_movie
  association [0..1] to ZMO_I_GENRE as _Genre on $projection.GenreId = _Genre.Id
{
  key guid            as Guid,  
      @Search.defaultSearchElement: true
      title           as Title,
      release_year    as ReleaseYear,
      director        as Director,
      genre_id        as GenreId,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at as LastChangedAt,
      _Genre
}
