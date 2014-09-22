/** @jsx React.DOM */
var TypeConverter, HelpRenderer, React, ErrorRenderer, TextField;

React = require('react/addons');
FormActions = require('../actions/FormActions');
TypeConverter = require('./mixins/TypeConverter')

TextField = React.createClass({
  mixins: [TypeConverter],

  propTypes: {
    dataKey: React.PropTypes.string,
    data: React.PropTypes.any,
    dataType: React.PropTypes.string,
    title: React.PropTypes.string,
    placeholder: React.PropTypes.string,
    disabled: React.PropTypes.bool
  },

  onChange: function(event) {
    FormActions.updateFormData({
      formId: this.props.formId,
      dataKey: this.props.dataKey,
      dataType: this.props.dataType,
      value: this.convertType(event.target.value),
      validators: this.props.validators
    });
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
