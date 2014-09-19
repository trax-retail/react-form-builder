var component, formDefs, Form, FormWithPreview, React, component;

React = require("react/addons")
TextControl = require("../src/controls/Text");
FormWithPreview = require("./FormWithPreview");
FormDefs = require("./FormDefs");

for(name in FormDefs) {
  component = FormWithPreview({formDef: FormDefs[name]});
  React.renderComponent(component, document.getElementById(name + '-form'));
}
