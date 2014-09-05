###* @jsx React.DOM ###

React = require 'react/addons'
SingleInputMixin = require('../mixins/FormSingleInputMixin')
ValidationMixin = require('../mixins/FormValidationMixin')
StandardErrorDisplayMixin = require('../mixins/FormStandardErrorDisplayMixin')
DisableOnSubmitMixin = require('../mixins/FormDisableOnSubmitMixin')
HelpMixin = require('../mixins/FormHelpMixin')
DataTypeConversionMixin = require('../mixins/FormDataTypeConversionMixin')
Markdown = require '../utils/markdown.jsx'
MarkdownHelpButton = require("./MarkdownHelpButton")

FormMarkdownField = React.createClass(
  mixins: [
    SingleInputMixin,
    ValidationMixin,
    StandardErrorDisplayMixin,
    DisableOnSubmitMixin,
    HelpMixin
    DataTypeConversionMixin
  ]

  onChange: (event) ->
    value = event.target.value
    @validate value, =>
      @props.onDataChanged(@props.dataKey, @convertDataType(value))

  componentDidUpdate: ->
    @setTextAreaHeight()

  componentDidMount: ->
    @setTextAreaHeight()

  setTextAreaHeight: ->
    textarea = @refs.textarea
    if textarea
      node = textarea.getDOMNode()
      node.style.height = "#{node.scrollHeight}px"

  render: ->
    label = `(
      <label className="col-sm-2 control-label" htmlFor={this.props.dataKey}>{this.props.displayName}</label>
    )` unless @props.displayName == false

    size = if @props.displayName == false then "col-sm-12" else "col-sm-10"

    `(
      <div className={this.errorClasses('form-group')}>
        {label}
        <div className={size}>
          <div className="row row-no-padding">
            <div className="markdown-group">
              <div className="col-sm-6">
                <div className="markdown-field-group">
                  <textarea
                    ref="textarea"
                    className="form-control markdown-field"
                    name={this.props.dataKey}
                    defaultValue={this.props.data}
                    onChange={this.onChange}
                    disabled={this.disabled()}
                    placeholder={this.props.placeholder}
                    title={this.props.title}
                  />
                  <div className="buttons">
                    <MarkdownHelpButton />
                  </div>
                </div>
              </div>
              <div className="col-sm-6">
                <Markdown value={this.props.data || "*Preview...*"} className="markdown-preview" />
              </div>
            </div>
          </div>
          <div className="row">
            <div className="col-sm-12">
              {this.errorSpan()}
              {this.helpSpan()}
            </div>
          </div>
        </div>
      </div>
    )`
)

module.exports = FormMarkdownField