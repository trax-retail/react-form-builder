FormBuilder = {

  Containers: {
    Form: require('./containers/Form'),
    DynamicDefinition: require('./containers/DynamicDefinition'),
    Group: require('./containers/Group'),
    InputGroup: require('./containers/InputGroup')

    Mixins: {
      Parser: require("./containers/mixins/Parser"),
      Handler: require("./containers/mixins/Handler")
    }
  },

  Controls: {

    Mixins: {
      DataSourced: require('./controls/mixins/DataSourced'),
      DataTypeConversion: require('./controls/mixins/DataTypeConversion'),
      DisableOnSubmit: require('./controls/mixins/DisableOnSubmit'),
      Help: require('./controls/mixins/Help'),
      SingleInput: require('./controls/mixins/SingleInput'),
      StandardErrorDisplay: require('./controls/mixins/StandardErrorDisplay'),
      Validation: require('./controls/mixins/Validation'),
      Confirmation: require('./controls/mixins/Confirmation')

    },

    Checkbox: require('./controls/Checkbox'),
    DateField: require('./controls/DateField'),
    DateTimeField: require('./controls/DateTimeField'),
    DropdownField: require('./controls/DropdownField'),
    FileSelect: require('./controls/FileSelect'),
    HiddenField: require('./controls/HiddenField'),
    MultipleSelect: require('./controls/MultipleSelect'),
    NestedField: require('./controls/NestedField'),
    NestedFieldGroup: require('./controls/NestedFieldGroup'),
    NestedFormGroup: require('./controls/NestedFormGroup'),
    NumberField: require('./controls/NumberField'),
    PasswordField: require('./controls/PasswordField'),
    RadioButtons: require('./controls/RadioButtons'),
    TextArea: require('./controls/TextArea'),
    TextField: require('./controls/TextField'),
    MultiTypeAheadField: require('./controls/MultiTypeAheadField'),
    TypeAheadField: require('./controls/TypeAheadField'),
    MarkdownField: require('./controls/MarkdownField')

  },
  Validators: {
    Filename: require('./validators/Filename'),
    Length: require('./validators/Length'),
    NotNull: require('./validators/NotNull'),
    Numeric: require('./validators/Numeric')
  }

}

module.exports = FormBuilder;
