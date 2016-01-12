React = require('react')
ReactDOM = require('react-dom')
DynamicFormDef = require './DynamicFormDef'
FormHandler = require '../../src/containers/mixins/Handler.coffee'
window.React = React

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

ReactDOM.render(React.createFactory(DynamicDef)(), document.getElementById('example'))
