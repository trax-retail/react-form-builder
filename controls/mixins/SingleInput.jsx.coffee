###* @jsx React.DOM ###

React = require 'react'

SingleInputMixin =
  propTypes:
    data: React.PropTypes.string
    dataKey: React.PropTypes.string.isRequired
    rows: React.PropTypes.number

  getDefaultProps: ->
    data: ''
    dataKey: ''
    displayName: ''

  getInitialState: ->
    data: ' ' ? @props.data

  submitOnEnter: (event) ->
    if event.key == 'Enter' or event.key == 'Return'
      @props.onEnter?(event)

module.exports = SingleInputMixin