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

  renderText: ->
    if this.props.item.displayName?
      this.props.item.displayName
    else
      this.props.item

        # {this.props.item.displayName || this.props.item}
  render: ->
    `(
      <li
        onMouseDown={this.onSelect}
        className={this.className()}
      >
        {this.renderText()}
      </li>
    )`
)

module.exports = Match
