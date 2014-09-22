var React, Factory;

React = require("react/addons");

Factory = React.createClass({
  render: function() {
    return this.props.def.type({
        formId        : this.props.formId,
        dataType      : this.props.def.dataType || "string",
        displayName   : this.props.def.displayName,
        placeholder   : this.props.def.placeholder,
        title         : this.props.def.title,
        validators    : this.props.def.validators,
        helpText      : this.props.def.helpText,
        disabled      : this.props.def.disabled,
        errors        : this.props.errors,
        submitting    : this.props.submitting,
        services      : this.props.services,
        data          : this.props.data,
        dataKey       : this.props.dataKey,
        key           : this.props.dataKey
    });
  }
});

module.exports = Factory;