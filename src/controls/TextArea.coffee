React = require('react')
SingleInputMixin = require('./mixins/SingleInput')
ValidationMixin = require('./mixins/Validation')
StandardErrorDisplayMixin = require('./mixins/StandardErrorDisplay')
DisableOnSubmitMixin = require('./mixins/DisableOnSubmit')
HelpMixin = require('./mixins/Help')
DataTypeConversionMixin = require('./mixins/DataTypeConversion')

TextArea = React.createClass(
  mixins: [
    SingleInputMixin,
    ValidationMixin,
    StandardErrorDisplayMixin,
    DisableOnSubmitMixin,
    HelpMixin
    DataTypeConversionMixin
  ]

  propTypes:
    dataKey: React.PropTypes.string

  onChange: (event) ->
    value = event.target.value
    @validate value, =>
      @props.onDataChanged(@props.dataKey, @convertDataType(value))

  render: ->
    label = `(
      <label className="col-sm-2 control-label" htmlFor={this.props.dataKey}>{this.props.displayName}</label>
    )` unless @props.displayName == false

    size = if @props.displayName == false then 'col-sm-12' else 'col-sm-10'
    rows = @props.rows ? 3

    `(
      <div className={this.errorClasses('form-group')}>
        {label}
        <div className={size}>
          <textarea
            rows={rows}
            className="form-control"
            name={this.props.dataKey}
            value={this.props.data}
            onChange={this.onChange}
            disabled={this.disabled()}
            placeholder={this.props.placeholder}
            title={this.props.title}
          />
          {this.errorSpan()}
          {this.helpSpan()}
        </div>
      </div>
    )`
)

module.exports = TextArea
