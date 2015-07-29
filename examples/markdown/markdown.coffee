React = require('react')
MarkdownFormDef = require './MarkdownFormDef'
FormHandler = require '../../src/containers/mixins/Handler'

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

React.render(React.createFactory(Markdown)(), document.getElementById('example'))
