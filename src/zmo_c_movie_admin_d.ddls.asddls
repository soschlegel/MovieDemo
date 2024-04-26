@EndUserText.label: 'Movie Draft Projection View for Admins'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity ZMO_C_MOVIE_ADMIN_D
  provider contract transactional_query
  as projection on ZMO_I_MOVIE_D
  association [0..*] to ZMO_C_MOVIE_ADMIN_D as _MovieByGenre on _MovieByGenre.GenreId = $projection.GenreId
{
      @UI.facet: [ { id:              'Movie',
                       purpose:         #STANDARD,
                       type:            #IDENTIFICATION_REFERENCE,
                       label:           'Movie',
                       position:        10 },
                    { id:              'Genre',
                      purpose:         #STANDARD,
                      type:            #LINEITEM_REFERENCE,
                      label:           'Andere Filme des Genres',
                            targetElement: '_MovieByGenre',
                      position:        20 }
                              ]

      //      @UI: {     lineItem:       [ {
      //        position: 10, importance: #HIGH
      //      } ],
      //                    identification: [ { position: 10, label: 'Id' } ] }
      @UI.hidden: true
  key Guid,

      @UI: {
           lineItem: [ { position: 20, label: 'Title' }
            ],
           identification:[ { position: 20, label: 'Title' }

                          ]
             }
      @UI.selectionField: [ { position: 1 } ]
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @Semantics.text: true
      Title,
      @UI: {
          lineItem: [ { position: 30, label: 'ReleaseYear' } ],
          identification:[ { position: 30, label: 'ReleaseYear' }
                         ]
            }
      @Search.defaultSearchElement: true
      ReleaseYear,
      @UI: {
       lineItem: [ { position: 40, label: 'Director' } ],
       identification:[ { position: 40, label: 'Director' }
                      ]
         }
      @UI.selectionField: [ { position: 2 } ]
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      Director,
      @UI: {
          lineItem:       [ { position: 50, label: 'Genre', importance: #HIGH } ],
          identification: [ { position: 50, label: 'Genre' } ]
      //          selectionField: [ { position: 3 } ]
        }
      @Consumption.valueHelpDefinition: [{
        entity: { name: 'ZMO_I_GENRE', element: 'Id' }
//        ##HELP
//        ,useForValidation: true        
      }]
      @ObjectModel.text.element: ['GenreName']
      @UI.textArrangement: #TEXT_ONLY
      //      @Search.defaultSearchElement: true
      GenreId,
      @UI.hidden: true
      GenreName,
      @UI: {
      lineItem: [ { position: 60, label: 'LastChanged' } ],
      identification:[ { position: 60, label: 'LastChanged' }
                  ]
      }
      @UI.hidden: true
      LastChangedAt,
      /* Associations */
      _Genre,
      _MovieByGenre
}
