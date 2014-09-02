###* @jsx React.DOM ###

React = require('react/addons')

TypeAheadMatch = React.createClass(
  propTypes:
    item: React.PropTypes.renderable.isRequired
    active: React.PropTypes.bool.isRequired
    onSelect: React.PropTypes.func

  onSelect: ->
    @props.onSelect(@props.item)

  className: ->
    React.addons.classSet
      'active': @props.active

  render: ->
    `(
      <li
        onMouseDown={this.onSelect}
        className={this.className()}
      >
        {this.props.item.displayName || this.props.item}
      </li>
    )`
)

module.exports = TypeAheadMatch