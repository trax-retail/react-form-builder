###* @jsx React.DOM ###

React = require 'react'
SingleInputMixin = require('../mixins/FormSingleInputMixin')
StandardErrorDisplayMixin = require('../mixins/FormStandardErrorDisplayMixin')
HelpMixin = require('../mixins/FormHelpMixin')
DateTimeField = require('react-bootstrap-datetimepicker').DateTimeField

FormDateTimeField = React.createClass(
  mixins: [SingleInputMixin, StandardErrorDisplayMixin, HelpMixin]

  propTypes:
    dataKey: React.PropTypes.string

  onChange: (value) ->
    @props.onDataChanged(@props.dataKey, value)

  render: ->

    `(
      <div className={this.errorClasses('form-group')}>
        <label className="col-sm-2 control-label" htmlFor={this.props.dataKey}>{this.props.displayName}</label>
        <div className="col-sm-5">
          <DateTimeField onChange={this.onChange} dateTime={this.props.data} format="MM/DD/YY H:mm A" direction={this.props.direction} />

          {this.errorSpan()}
          {this.helpSpan()}
        </div>
      </div>
    )`
)



module.exports = FormDateTimeField
