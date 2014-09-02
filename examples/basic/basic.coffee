React = require('react')
FormHandler = require '../../mixins/FormHandlerMixin'
BasicFormDef = require './BasicFormDef'

window.React = React

Basic = React.createClass(
  mixins: [FormHandler]

  getDefaultProps: ->
    formDef: BasicFormDef

  onSubmit: (callback) ->
    console.log "FormData: ", @state.formData
    callback()

  render: ->
    @renderForm()
)

React.renderComponent(Basic(), document.getElementById('example'))