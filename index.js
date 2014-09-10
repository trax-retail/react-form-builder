FormBuilder = {

  Containers: {
    Form: require('./containers/Form')
  },

  Mixins: {
    Parser: require("./containers/mixins/Parser"),
    Handler: require("./containers/mixins/Handler")
  },

  Controls: {
    Checkbox: require('./controls/Checkbox'),
    Dropdown: require('./controls/Dropdown')
  },

  Validators: {
    FilenameValidator: require('./validators/Filename'),
    LengthValidator: require('./validators/Length'),
    NotNullValidator: require('./validators/NotNull'),
    NumericValidator: require('./validators/Numeric')
  }

}

module.exports = FormBuilder;
