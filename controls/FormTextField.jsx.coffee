###* @jsx React.DOM ###

React = require('react/addons')
Mixins = require('../mixins/Mixins')

TextField = React.createClass(
  mixins: [
    Mixins.SingleInputMixin
    Mixins.ValidationMixin
    Mixins.StandardErrorDisplayMixin
    Mixins.DisableOnSubmitMixin
    Mixins.HelpMixin
    Mixins.DataTypeConversionMixin
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
          {this.errorSpan()}
          {this.helpSpan()}
        </div>
       </div>
    )`
)

module.exports = TextField