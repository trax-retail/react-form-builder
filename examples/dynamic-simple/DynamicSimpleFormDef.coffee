DynamicSimpleFormDef =
  type: 'form'
  title: 'Dynamic Simple'
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
    }
    {
      type: 'drop-down'
      dataKey: 'neighborhood_id'
      displayName: 'Neighborhood'
      dataSources: {
        options:
          type: 'service'
          dependentKeys: ['city_id']
          service: 'cityService.loadNeighborhoodsWithCityId'
          args: ['${city_id}']
          adapter: 'abstractAdapter.genericDropDown'
      }
    }
  ]

module.exports = DynamicSimpleFormDef