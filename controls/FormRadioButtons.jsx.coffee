###* @jsx React.DOM ###

React = require('react/addons')
DataSourcedMixin = require('../mixins/FormDataSourcedMixin')
StandardErrorDisplayMixin = require('../mixins/FormStandardErrorDisplayMixin')
DisableOnSubmitMixin = require('../mixins/FormDisableOnSubmitMixin')
HelpMixin = require('../mixins/FormHelpMixin')
DataTypeConversionMixin = require('../mixins/FormDataTypeConversionMixin')

RadioButtons = React.createClass(
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
    @props.onDataChanged(@props.dataKey, @convertDataType(event.target.value))

  renderButtons: ->
    if @state.options
      @state.options.map (option) =>
        checked = false
        if @props.data?
          checked = option.value == (String) @props.data

        `(
          <label className="radio-inline" key={"radio-"+option.value+'-key'}>
            <input
              type="radio"
              name={_this.props.dataKey}
              value={option.value}
              onChange={_this.onChange}
              disabled={_this.disabled()}
              placeholder={_this.props.placeholder}
              title={_this.props.title}
              checked={checked}
              key={"radio-"+option.value}
            />
            {option.displayName}
          </label>

        )`

  render: ->
    label = `(
      <label className="col-md-3 col-lg-2 control-label" htmlFor={this.props.dataKey}>{this.props.displayName}</label>
    )` unless @props.displayName == false

    `(
      <div className={this.errorClasses('form-group')}>
        {label}
        <div className='col-md-9'>
          {this.renderButtons()}
          {this.errorSpan()}
          {this.helpSpan()}
        </div>
      </div>
    )`
)

module.exports = RadioButtons
