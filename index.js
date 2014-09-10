FormBuilder = {

  Containers: {
    Form: require('./containers/Form'),

    Mixins: {
      Parser: require("./containers/mixins/Parser"),
      Handler: require("./containers/mixins/Handler")
    }
  },

  Controls: {

    Checkbox: require('./controls/Checkbox'),
    Dropdown: require('./controls/Dropdown'),
    File: require('./controls/File'),
    Number: require('./controls/Number'),

  },
  Validators: {
    Filename: require('./validators/Filename'),
    Length: require('./validators/Length'),
    NotNull: require('./validators/NotNull'),
    Numeric: require('./validators/Numeric')
  }

}

module.exports = FormBuilder;
