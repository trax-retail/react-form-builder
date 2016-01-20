React = require('react')
DataSourcedMixin = require '../controls/mixins/DataSourced'
isEqual = require("lodash/isEqual")

DynamicDefinition = React.createClass(
  mixins: [DataSourcedMixin]

  propTypes:
    dataKey: React.PropTypes.string

  componentDidMount: ->
    @props.onDataChanged(@props.dataKey, @state.formDef)

  componentWillUpdate: (nextProps, nextState) ->
    unless isEqual @state.formDef, nextState.formDef
      @props.onDataChanged(nextProps.dataKey, nextState.formDef)

  render: ->
    `<div>{this.props.children}</div>`
)

module.exports = DynamicDefinition
