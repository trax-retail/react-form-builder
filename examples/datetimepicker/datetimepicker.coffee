React = require('react')
FormHandler = require '../../containers/mixins/Handler'
DateTimePickerFormDef = require './DateTimePickerFormDef'

window.React = React

DateTimePicker = React.createClass(
  mixins: [FormHandler]

  getDefaultProps: ->
    formDef: DateTimePickerFormDef

  onSubmit: (callback) ->
    console.log "FormData: ", @state.formData
    callback()

  render: ->
    @renderForm()
)

React.renderComponent(DateTimePicker(), document.getElementById('example'))