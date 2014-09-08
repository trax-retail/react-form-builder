###* @jsx React.DOM ###

React = require('react/addons')
DataSourcedMixin = require('../mixins/FormDataSourcedMixin')
StandardErrorDisplayMixin = require('../mixins/FormStandardErrorDisplayMixin')
DisableOnSubmitMixin = require('../mixins/FormDisableOnSubmitMixin')
HelpMixin = require('../mixins/FormHelpMixin')

DropDownField = React.createClass(
  mixins: [
    DataSourcedMixin
    StandardErrorDisplayMixin
    DisableOnSubmitMixin
    HelpMixin
  ]

  propTypes:
    dataKey: React.PropTypes.string

  onChange: (event) ->
    @props.onDataChanged(@props.dataKey, event.target.value)

  render: ->
    # if @props.value comes undefined, we try then to set it to the
    # value of the first option, otherwise, undefined
    # that way we are able to clear forms
    value = this.props.data ? this.state.options?[0].value

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
            onChange={this.onChange}
            className={React.addons.classSet(classes)}
            name={this.props.dataKey}
            value={value}
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

module.exports = DropDownField