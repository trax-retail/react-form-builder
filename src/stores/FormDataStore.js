var FormDispatcher = require('../dispatchers/FormDispatcher');
var EventEmitter = require('events').EventEmitter;
var FormConstants = require('../constants/FormConstants');
var merge = require('react/lib/merge');

var CHANGE_EVENT = 'change';

_formsData = {};

function updateFormData(formId, dataKey, value) {
  var parts, data, i, propertyName;
  if(dataKey) {
    return _formsData[formId][dataKey] = value;
  }
  else {
    throw("Unexpected dataKey");
  }
};

var FormDataStore = merge(EventEmitter.prototype, {

  initialize: function(formId, formData) {
    if(formData === undefined) formData = {};
    return _formsData[formId] = formData;
  },

  getFormData: function(formId) {
    return _formsData[formId];
  },

  emitChange: function() {
    this.emit(CHANGE_EVENT);
  },

  addChangeListener: function(callback) {
    this.on(CHANGE_EVENT, callback);
  },

  removeChangeListener: function(callback) {
    this.removeListener(CHANGE_EVENT, callback);
  }
});

// Register to handle all updates
FormDispatcher.register(function(payload) {
  var action = payload.action;

  switch(action.type) {
    case FormConstants.UPDATE_FORM_DATA:
      updateFormData(action.formId, action.dataKey, action.value);
      break;

    default:
      return true;
  }

  FormDataStore.emitChange();

  return true; // No errors.  Needed by promise in Dispatcher.
});

module.exports = FormDataStore;