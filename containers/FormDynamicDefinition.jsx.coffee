###* @jsx React.DOM ###

React = require('react/addons')
DataSourcedMixin = require '../mixins/FormDataSourcedMixin.jsx'

DynamicDefinition = React.createClass(
  mixins: [DataSourcedMixin]

  propTypes:
    dataKey: React.PropTypes.string

  componentDidMount: ->
    @props.onDataChanged(@props.dataKey, @state.formDef)

  componentWillUpdate: (nextProps, nextState) ->
    unless _.isEqual @state.formDef, nextState.formDef
      @props.onDataChanged(nextProps.dataKey, nextState.formDef)

  render: ->
    `<div>{this.props.children}</div>`
)

module.exports = DynamicDefinition