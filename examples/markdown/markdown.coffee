React = require('react')
FormHandler = require '../../containers/mixins/Handler'
MarkdownFormDef = require './MarkdownFormDef'

window.React = React

Markdown = React.createClass(
  mixins: [FormHandler]

  getDefaultProps: ->
    formDef: MarkdownFormDef

  onSubmit: (callback) ->
    console.log "FormData: ", @state.formData
    callback()

  render: ->
    @renderForm()
)

React.renderComponent(Markdown(), document.getElementById('example'))