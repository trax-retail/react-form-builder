React = require('react')
SingleInputMixin = require('./mixins/SingleInput')
ValidationMixin = require('./mixins/Validation')
StandardErrorDisplayMixin = require('./mixins/StandardErrorDisplay')
DisableOnSubmitMixin = require('./mixins/DisableOnSubmit')
HelpMixin = require('./mixins/Help')
DataTypeConversionMixin = require('./mixins/DataTypeConversion')
UploadImageButton = require("./Markdown/UploadImageButton")

FileTextField = React.createClass(
  mixins: [
    SingleInputMixin
    ValidationMixin
    StandardErrorDisplayMixin
    DisableOnSubmitMixin
    HelpMixin
    DataTypeConversionMixin
  ]

  propTypes:
    dataKey: React.PropTypes.string
    title: React.PropTypes.string
    placeholder: React.PropTypes.string
    disabled: React.PropTypes.bool
    data: React.PropTypes.any

  onChange: (event) ->
    value = event.target.value
    @validate value, =>
      @props.onDataChanged(@props.dataKey, @convertDataType(value))

  setFileUrl: (markdown) ->
    @props.onDataChanged(@props.dataKey, markdown)

  render: ->
    label = `(
      <label className="col-sm-2 control-label" htmlFor={this.props.dataKey}>{this.props.displayName}</label>
    )` unless @props.displayName == false

    size = if @props.displayName == false then 'col-sm-12' else 'col-sm-10'

    `(
      <div className={this.errorClasses('form-group')}>
        {label}
        <div className={size}>
          <div className="input-group">
            <input
              type="text"
              className="form-control"
              name={this.props.dataKey}
              value={this.props.data}
              onChange={this.onChange}
              disabled={this.disabled() && this.props.disabled}
              placeholder={this.props.placeholder}
              title={this.props.title}
              onKeyPress={this.submitOnEnter}
            />
            <div className="input-group-addon">
              <UploadImageButton
                fileDestinationService={this.props.fileDestinationService}
                addImageMarkdown={this.setFileUrl}
              />
            </div>
          </div>
          {this.errorSpan()}
          {this.helpSpan()}
        </div>
       </div>
    )`
)

module.exports = FileTextField
