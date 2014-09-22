/** @jsx React.DOM */
var TypeConverter, Disableable, HelpRenderer, React, ErrorRenderer, TextField;

React = require('react/addons');
Disableable = require('./mixins/Disableable');
TypeConverter = require('./mixins/TypeConverter');
FormActions = require('../actions/FormActions');

TextField = React.createClass({
  mixins: [Disableable, TypeConverter],

  propTypes: {
    dataKey: React.PropTypes.string,
    title: React.PropTypes.string,
    placeholder: React.PropTypes.string,
    data: React.PropTypes.any
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
        disabled={this.disabled()}
        placeholder={this.props.placeholder}
        title={this.props.title}
      />
    );
  }
});

module.exports = TextField;
