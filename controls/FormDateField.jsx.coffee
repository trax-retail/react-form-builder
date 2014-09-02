###* @jsx React.DOM ###
React = require('react/addons')
Mixins = require('../mixins/Mixins')

DateField = React.createClass(
  mixins: [Mixins.SingleInputMixin, Mixins.StandardErrorDisplayMixin]

  propTypes:
    dataKey: React.PropTypes.string

  onChange: (event) ->
    @props.onDataChanged(@props.dataKey, event.target.value)

  render: ->

    `(
      <div className={this.errorClasses('form-group')}>
        <label className="col-sm-2 control-label" htmlFor={this.props.dataKey}>{this.props.displayName}</label>
        <div className="col-sm-10">
          <input
            type="date"
            className="form-control"
            name={this.props.dataKey}
            value={this.props.data}
            onChange={this.onChange}
            placeholder={this.props.placeholder}
            title={this.props.title}
          />
          {this.errorSpan()}
        </div>
      </div>
    )`
)

module.exports = DateField