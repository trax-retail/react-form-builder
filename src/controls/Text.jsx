/** @jsx React.DOM */
var TypeConverter, Disableable, HelpRenderer, React, ErrorRenderer, TextField;

React = require('react/addons');
TypeConverter = require('./mixins/TypeConverter');
FormActions = require('../actions/FormActions');

TextField = React.createClass({
  mixins: [TypeConverter],

  propTypes: {
    dataKey: React.PropTypes.string,
    title: React.PropTypes.string,
    placeholder: React.PropTypes.string,
    data: React.PropTypes.any,
    disabled: React.PropTypes.bool
  },

  onChange: function(event) {
    var value;
    value = this.convertType(event.target.value);
    FormActions.updateFormData(this.props.formId, this.props.dataKey, value, this.props.validators);
  },

  render: function() {
    return (
      <input
        ref="input"
        type="text"
        className="form-control"
        name={this.props.dataKey}
        value={this.props.data}
        onChange={this.onChange}
        disabled={this.props.disabled}
        placeholder={this.props.placeholder}
        title={this.props.title}
      />
    );
  }
});

module.exports = TextField;
