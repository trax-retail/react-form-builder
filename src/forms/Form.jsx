
/** @jsx React.DOM */
var ReactBootstrap, Form, React, underscore;

React = require('react/addons');
ReactBootstrap = require('react-bootstrap');
FormDataStore = require('../stores/FormDataStore');
FormErrorsStore = require('../stores/FormErrorsStore')
Field = require('../fields/Field');
_ = require('underscore');

function getStateFromStores(formId) {
  return {
    formId: formId,
    formData: FormDataStore.getFormData(formId),
    formErrors: FormErrorsStore.getErrorsData(formId)
  }
}

Form = React.createClass({
  propTypes: {
    def: React.PropTypes.object,
    formData: React.PropTypes.object,
    title: React.PropTypes.string,
    formErrors: React.PropTypes.object,
    services: React.PropTypes.object,
    disabled: React.PropTypes.bool,
    submitting: React.PropTypes.bool,
    buttons: React.PropTypes.object
  },

  getInitialState: function() {
    var formId = Math.floor(Math.random() * 1000000 + 1);
    return {
      formId: formId,
      formData: FormDataStore.initialize(formId, this.props.formData),
      formErrors: FormErrorsStore.initialize(formId, this.props.formErrors)
    };
  },

  componentDidMount: function() {
    FormDataStore.addChangeListener(this._onChange)
    FormErrorsStore.addChangeListener(this._onChange)
  },

  componentWillUnmount: function() {
    FormDataStore.removeChangeListener(this._onChange)
    FormErrorsStore.removeChangeListener(this._onChange)
  },

  classes: function() {
    return React.addons.classSet({
      "form-horizontal": true,
      "component-submitting": this.props.submitting,
      "component-not-submitting": !this.props.submitting
    });
  },

  constructFormFromDef: function() {
    return _.map(this.props.formDef.components, function(def) {
      return Field({
        def           : def,
        key           : def.dataKey,
        dataKey       : def.dataKey,
        formId        : this.state.formId,
        data          : this.state.formData[def.dataKey],
        errors        : this.state.formErrors[def.dataKey],
        submitting    : this.props.submitting,
        disabled      : this.props.disabled
      });
    }.bind(this));
  },

  buttons: function() {
    return _.map(this.props.buttons, (function(_this) {
      return function(props, title) {
        props.key = title;
        props.disabled = _this.disabled();
        return ReactBootstrap.Button(props, title);
      };
    })(this));
  },

  render: function() {
    return (
      <form role="form" className={this.classes()} onChange={this.onChange}>
        {this.constructFormFromDef(this.props.def)}
        <ReactBootstrap.ButtonToolbar>{this.buttons()}</ReactBootstrap.ButtonToolbar>
      </form>
    );
  },

  _onChange: function() {
    this.setState(getStateFromStores(this.state.formId), function() {
      if(this.props.onChange) this.props.onChange(this.state.formData);
    }.bind(this));
  }
});

module.exports = Form;