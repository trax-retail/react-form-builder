React = require('react')
FormHandler = require '../../mixins/FormHandlerMixin'
DynamicFormDef = require './DynamicFormDef'
window.React = React

window.services = {

  # This is a mock static service that could also rely on
  # network requests
  cityService:
    loadCities: (callback) ->
      callback.success [{id: 0, name: "San Francisco"}, {id: 1, name: "Lyon"}, {id: 2, name: "Barcelona"}]

    loadCityFormDef: (cityId, callback) ->
      if cityId[0] == "0"
        callback.success
          type: 'form'
          components: [
            type: 'radio-buttons'
            dataKey: 'radiobuttons'
            displayName: 'Radio Buttons'
            dataType: 'string'
            dataSources: {
              options:
                type: 'inline'
                data: [{value: 0, displayName: "SoMa"}, {value: 1, displayName: "Mission"}, {value: 2, displayName: "Fillmore"}]
            }
          ]
      else if cityId[0] == "1"
        callback.success
          type: 'form'
          components: [
            type: 'drop-down'
            dataKey: 'dropdown'
            displayName: 'Drop Down'
            dataType: 'string'
            dataSources: {
              options:
                type: 'inline'
                data: [{value: 0, displayName: "Les Pentes"}, {value: 1, displayName: "Presqu'ile"}, {value: 2, displayName: "Gerland"}]
            }
          ]
      else if cityId[0] == "2"
        callback.success
          type: 'form'
          components: [
            type: 'text-field'
            dataKey: 'textfield'
            displayName: 'Text Field'
            dataType: 'string'
           ]
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

DynamicDef = React.createClass(
  mixins: [FormHandler]

  getDefaultProps: ->
    formDef: DynamicFormDef

  onSubmit: (callback) ->
    console.log "FormData: ", @state.formData
    callback()

  render: ->
    @renderForm()
)

React.renderComponent(DynamicDef(), document.getElementById('example'))