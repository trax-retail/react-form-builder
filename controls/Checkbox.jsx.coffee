###* @jsx React.DOM ###

React = require('react/addons')
StandardErrorDisplayMixin = require('./mixins/StandardErrorDisplay')
DisableOnSubmitMixin = require('./mixins/DisableOnSubmit')
HelpMixin = require('./mixins/Help')
ConfirmationMixin = require('./mixins/Confirmation')
SingleInputMixin = require './mixins/SingleInput'
OverlayMixin = require('react-bootstrap/OverlayMixin')

Checkbox = React.createClass(
  mixins: [
    _.omit(SingleInputMixin, 'propTypes'),
    StandardErrorDisplayMixin,
    DisableOnSubmitMixin,
    HelpMixin,
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

    size = if @props.displayName == false then 'col-sm-12' else 'col-sm-10 col-sm-offset-2'

    `(
      <div className={this.errorClasses('form-group')}>
        <div className={size}>
          <div className="checkbox">
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
              {this.props.displayName}
              {this.errorSpan()}
              {this.helpSpan()}
            </label>
          </div>
        </div>
      </div>
    )
    `
)

module.exports = Checkbox