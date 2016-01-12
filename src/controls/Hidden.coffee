React = require('react')

HiddenField = React.createClass(

  propTypes:
    dataKey: React.PropTypes.string
    data: React.PropTypes.any

  render: ->
    `(
      <input
        type="hidden"
        className="form-control"
        name={this.props.dataKey}
        defaultValue={this.props.data}
        onChange={this.onChange}
      />
    )
    `
)

module.exports = HiddenField
