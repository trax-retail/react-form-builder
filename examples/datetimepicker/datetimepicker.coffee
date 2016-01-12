React = require('react')
ReactDOM = require('react-dom')
FormHandler = require '../../src/containers/mixins/Handler'
DateTimePickerFormDef = require './DateTimePickerFormDef'

window.React = React

DateTimePicker = React.createClass(
  mixins: [FormHandler]

  getDefaultProps: ->
    formDef: DateTimePickerFormDef
    formData:
      datetime: "06/05/90 7:00 AM"

  onSubmit: (callback) ->
    console.log "FormData: ", @state.formData
    callback()

  render: ->
    @renderForm()
)

ReactDOM.render(React.createFactory(DateTimePicker)(), document.getElementById('example'))
