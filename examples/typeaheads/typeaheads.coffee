React = require('react')
TypeaheadsFormDef = require './TypeaheadsFormDef'
FormHandler = require '../../src/containers/mixins/Handler'
_ = require('lodash')
window.React = React

Typeaheads = React.createClass(
  mixins: [FormHandler]

  getDefaultProps: ->
    formDef: TypeaheadsFormDef

  onSubmit: (callback) ->
    console.log "FormData: ", @state.formData
    callback()

  render: ->
    @renderForm()
)

React.render(React.createFactory(Typeaheads)(), document.getElementById('example'))
