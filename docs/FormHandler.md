## Using the FormHandlerMixin

React Form Builder provide a _FormHandlerMixin_ you can use to instantly give your components some basic form behavior and persistence.

It adds some `props` that are used to set default settings or can be overidden. They are all reflected to the `state` of that component on getInitialState.

name | type | descrition
-----|-----|-----
**title** | string | the form title. default: ""
**submitting** | boolean | is the form being submitted. default: false
**serverErrors** | object | lets render errors that were not catched by Validators. default: null
**formData** | object | the serialized representation of the form data. default: {}
**formDef** | object | see Form Definitions
**buttons** | object | see Customizing Buttons

There are two requirements :
 * Specify a Form Definition through the `formDef`, either by setting it in `getDefaultProps` or by passing it from a parent component.
 * implement a `onSubmit` function that will be called when trying to submit the form. Example:

 ```javascript
onSubmit: function(callback) {
      console.log(this.state.formData); // This will generally be a remote call instead
      callback();
}
```

Full example :

```javascript
var React = require('react');
var ReactDOM = require('react-dom');
var FormHandler = require('react-form-builder').Mixins.Handler;
var ExampleFormDef = {
  type: 'form',
  components: [
    {
      type: 'text-field',
      dataKey: 'example',
      displayName: 'Example'
    }
  ]
};

var Example = React.createClass({
  mixins: [FormHandler],

  getDefaultProps: function() {
    return {
      formDef: ExampleFormDef
    };
  },

  onSubmit: function(callback) {
    console.log("FormData: ", this.state.formData);
    callback();
  },

  render: this.renderForm();
});

ReactDOM.render(Example(), document.body);
```
