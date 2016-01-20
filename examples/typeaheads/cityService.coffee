filter = require("lodash/filter")

module.exports = cityService =
  loadCitiesByName: (search, callback) ->
    collection = [{id: 0, name: "San Francisco"}, {id: 1, name: "Lyon"}, {id: 2, name: "Barcelona"}]
    regexp = new RegExp(search[0]+'+', 'i') if search[0] != ''
    callback.success filter collection, (item) ->
      search[0] != '' && regexp.test(item.name)

  loadNeighborhoodsByName: (search, callback) ->
    collection = [{id: 0, name: "SoMa"}, {id: 1, name: "Mission"}, {id: 2, name: "Fillmore"}, {id: 3, name: "Les Pentes"}, {id: 4, name: "Presqu'ile"}, {id: 5, name: "Gerland"}, {id: 6, name: "Barri Gotic"}, {id: 7, name: "Passeig de Gracia"}, {id: 8, name: "Barceloneta"}]
    regexp = new RegExp(search[0]+'+', 'i') if search[0] != ''
    callback.success filter collection, (item) ->
      search[0] != '' && regexp.test(item.name)
