FormBuilder = {

  Mixins: {
    FormHandlerMixin: require('./mixins/FormHandlerMixin'),

    DataSourcedMixin: require('./mixins/FormDataSourcedMixin'),
    DataTypeConversionMixin: require('./mixins/FormDataTypeConversionMixin'),
    DisableOnSubmitMixin: require('./mixins/FormDisableOnSubmitMixin'),
    HelpMixin: require('./mixins/FormHelpMixin'),
    ParserMixin: require('./mixins/FormParserMixin'),
    SingleInputMixin: require('./mixins/FormSingleInputMixin'),
    StandardErrorDisplayMixin: require('./mixins/FormStandardErrorDisplayMixin'),
    TypeAheadMixin: require('./mixins/FormTypeAheadMixin'),
    ValidationMixin: require('./mixins/FormValidationMixin'),
    ConfirmationMixin: require('./mixins/ConfirmationMixin')

  },
  Containers: {
    Form: require('./containers/Form'),
    DynamicDefinition: require('./containers/FormDynamicDefinition'),
    Group: require('./containers/FormGroup'),
    InputGroup: require('./containers/FormInputGroup')

  },
  Controls: {
    Checkbox: require('./controls/FormCheckbox'),
    DateField: require('./controls/FormDateField'),
    DateTimeField: require('./controls/FormDateTimeField'),
    DropdownField: require('./controls/FormDropdownField'),
    FileSelect: require('./controls/FormFileSelect'),
    HiddenField: require('./controls/FormHiddenField'),
    MultipleSelect: require('./controls/FormMultipleSelect'),
    NestedField: require('./controls/FormNestedField'),
    NestedFieldGroup: require('./controls/FormNestedFieldGroup.jsx'),
    NestedFormGroup: require('./controls/FormNestedFormGroup.jsx'),
    NumberField: require('./controls/FormNumberField'),
    PasswordField: require('./controls/FormPasswordField'),
    RadioButtons: require('./controls/FormRadioButtons'),
    TextArea: require('./controls/FormTextArea'),
    TextField: require('./controls/FormTextField'),
    MultiTypeAheadField: require('./controls/MultiTypeAheadField'),
    TypeAheadField: require('./controls/TypeAheadField'),
    MarkdownField: require('./controls/FormMarkdownField.jsx')

  },
  Validators: {
    FilenameValidator: require('./validators/FilenameValidator'),
    LengthValidator: require('./validators/LengthValidator'),
    NotNullValidator: require('./validators/NotNullValidator'),
    NumericValidator: require('./validators/NumericValidator')
  }

}

module.exports = FormBuilder;