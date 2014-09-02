Mixins = {

  DataSourcedMixin: require('./FormDataSourcedMixin'),
  DataTypeConversionMixin: require('./FormDataTypeConversion'),
  DisableOnSubmitMixin: require('./FormDisableOnSubmitMixin'),
  HelpMixin: require('./FormHelpMixin'),
  ParserMixin: require('./FormParserMixin'),
  SingleInputMixin: require('./FormSingleInputMixin'),
  StandardErrorDisplayMixin: require('./FormStandardErrorDisplayMixin'),
  // TypeAheadMixin: require('./FormTypeAheadMixin'),
  ValidationMixin: require('./FormValidationMixin')

}

module.exports = Mixins;