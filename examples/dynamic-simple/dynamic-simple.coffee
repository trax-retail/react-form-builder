React = require('react')
DynamicSimpleFormDef = require './DynamicSimpleFormDef'
FormHandler = require '../../src/containers/mixins/Handler'
window.React = React

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
