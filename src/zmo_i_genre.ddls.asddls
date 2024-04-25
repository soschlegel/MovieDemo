@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Genre View CDS Data Model'
@Search.searchable: true
define root view entity ZMO_I_GENRE
  as select from zmo_a_genre
  association [0..*] to ZMO_I_MOVIE as _Movie on _Movie.GenreId = $projection.Id
{
      @UI.facet: [ { id:              'Genre',
                 purpose:         #STANDARD,
                 type:            #IDENTIFICATION_REFERENCE,
                 label:           'Genre',
                 position:        10 }
                                  ]

      @UI: {     lineItem:       [ {
      position: 10, importance: #HIGH
      } ],
      identification: [ { position: 10, label: 'Id' } ] }
  key id   as Id,
      @UI: {
          lineItem: [ { position: 20, label: 'Name' } ],
          identification:[ { position: 20, label: 'Name' }
                         ]
            }
      @UI.selectionField: [ { position: 2 } ]
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      name as Name,
      _Movie
}
