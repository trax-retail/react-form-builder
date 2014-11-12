React = require('react')
FormHandler = require '../../containers/mixins/Handler'
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

React.render(DroppableFileSelect(), document.getElementById('example'))