FormBuilder = {

  Handler: require("./lib/containers/mixins/Handler"),

  Validators: {
    FilenameValidator: require('./lib/validators/Filename'),
    LengthValidator: require('./lib/validators/Length'),
    NotNullValidator: require('./lib/validators/NotNull'),
    NumericValidator: require('./lib/validators/Numeric')
  }

}

module.exports = FormBuilder;
