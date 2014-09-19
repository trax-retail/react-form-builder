/** @jsx React.DOM */
var React, Field, Errors, Help, ControlFactory;

React = require("react/addons");
Label = require('./Label');
Errors = require('./Errors');
Help = require('./Help');
ControlFactory = require('../controls/Factory');

Field = React.createClass({
  sizeClassName: function() {
    return this.props.def.name == false ? 'col-sm-12' : 'col-sm-10';
  },

  classNames: function() {
    var classes = {};

    if (this.props.errors) {
      classes = { 'has-error': true };
    }

    return React.addons.classSet(classes);
  },

  render: function() {
    return (
      <div className={this.classNames('form-group')}>
        <Label dataKey={this.props.dataKey} name={this.props.def.name} />
        <div className={this.sizeClassName()}>
          {this.transferPropsTo(ControlFactory())}
          <Errors errors={this.props.errors} />
          <Help text={this.props.def.helpText} />
        </div>
      </div>
    );
  }
});

module.exports = Field;