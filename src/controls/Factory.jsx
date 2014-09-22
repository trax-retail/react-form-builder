var React, Factory;

React = require("react/addons");
TypeValidator = require("../validators/Type");

Factory = React.createClass({
  resolveValidators: function() {
    var validators, typeValidator;
    validators = this.props.def.validators || [];
    if(this.props.def.dataType) {
      typeValidator = new TypeValidator({ type: this.props.def.dataType });
      validators = validators.concat(typeValidator);
    }
    return validators;
  },

  render: function() {
    return this.props.def.type({
      formId        : this.props.formId,
      dataType      : this.props.def.dataType || "string",
      displayName   : this.props.def.displayName,
      placeholder   : this.props.def.placeholder,
      title         : this.props.def.title,
      validators    : this.resolveValidators(),
      helpText      : this.props.def.helpText,
      disabled      : this.props.def.disabled,
      errors        : this.props.errors,
      submitting    : this.props.submitting,
      data          : this.props.data,
      dataKey       : this.props.dataKey,
      key           : this.props.dataKey
    });
  }
});

module.exports = Factory;