/** @jsx React.DOM */
var React, Help;

React = require('react');

Help = React.createClass({
  propTypes: {
    text: React.PropTypes.string
  },

  render: function() {
    if (this.props.text) {
      return (
          <span className="help-block">
            {this.props.text}
          </span>
      );
    }
    else {
      return <span/>;
    }
  }
});

module.exports = Help;
