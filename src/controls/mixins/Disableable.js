var Disableable, React;

React = require('react');

Disableable = {
  propTypes: {
    disabled: React.PropTypes.bool
  },

  disabled: function() {
    return this.props.submitting || this.props.disabled;
  }
};

module.exports = Disableable;
