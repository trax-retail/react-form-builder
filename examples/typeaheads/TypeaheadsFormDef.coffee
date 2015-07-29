abstractAdapter = require('./abstractAdapter')
cityService = require('./cityService')

TypeaheadsFormDef =
  type: 'form'
  components: [
    {
      type: 'type-ahead-field'
      dataKey: 'city_id'
      displayName: 'Typeahead'
      dataSources:
        options:
          type: 'service'
          dependentKeys: ['city_id_typeahead']
          args: ['${city_id_typeahead}']
          service: cityService.loadCitiesByName
          adapter: abstractAdapter.genericDropDown
    },
    {
      type: 'multi-type-ahead-field'
      dataKey: 'neighborhood_ids'
      displayName: 'Multi Typeahead'
      dataSources:
        options:
          type: 'service'
          dependentKeys: ['neighborhood_ids_typeahead']
          args: ['${neighborhood_ids_typeahead}']
          service: cityService.loadNeighborhoodsByName
          adapter: abstractAdapter.genericDropDown
    }
  ]

module.exports = TypeaheadsFormDef
