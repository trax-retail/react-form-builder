###* @jsx React.DOM ###

React = require('react/addons')
Mixins = require('../mixins/Mixins')
ConfirmationMixin = require('../../mixins/ConfirmationMixin')
OverlayMixin = require('react-bootstrap/OverlayMixin')

Checkbox = React.createClass(
  mixins: [
    _.omit(Mixins.SingleInputMixin, 'propTypes'),
    Mixins.StandardErrorDisplayMixin,
    Mixins.DisableOnSubmitMixin,
    Mixins.HelpMixin,
    ConfirmationMixin,
    OverlayMixin
  ]

  propTypes:
    data: React.PropTypes.oneOfType([React.PropTypes.bool, React.PropTypes.string])
    dataKey: React.PropTypes.string.isRequired
    displayName: React.PropTypes.string.isRequired

  getDefaultProps: ->
    requireConfirmation: false

  onChange: (event) ->
    setCheckValue = @props.onDataChanged.bind(null, @props.dataKey, event.target.checked)

    if @props.requireConfirmation and event.target.checked
      @setState acceptCallback: setCheckValue
      @showModal()
    else
      setCheckValue()

  render: ->
    label = `(
      <label className="col-sm-2 control-label" htmlFor={this.props.dataKey}>{this.props.displayName}</label>
    )` unless @props.displayName == false

    size = if @props.displayName == false then 'col-sm-12' else 'col-sm-10'

    `(
      <div className={this.errorClasses('form-group')}>
        {label}
        <div className={size}>
          <label className="checkbox-inline checkbox-alone">
            <input
              type="checkbox"
              name={this.props.dataKey}
              checked={this.props.data}
              onChange={this.onChange}
              disabled={this.disabled()}
              placeholder={this.props.placeholder}
              title={this.props.title}
            />
            {this.errorSpan()}
            {this.helpSpan()}
          </label>
        </div>
      </div>
    )
    `
)

module.exports = Checkbox