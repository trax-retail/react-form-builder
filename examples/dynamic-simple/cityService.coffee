module.exports = cityService =
  loadCities: (callback) ->
    callback.success [{id: 0, name: "San Francisco"}, {id: 1, name: "Lyon"}, {id: 2, name: "Barcelona"}]

  loadNeighborhoodsWithCityId: (cityId, callback) ->
    response =
      if cityId[0] == "0"
        [{id: 0, name: "SoMa"}, {id: 1, name: "Mission"}, {id: 2, name: "Fillmore"}]
      else if cityId[0] == "1"
        [{id: 0, name: "Les Pentes"}, {id: 1, name: "Presqu'ile"}, {id: 2, name: "Gerland"}]
      else if cityId[0] == "2"
        [{id: 0, name: "Barri Gotic"}, {id: 1, name: "Passeig de Gracia"}, {id: 2, name: "Barceloneta"}]
    callback.success response
