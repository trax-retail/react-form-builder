FormBuilder = {

  Handler: require("./containers/mixins/Handler"),

  Validators: {
    FilenameValidator: require('./validators/Filename'),
    LengthValidator: require('./validators/Length'),
    NotNullValidator: require('./validators/NotNull'),
    NumericValidator: require('./validators/Numeric')
  }

}

module.exports = FormBuilder;
