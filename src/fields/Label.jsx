/** @jsx React.DOM */
var React, Label;

React = require('react');

Label = React.createClass({
  propTypes: {
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
    }
  }
});

module.exports = Label;
