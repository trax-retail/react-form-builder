###* @jsx React.DOM ###

React = require('react/addons')
SingleInputMixin = require('../mixins/FormSingleInputMixin')
ValidationMixin = require('../mixins/FormValidationMixin')
StandardErrorDisplayMixin = require('../mixins/FormStandardErrorDisplayMixin')
DisableOnSubmitMixin = require('../mixins/FormDisableOnSubmitMixin')
HelpMixin = require('../mixins/FormHelpMixin')

NumberField = React.createClass(
  mixins: [
    SingleInputMixin,
    ValidationMixin,
    StandardErrorDisplayMixin,
    DisableOnSubmitMixin,
    HelpMixin
  ]

  propTypes:
    data: React.PropTypes.oneOfType([React.PropTypes.string, React.PropTypes.number])
    dataKey: React.PropTypes.string
    min: React.PropTypes.number
    max: React.PropTypes.number
    step: React.PropTypes.number

  onChange: (event) ->
    value = event.target.value
    @validate value, =>
      @props.onDataChanged(@props.dataKey, value)

  render: ->
    label = `(
      <label className="col-sm-2 control-label" htmlFor={this.props.dataKey}>{this.props.displayName}</label>
    )` unless @props.displayName == false

    size = if @props.displayName == false then 'col-sm-12' else 'col-sm-10'

    `(
     <div className={this.errorClasses('form-group')}>
       {label}
       <div className={size}>
         <input
          type="number"
          className="form-control"
          name={this.props.dataKey}
          value={this.props.data}
          onChange={this.onChange}
          disabled={this.disabled()}
          placeholder={this.props.placeholder}
          title={this.props.title}
          onKeyPress={this.submitOnEnter}
          step={this.props.step}
          min={this.props.min}
          max={this.props.max}
        />
        {this.errorSpan()}
        {this.helpSpan()}
      </div>
     </div>
    )`
)

module.exports = NumberField