/** @jsx React.DOM */
var React, Label;

React = require('react');

Label = React.createClass({
  propTypes: {
    dataKey: React.PropTypes.string,
    name: React.PropTypes.string
  },

  render: function() {
    if (this.props.name != false) {
      return (
        <label
          className="col-sm-2 control-label"
          htmlFor={this.props.dataKey}
        >
          {this.props.name}
        </label>
      );
    } else {
      return <span />;
    }
  }
});

module.exports = Label;
