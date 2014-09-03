React = require('react')
FormHandler = require '../../mixins/FormHandlerMixin'
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

React.renderComponent(FormGroups(), document.getElementById('example'))