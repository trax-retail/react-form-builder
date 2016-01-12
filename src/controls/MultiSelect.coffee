React = require('react')
classnames = require "classnames"
DataSourcedMixin = require('./mixins/DataSourced')
StandardErrorDisplayMixin = require('./mixins/StandardErrorDisplay')
DisableOnSubmitMixin = require('./mixins/DisableOnSubmit')
HelpMixin = require('./mixins/Help')
DataTypeConversionMixin = require("./mixins/DataTypeConversion")

MultiSelectField = React.createClass(
  mixins: [
    DataSourcedMixin
    StandardErrorDisplayMixin
    DisableOnSubmitMixin
    HelpMixin
    DataTypeConversionMixin
  ]

  propTypes:
    displayName: React.PropTypes.oneOfType([
      React.PropTypes.string, # Actual name
      React.PropTypes.bool    # false to disable
    ])
    dataKey: React.PropTypes.string.isRequired

  onChange: (event) ->
    value = _.map event.target.selectedOptions, (option) =>
      @convertDataType(option.value)

    @props.onDataChanged(@props.dataKey, value)

  render: ->
    classes = {'form-control': true}
    _.each @props.classes, (name) =>
      classes[name] = true

    options = null
    if @state.options instanceof Array
      options = _.map @state.options, (option, i) =>
        disabled = option.disabled

        `(
          <option key={i} value={option.value} disabled={disabled}>{option.displayName}</option>
        )`

    label = `(
      <label className="col-sm-2 control-label" htmlFor={this.props.dataKey}>{this.props.displayName}</label>
    )` unless @props.displayName == false

    size = if @props.displayName == false then 'col-sm-12' else 'col-sm-10'

    `(
      <div className={this.errorClasses('form-group')}>
        {label}
        <div className={size}>
          <select
            multiple={true}
            onChange={this.onChange}
            className={classnames(classes)}
            name={this.props.dataKey}
            value={this.props.data}
            disabled={this.disabled()}
          >
            {options}
          </select>
          {this.errorSpan()}
          {this.helpSpan()}
        </div>
      </div>
    )`
)

module.exports = MultiSelectField
