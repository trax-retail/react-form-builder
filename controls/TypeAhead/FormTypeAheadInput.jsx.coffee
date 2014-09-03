###* @jsx React.DOM ###

React = require('react/addons')
SingleInputMixin = require('../../mixins/FormSingleInputMixin')
ReactBootstrap = require 'react-bootstrap'

TypeAheadInput = React.createClass(
  mixins: [SingleInputMixin]

  propTypes:
    item:        React.PropTypes.object.isRequired
    emptyList:   React.PropTypes.bool.isRequired
    dataKey:     React.PropTypes.string.isRequired
    free:        React.PropTypes.bool
    loading:     React.PropTypes.bool
    disabled:    React.PropTypes.bool
    placeholder: React.PropTypes.bool
    title:       React.PropTypes.string
    onChange:    React.PropTypes.func
    onFocus:     React.PropTypes.func
    onBlur:      React.PropTypes.func
    onKeyDown:   React.PropTypes.func
    onKeyUp:     React.PropTypes.func

  getInitialState: ->
    displayText: @props.item.displayName ? ""

  componentWillReceiveProps: (nextProps) ->
    if nextProps.clearCount != @props.clearCount
      @setState displayText: ""
    else if nextProps.item && !_.isEqual(nextProps.item, @props.item)
      @setState displayText: nextProps.item.displayName

  renderInputIcon: ->
    classes = React.addons.classSet
      "form-control-feedback": true
      "autocomplete-feedback": true
    if @props.loading
      # classes["fa-spin"] = true
      # it might be cool to bring back font awesome spinner
      `<span className={classes}>
          <ReactBootstrap.Glyphicon glyph="refresh" />
        </span>`
    else if @state.displayText == "" || !@props.emptyList
      `<span className={classes}>
          <ReactBootstrap.Glyphicon glyph="search" />
        </span>`
    else if @itemValue() && @state.displayText != ""
      `<span className={classes}>
        <ReactBootstrap.Glyphicon glyph="ok" />
      </span>`
    else
      `<span className={classes}>
        <ReactBootstrap.Glyphicon glyph="warning-sign" />
      </span>`

  itemValue: ->
    if @props.free || @props.item.displayName == @state.displayText
      @state.displayText

  onChange: (event) ->
    @setState(displayText: event.target.value)
    @props.onChange(event.target.value)

  render: ->
    `(
      <div>
        <input
          type="hidden"
          name={this.props.dataKey}
          value={this.itemValue()}
        />
        <input
          className="form-control"
          type="search"
          name={this.props.dataKey+"_helper"}
          disabled={this.props.disabled}
          placeholder={this.props.placeholder}
          value={this.state.displayText}
          title={this.props.title}
          onChange={this.onChange}
          onFocus={this.props.onFocus}
          onBlur={this.props.onBlur}
          onKeyDown={this.props.onKeyDown}
          onKeyUp={this.props.onKeyUp}
        />
        {this.renderInputIcon()}
        {this.props.children}
      </div>
    )`
)

module.exports = TypeAheadInput