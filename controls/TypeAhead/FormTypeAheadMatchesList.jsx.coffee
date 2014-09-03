###* @jsx React.DOM ###

React = require('react/addons')

TypeAheadMatch = require('./FormTypeAheadMatch')

TypeAheadMatchesList = React.createClass(
  propTypes:
    matches: React.PropTypes.array.isRequired
    highlightedIndex: React.PropTypes.number.isRequired
    hidden: React.PropTypes.bool.isRequired
    onSelect: React.PropTypes.func.isRequired

  componentWillReceiveProps: (nextProps) ->
    unless _.isEqual(@props, nextProps)
      @resetListScroll()
      @ensureHighlightedVisible() if @props.highlightedIndex > -1

  ensureHighlightedVisible: ->
    list = @refs.list?.getDOMNode()
    return unless list and @props.highlightedIndex >= 0
    return unless highlighted = list.childNodes[@props.highlightedIndex]
    list.scrollTop = list.scrollTop + highlighted.offsetTop - list.scrollHeight / 2 + highlighted.offsetHeight / 2

  resetListScroll: ->
    @refs.list?.getDOMNode().scrollTop = 0

  renderMatchItems: ->
    _.map @props.matches, (item, i) =>
      `(
        <TypeAheadMatch
          key={i}
          item={item}
          active={_this.props.highlightedIndex === i }
          onSelect={_this.props.onSelect}
        />
      )`

  className: ->
    React.addons.classSet
      'autocomplete-results': true
      'hide': @props.hidden
      'active': @props.active

  render: ->
    if @props.matches.length > 0
      `(
        <div className={this.className()} >
          <ul ref="list">
            {this.renderMatchItems()}
          </ul>
        </div>
      )`
    else
      `<div/>`
)

module.exports = TypeAheadMatchesList