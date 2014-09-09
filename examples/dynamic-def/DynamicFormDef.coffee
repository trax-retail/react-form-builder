DynamicFormDef =
  type: 'form'
  components: [
    {
      type: 'drop-down'
      dataKey: 'city_id'
      displayName: 'City'
      dataSources: {
        options:
          type: 'service'
          service: 'cityService.loadCities'
          adapter: 'abstractAdapter.genericDropDown'
      }
    },
    {
      type: 'dynamic-def'
      dataKey: 'dynamic-def'
      dataSources: {
        formDef:
          type: 'service'
          service: 'cityService.loadCityFormDef'
          dependentKeys: ['city_id']
          args: ['${city_id}']
      }
    }
  ]

module.exports = DynamicFormDef