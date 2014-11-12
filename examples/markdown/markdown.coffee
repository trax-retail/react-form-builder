React = require('react')
FormHandler = require '../../containers/mixins/Handler'
MarkdownFormDef = require './MarkdownFormDef'

window.React = React

window.services = {

  # This is a mock static service that could also rely on
  # network requests
  cityService:
    uploadCityImage: (file, callback) ->
      callback.success?(url: "http://m.c.lnkd.licdn.com/mpr/mpr/p/4/005/052/10a/0e7ce98.jpg")
      callback.complete?(url: "http://m.c.lnkd.licdn.com/mpr/mpr/p/4/005/052/10a/0e7ce98.jpg")
}

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