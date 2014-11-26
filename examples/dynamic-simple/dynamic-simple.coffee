React = require('react')
FormHandler = require '../../containers/mixins/Handler'
DynamicSimpleFormDef = require './DynamicSimpleFormDef'
window.React = React

window.services = {

  # This is a mock static service that could also rely on
  # network requests
  cityService:
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

}

window.adapters = {
  abstractAdapter:
    genericSelectName: (item) ->
      value: item.id
      displayName: item.name

    genericDropDown: (data, blank = true) ->
      if data.data
        data = data.data
      options = _.map data, @genericSelectName
      if blank
        options.unshift {value: '', displayName: ''}
      options
}

DynamicSimple = React.createClass(
  mixins: [FormHandler]

  getDefaultProps: ->
    formDef: DynamicSimpleFormDef

  onSubmit: (callback) ->
    console.log "FormData: ", @state.formData
    callback()

  render: ->
    @renderForm()
)

React.render(React.createFactory(DynamicSimple)(), document.getElementById('example'))