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
    Date: require('./controls/Date'),
    DateTime: require('./controls/DateTime'),
    Dropdown: require('./controls/Dropdown'),
    File: require('./controls/File'),
    Hidden: require('./controls/Hidden'),
    MultiSelect: require('./controls/MultiSelect'),
    NestedGroup: require('./controls/NestedGroup'),
    NestedFormGroup: require('./controls/NestedFormGroup'),
    Number: require('./controls/Number'),
    Password: require('./controls/Password'),
    RadioButtons: require('./controls/RadioButtons'),
    TextArea: require('./controls/TextArea'),
    Text: require('./controls/Text'),
    MultiTypeAhead: require('./controls/MultiTypeAhead'),
    TypeAhead: require('./controls/TypeAhead'),
    Markdown: require('./controls/Markdown')

  },
  Validators: {
    Filename: require('./validators/Filename'),
    Length: require('./validators/Length'),
    NotNull: require('./validators/NotNull'),
    Numeric: require('./validators/Numeric')
  }

}

module.exports = FormBuilder;
