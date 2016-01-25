React = require 'react'
SingleInputMixin = require('./mixins/SingleInput')
ValidationMixin = require('./mixins/Validation')
StandardErrorDisplayMixin = require('./mixins/StandardErrorDisplay')
DisableOnSubmitMixin = require('./mixins/DisableOnSubmit')
HelpMixin = require('./mixins/Help')
DataTypeConversionMixin = require('./mixins/DataTypeConversion')
Markdown = require '../utils/markdown'
HelpButton = require("./Markdown/HelpButton")
UploadImageButton = require("./Markdown/UploadImageButton")

FormMarkdownField = React.createClass(
  mixins: [
    SingleInputMixin,
    ValidationMixin,
    StandardErrorDisplayMixin,
    DisableOnSubmitMixin,
    HelpMixin
    DataTypeConversionMixin
  ]

  propTypes:
    fileDestinationService: React.PropTypes.string.isRequired

  onChange: (event) ->
    value = event.target.value
    @validate value, =>
      @props.onDataChanged(@props.dataKey, @convertDataType(value))

  componentDidUpdate: ->
    @setTextAreaHeight()

  componentDidMount: ->
    @setTextAreaHeight()

  setTextAreaHeight: ->
    if @refs.textarea
      node = @refs.textarea
      node.style.height = "#{node.scrollHeight}px"

  appendMarkdown: (markdown) ->
    value = (@props.data ? "") + "\n\n" + markdown + "\n\n"
    @props.onDataChanged(@props.dataKey, value)
    if @refs.textarea
      @refs.textarea.focus()

  renderUploadImageButton: ->
    if @props.fileDestinationService?
      `(
        <UploadImageButton
          fileDestinationService={this.props.fileDestinationService}
          addImageMarkdown={this.appendMarkdown}
        />
      )`

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
                    value={this.props.data}
                    onChange={this.onChange}
                    disabled={this.disabled()}
                    placeholder={this.props.placeholder}
                    title={this.props.title}
                  />
                  <div className="buttons">
                    {this.renderUploadImageButton()}
                    <HelpButton />
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
