###* @jsx React.DOM ###
React = require('react/addons')
SingleInputMixin = require('./mixins/SingleInput')
StandardErrorDisplayMixin = require('./mixins/StandardErrorDisplay')
DisableOnSubmitMixin = require('./mixins/DisableOnSubmit')
HelpMixin = require('./mixins/Help')

PasswordField = React.createClass(
  mixins: [
    SingleInputMixin,
    StandardErrorDisplayMixin,
    DisableOnSubmitMixin,
    HelpMixin
  ]

  onChange: (event) ->
    @props.onDataChanged(@props.dataKey, event.target.value)

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
            type="password"
            className="form-control"
            name={this.props.dataKey}
            value={this.props.data}
            disabled={this.disabled()}
            onChange={this.onChange}
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

module.exports = PasswordField