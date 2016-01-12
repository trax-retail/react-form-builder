React = require('react')
classnames = require("classnames")

Match = React.createClass(
  propTypes:
    item: React.PropTypes.node.isRequired
    active: React.PropTypes.bool.isRequired
    onSelect: React.PropTypes.func

  onSelect: ->
    @props.onSelect(@props.item)

  className: ->
    classnames
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

module.exports = Match
