###* @jsx React.DOM ###

React = require('react/addons')
DataSourcedMixin = require '../mixins/FormDataSourcedMixin.jsx'

DynamicDefinition = React.createClass(
  mixins: [DataSourcedMixin]

  propTypes:
    dataKey: React.PropTypes.string

  componentWillUpdate: (prevState, nextState) ->
    if prevState.formDef != nextState.formDef
      @props.onDataChanged(@props.dataKey, nextState.formDef)

  render: ->
    `<div>{this.props.children}</div>`
)

module.exports = DynamicDefinition