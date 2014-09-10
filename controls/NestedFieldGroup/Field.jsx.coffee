###* @jsx React.DOM ###

React = require('react/addons')
DisableOnSubmitMixin = require('../mixins/DisableOnSubmit')
ValidationMixin = require('../mixins/Validation')
DataTypeConversionMixin = require('../mixins/DataTypeConversion')
ReactBootstrap = require('react-bootstrap')

NestedField = React.createClass(
  mixins: [
    DisableOnSubmitMixin
    ValidationMixin
    DataTypeConversionMixin
  ]

  propTypes:
    type: React.PropTypes.string.isRequired
    onEnter: React.PropTypes.func
    onDataChanged: React.PropTypes.func.isRequired
    onRemove: React.PropTypes.func.isRequired

  onChange: (event) ->
    value = event.target.value
    @validate value, =>
      @props.onDataChanged(@props.dataKey, @convertDataType(value))

  remove: ->
    @props.onRemove(@props.dataKey)

  renderField: ->
    `(
      <input
        type="text"
        className="form-control"
        name={this.props.dataKey}
        defaultValue={this.props.data}
        onChange={this.onChange}
        disabled={this.props.disabled}
        placeholder={this.props.placeholder}
        title={this.props.title}
        onKeyPress={this.submitOnEnter}
      />
    )`

  render: ->
    `(
      <div className="row">
        <div className="col-md-12">
          <div className="input-group">
            {this.renderField()}
            <span className="input-group-btn">
              <ReactBootstrap.Button onClick={this.remove}>
                <ReactBootstrap.Glyphicon glyph="remove" />
              </ReactBootstrap.Button>
            </span>
          </div>
        </div>
      </div>
    )`
)

module.exports = NestedField
