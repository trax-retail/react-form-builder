###* @jsx React.DOM ###

React = require('react/addons')

Label = React.createClass(

  propTypes:
    onClick: React.PropTypes.func
    item: React.PropTypes.object

  onClick: (e) ->
    @props.onClick(@props.item)

  render: ->
    `(
        <span className="tm-tag tm-tag-info">
          <span>{this.props.item.displayName}</span>
          <a className="tm-tag-remove" onClick={this.onClick}>x</a>
        </span>
    )`

)

module.exports = Label