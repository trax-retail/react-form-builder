React = require('react')
ReactDOM = require('react-dom')
FormHandler = require '../../src/containers/mixins/Handler'
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

ReactDOM.render(React.createFactory(Basic)(), document.getElementById('example'))
