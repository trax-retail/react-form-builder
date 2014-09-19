/** @jsx React.DOM */
var React, Errors;

React = require('react/addons');

Errors = React.createClass({
  propTypes: {
    errors: React.PropTypes.array
  },

  hasErrors: function () {
    return this.props.errors;
  },

  render: function() {
    if (this.hasErrors()) {
      return (
        <span className="help-block">
            {this.props.errors.join(', ')}
        </span>
      );
    } else {
      return <span />;
    }
  }
});

module.exports = Errors;
