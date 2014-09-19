var FormDispatcher = require("../dispatchers/FormDispatcher");
var FormConstants = require("../constants/FormConstants");

var FormActions = {
  updateFormData: function(formId, dataKey, value, validators) {
    FormDispatcher.handleViewAction({
      type: FormConstants.UPDATE_FORM_DATA,
      formId: formId,
      dataKey: dataKey,
      value: value,
      validators: validators
    });
  }
};

module.exports = FormActions;