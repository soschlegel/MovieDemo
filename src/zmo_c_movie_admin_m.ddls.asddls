@EndUserText.label: 'Movie Projection View for Admins'
@AccessControl.authorizationCheck: #NOT_REQUIRED

@UI: {
  headerInfo: { typeName: 'Movie', typeNamePlural: 'Movies', title: { type: #STANDARD, value: 'Title' } } }
@Search.searchable: true
define root view entity ZMO_C_MOVIE_ADMIN_M
  provider contract transactional_query
  as projection on ZMO_I_MOVIE
{
      @UI.facet: [{ id:              'Movie',
                   purpose:         #STANDARD,
                   type:            #IDENTIFICATION_REFERENCE,
                   label:           'Movie',
                   position:        10 },
                 { id:              'GenreId',
                   targetQualifier: 'Facet2',
                   purpose:         #STANDARD,
                   type:            #LINEITEM_REFERENCE,
                   label:           'Genre',
                   position:        20,
                   targetElement:   '_Genre' }
                   ]

      @UI: {     lineItem:       [ {
        position: 10, importance: #HIGH
      } ],
                    identification: [ { position: 10, label: 'Id' } ] }
      @UI.hidden: true
  key Guid,


      @UI: {
         lineItem: [ { position: 20, label: 'Title' }
          ],
         identification:[ { position: 20, label: 'Title' }
         ]}
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
      //      @Semantics.calendar.year: true
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
      lineItem:       [ { position: 50, label: 'GenreName',  importance: #HIGH } ],
      identification: [ { position: 50, label: 'GenreId' } ],
      selectionField: [ { position: 3 } ] }
      @ObjectModel.text.element: ['GenreName']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{
        entity:
            { name: 'ZMO_I_GENRE', element: 'Id' }
      // ##SEARCH
      //        ,useForValidation: true
      }]
      GenreId,
      _Genre.Name as GenreName,
      @UI: {
      lineItem: [ { position: 70, label: 'LastChanged' } ],
      identification:[ { position: 70, label: 'LastChanged' }
                   ]
      }
      @UI.hidden: true
      LastChangedAt,
      /* Associations */
      _Genre
}
