###* @jsx React.DOM ###

marked = require("marked")
React = require('react')

Markdown = React.createClass(
  propTypes:
    value: React.PropTypes.string
    alt: React.PropTypes.string

  getDefaultProps: ->
    alt: ""

  html: ->
    if @props.value then marked(@props.value) else @props.alt

  render: ->
    @transferPropsTo `<div dangerouslySetInnerHTML={{__html: this.html()}} />`
)

module.exports = Markdown