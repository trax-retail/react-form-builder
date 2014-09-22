var FormDispatcher = require("../dispatchers/FormDispatcher");
var FormConstants = require("../constants/FormConstants");

var FormActions = {
  updateFormData: function(options) {
    FormDispatcher.handleViewAction({
      type: FormConstants.UPDATE_FORM_DATA,
      formId: options.formId,
      dataKey: options.dataKey,
      dataType: options.dataType,
      value: options.value,
      validators: options.validators
    });
  }
};

module.exports = FormActions;