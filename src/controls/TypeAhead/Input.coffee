React = require('react')
classnames = require("classnames")
SingleInputMixin = require('../mixins/SingleInput')
ReactBootstrap = require 'react-bootstrap'
DataTypeConversionMixin = require("../mixins/DataTypeConversion")
isEqual = require("lodash/isEqual")

Input = React.createClass(
  mixins: [SingleInputMixin, DataTypeConversionMixin]

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
    displayText: @props.item.displayName ? null

  componentWillReceiveProps: (nextProps) ->
    if nextProps.clearCount != @props.clearCount
      @setState displayText: null
    else if nextProps.item && !isEqual(nextProps.item, @props.item)
      @setState displayText: nextProps.item.displayName

  renderInputIcon: ->
    classes = classnames
      "form-control-feedback": true
      "autocomplete-feedback": true
    if @props.loading
      # classes["fa-spin"] = true
      # it might be cool to bring back font awesome spinner
      `<span className={classes}>
          <ReactBootstrap.Glyphicon glyph="refresh" />
        </span>`
    else if @state.displayText is undefined || @state.displayText is null || !@props.emptyList
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
    @setState(displayText: @convertDataType(event.target.value))
    @props.onChange?(@convertDataType(event.target.value))

  render: ->
    `(
      <div>
        <input
          type="hidden"
          name={this.props.dataKey}
          value={this.itemValue()}
        />
        <input
          autoComplete="off"
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

module.exports = Input
