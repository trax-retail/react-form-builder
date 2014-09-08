React = require('react')
FormHandler = require '../../mixins/Handler'
TypeaheadsFormDef = require './TypeaheadsFormDef'
_ = require('lodash')
window.React = React

window.services = {

  # This is a mock static service that could also rely on
  # network requests
  cityService:
    loadCitiesByName: (search, callback) ->
      collection = [{id: 0, name: "San Francisco"}, {id: 1, name: "Lyon"}, {id: 2, name: "Barcelona"}]
      regexp = new RegExp(search[0]+'+', 'i') if search[0] != ''
      callback.success _.filter collection, (item) ->
        search[0] != '' && regexp.test(item.name)

    loadNeighborhoodsByName: (search, callback) ->
      collection = [{id: 0, name: "SoMa"}, {id: 1, name: "Mission"}, {id: 2, name: "Fillmore"}, {id: 3, name: "Les Pentes"}, {id: 4, name: "Presqu'ile"}, {id: 5, name: "Gerland"}, {id: 6, name: "Barri Gotic"}, {id: 7, name: "Passeig de Gracia"}, {id: 8, name: "Barceloneta"}]
      regexp = new RegExp(search[0]+'+', 'i') if search[0] != ''
      callback.success _.filter collection, (item) ->
        search[0] != '' && regexp.test(item.name)

}

window.adapters = {
  abstractAdapter:
    genericSelectName: (item) ->
      value: item.id
      displayName: item.name

    genericDropDown: (data, blank = false) ->
      if data.data
        data = data.data
      options = _.map data, @genericSelectName
      if blank
        options.unshift {value: '', displayName: ''}
      options
}

Typeaheads = React.createClass(
  mixins: [FormHandler]

  getDefaultProps: ->
    formDef: TypeaheadsFormDef

  onSubmit: (callback) ->
    console.log "FormData: ", @state.formData
    callback()

  render: ->
    @renderForm()
)

React.renderComponent(Typeaheads(), document.getElementById('example'))