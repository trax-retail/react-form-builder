React = require('react')
FormHandler = require '../../mixins/FormHandlerMixin'
DroppableFileSelectFormDef = require './DroppableFileSelectFormDef'

window.React = React

DroppableFileSelect = React.createClass(
  mixins: [FormHandler]

  getDefaultProps: ->
    formDef: DroppableFileSelectFormDef

  onSubmit: (callback) ->
    console.log "FormData: ", @state.formData
    callback()

  render: ->
    @renderForm()
)

React.renderComponent(DroppableFileSelect(), document.getElementById('example'))