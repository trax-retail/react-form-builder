React = require('react')
ReactDOM = require('react-dom')
FormHandler = require '../../src/containers/mixins/Handler'
FormGroupsFormDef = require './FormGroupsFormDef'

window.React = React

FormGroups = React.createClass(
  mixins: [FormHandler]

  getDefaultProps: ->
    formDef: FormGroupsFormDef

  onSubmit: (callback) ->
    console.log "FormData: ", @state.formData
    callback()

  render: ->
    @renderForm()
)

ReactDOM.render(React.createFactory(FormGroups)(), document.getElementById('example'))
